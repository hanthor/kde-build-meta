#!/usr/bin/env python3
"""Audit KDE BST elements against Arch PKGBUILDs and add missing build-depends."""

import os
import re
import sys
import urllib.request
import urllib.error
from concurrent.futures import ThreadPoolExecutor, as_completed

BASE = "/var/home/james/dev/kde-build-meta/elements/kde"

# ── Mapping from Arch makedepend → BST element path ───────────────────────────
def arch_dep_to_bst(dep):
    """Return BST element path or None if should be skipped."""
    dep = dep.strip().split(">")[0].split("<")[0].split("=")[0].strip()  # strip version

    # Always skip
    SKIP = {
        "cmake","extra-cmake-modules","qt6-base","gcc","g++","make","ninja",
        "pkg-config","pkgconf","clang","git","intltool","gettext","python",
        "python3","doxygen","graphviz","dot","hicolor-icon-theme",
        "desktop-file-utils","xdg-utils","weston","shared-mime-info",
        "dbus","accountsservice","udisks2","upower","modemmanager",
        "sddm-qt6","kdsoap-qt6","libei","xorg-xwayland","taglib","exiv2",
        "libraw","kpmcore","xdg-desktop-portal","gst-plugins-base",
        "gst-plugins-good","gst-plugins-bad","libcanberra-gstreamer",
        "appstream","appstream-qt","discount","qrencode",
    }
    if dep in SKIP: return None
    if dep.startswith("python-") or dep.startswith("python2"): return None
    if dep.startswith("gst-plugins-"): return None

    # X11 skip
    X11 = {"libx11","libxcb","libxi","libxext","libxfixes","libxrender",
           "libxtst","libxt","libxss","libxcursor","libxrandr","libxinerama",
           "libxcomposite","libxdamage","libsm","libice","libxkbfile",
           "xorg-server","xorg-server-devel"}
    if dep in X11 or dep.startswith("xcb-util"): return None

    # Qt6 modules (qt6-base is always present, skip)
    qt6_map = {
        "qt6-declarative": "kde/qt6/qt6-qtdeclarative.bst",
        "qt6-wayland":     "kde/qt6/qt6-qtwayland.bst",
        "qt6-tools":       "kde/qt6/qt6-qttools.bst",
        "qt6-svg":         "kde/qt6/qt6-qtsvg.bst",
        "qt6-speech":      "kde/qt6/qt6-qtspeech.bst",
        "qt6-multimedia":  "kde/qt6/qt6-qtmultimedia.bst",
        "qt6-shadertools": "kde/qt6/qt6-qtshadertools.bst",
        "qt6-5compat":     "kde/qt6/qt6-qt5compat.bst",
        "qt6-positioning": "kde/qt6/qt6-qtpositioning.bst",
        "qt6-sensors":     "kde/qt6/qt6-qtsensors.bst",
        "qt6-webchannel":  "kde/qt6/qt6-webchannel.bst",
        "qt6-websockets":  "kde/qt6/qt6-qtwebsockets.bst",
        "qt6-connectivity":"kde/qt6/qt6-qtconnectivity.bst",
        "qt6-location":    "kde/qt6/qt6-qtlocation.bst",
        "qt6-serialport":  "kde/qt6/qt6-qtserialport.bst",
        "qt6-remoteobjects":"kde/qt6/qt6-qtremoteobjects.bst",
        "qt6-networkauth": "kde/qt6/qt6-qtnetworkauth.bst",
        "qt6-3d":          "kde/qt6/qt6-qt3d.bst",
        "qt6-imageformats":"kde/qt6/qt6-qtimageformats.bst",
        "qt6-charts":      "kde/qt6/qt6-qtcharts.bst",
        "qt6-quick3d":     "kde/qt6/qt6-qtquick3d.bst",
        "qt6-scxml":       "kde/qt6/qt6-qtscxml.bst",
    }
    if dep == "qt6-base": return None  # always present
    if dep in qt6_map: return qt6_map[dep]
    if dep.startswith("qt6-"): return None  # unknown qt6, skip

    # System libs
    sys_map = {
        "udev":              "freedesktop-sdk.bst:components/systemd-libs.bst",
        "systemd-libs":      "freedesktop-sdk.bst:components/systemd-libs.bst",
        "systemd":           "freedesktop-sdk.bst:components/systemd-libs.bst",
        "libmount":          "freedesktop-sdk.bst:components/util-linux.bst",
        "util-linux":        "freedesktop-sdk.bst:components/util-linux.bst",
        "util-linux-libs":   "freedesktop-sdk.bst:components/util-linux.bst",
        "bison":             "freedesktop-sdk.bst:components/bison.bst",
        "flex":              "freedesktop-sdk.bst:components/flex.bst",
        "wayland":           "freedesktop-sdk.bst:components/wayland.bst",
        "wayland-protocols": "freedesktop-sdk.bst:components/wayland-protocols.bst",
        "libxkbcommon":      "freedesktop-sdk.bst:components/libxkbcommon.bst",
        "libpng":            "freedesktop-sdk.bst:components/libpng.bst",
        "libjpeg-turbo":     "freedesktop-sdk.bst:components/libjpeg.bst",
        "libjpeg":           "freedesktop-sdk.bst:components/libjpeg.bst",
        "giflib":            "freedesktop-sdk.bst:components/giflib.bst",
        "openssl":           "freedesktop-sdk.bst:components/openssl.bst",
        "zlib":              "freedesktop-sdk.bst:components/zlib.bst",
        "lz4":               "freedesktop-sdk.bst:components/lz4.bst",
        "zstd":              "freedesktop-sdk.bst:components/zstd.bst",
        "networkmanager":    "freedesktop-sdk.bst:components/networkmanager.bst",
        "polkit":            "freedesktop-sdk.bst:components/polkit.bst",
        "linux-pam":         "freedesktop-sdk.bst:components/linux-pam-base.bst",
        "pam":               "freedesktop-sdk.bst:components/linux-pam-base.bst",
        "glib2":             "freedesktop-sdk.bst:components/glib.bst",
        "fontconfig":        "freedesktop-sdk.bst:components/fontconfig.bst",
        "freetype2":         "freedesktop-sdk.bst:components/freetype.bst",
        "harfbuzz":          "freedesktop-sdk.bst:components/harfbuzz.bst",
        "libarchive":        "freedesktop-sdk.bst:components/libarchive.bst",
        "libsecret":         "freedesktop-sdk.bst:components/libsecret.bst",
        "libcap":            "freedesktop-sdk.bst:components/libcap.bst",
        "docbook-xsl":       "freedesktop-sdk.bst:components/docbook-xsl.bst",
        "docbook-xml":       "freedesktop-sdk.bst:components/docbook-xml.bst",
        "libxslt":           "freedesktop-sdk.bst:components/libxslt.bst",
        "perl":              "freedesktop-sdk.bst:components/perl.bst",
        "boost":             "freedesktop-sdk.bst:components/boost.bst",
        "avahi":             "freedesktop-sdk.bst:components/avahi.bst",
        "libdrm":            "freedesktop-sdk.bst:components/libdrm.bst",
        "mesa":              "freedesktop-sdk.bst:components/mesa.bst",
        "vulkan-headers":    "freedesktop-sdk.bst:components/vulkan-headers.bst",
        "vulkan-icd-loader": "freedesktop-sdk.bst:components/vulkan-icd-loader.bst",
        "pipewire":          "freedesktop-sdk.bst:components/pipewire.bst",
        "libpulse":          "freedesktop-sdk.bst:components/pulseaudio.bst",
        "pulseaudio":        "freedesktop-sdk.bst:components/pulseaudio.bst",
        "alsa-lib":          "freedesktop-sdk.bst:components/alsa-lib.bst",
        "gstreamer":         "freedesktop-sdk.bst:components/gstreamer.bst",
        "cups":              "freedesktop-sdk.bst:components/cups.bst",
        "sqlite":            "freedesktop-sdk.bst:components/sqlite.bst",
        "libepoxy":          "freedesktop-sdk.bst:components/libepoxy.bst",
        "bluez":             "freedesktop-sdk.bst:components/bluez.bst",
        "fftw":              "freedesktop-sdk.bst:components/fftw.bst",
        "libinput":          "freedesktop-sdk.bst:components/libinput.bst",
        "lcms2":             "freedesktop-sdk.bst:components/lcms2.bst",
        "lmdb":              "freedesktop-sdk.bst:components/lmdb.bst",
        "gpgme":             "freedesktop-sdk.bst:components/gpgme.bst",
        "icu":               "freedesktop-sdk.bst:components/icu.bst",
        "attr":              "freedesktop-sdk.bst:components/attr.bst",
        "acl":               "freedesktop-sdk.bst:components/acl.bst",
        "libgcrypt":         "freedesktop-sdk.bst:components/libgcrypt.bst",
        "gperf":             "freedesktop-sdk.bst:components/gperf.bst",
        "libnm":             "freedesktop-sdk.bst:components/networkmanager.bst",
    }
    if dep in sys_map: return sys_map[dep]

    # KDE plasma
    plasma_map = {
        "kscreen":              "kde/plasma/kscreen.bst",
        "kscreenlocker":        "kde/plasma/kscreenlocker.bst",
        "plasma-framework":     "kde/plasma/libplasma.bst",
        "libplasma":            "kde/plasma/libplasma.bst",
        "plasma-workspace":     "kde/plasma/plasma-workspace.bst",
        "xdg-desktop-portal-kde":"kde/plasma/xdg-desktop-portal-kde.bst",
        "sddm":                 "kde/plasma/sddm.bst",
        "breeze":               "kde/plasma/breeze.bst",
        "layer-shell-qt":       "kde/plasma/layer-shell-qt.bst",
        "kdecoration":          "kde/plasma/kdecoration.bst",
        "kwin":                 "kde/plasma/kwin.bst",
        "kwayland":             "kde/plasma/kwayland.bst",
        "libkscreen":           "kde/plasma/libkscreen.bst",
        "libksysguard":         "kde/plasma/libksysguard.bst",
        "kpipewire":            "kde/plasma/kpipewire.bst",
        "plasma5support":       "kde/plasma/plasma5support.bst",
        "plasma-nano":          "kde/plasma/plasma-nano.bst",
        "bluedevil":            "kde/plasma/bluedevil.bst",
        "drkonqi":              "kde/plasma/drkonqi.bst",
        "kglobalacceld":        "kde/plasma/kglobalacceld.bst",
        "aurorae":              "kde/plasma/aurorae.bst",
        "spectacle":            "kde/plasma/spectacle.bst",
        "milou":                "kde/plasma/milou.bst",
        "konsole":              "kde/plasma/konsole.bst",
        "kactivities":          "kde/plasma/plasma-activities.bst",
        "plasma-activities":    "kde/plasma/plasma-activities.bst",
        "plasma-activities-stats":"kde/plasma/plasma-activities-stats.bst",
        "kio-admin":            "kde/plasma/kio-admin.bst",
        "plasma-integration":   "kde/plasma/plasma-integration.bst",
        "systemsettings":       "kde/plasma/systemsettings.bst",
    }
    if dep in plasma_map: return plasma_map[dep]

    # KDE libs
    libs_map = {
        "libcanberra":       "kde/libs/libcanberra.bst",
        "phonon-qt6":        "kde/libs/phonon.bst",
        "polkit-qt-1":       "kde/libs/polkit-qt-1.bst",
        "qtkeychain-qt6":    "kde/libs/qtkeychain-qt6.bst",
        "poppler":           "kde/libs/poppler-qt6.bst",
        "poppler-qt6":       "kde/libs/poppler-qt6.bst",
        "qcoro-qt6":         "kde/libs/qcoro.bst",
        "qcoro":             "kde/libs/qcoro.bst",
        "kuserfeedback":     "kde/frameworks/kuserfeedback.bst",
        "libqaccessibilityclient":"kde/libs/libqaccessibilityclient.bst",
        "kquickimageeditor": "kde/libs/kquickimageeditor.bst",
    }
    if dep in libs_map: return libs_map[dep]

    # KDE apps
    apps_map = {
        "kdeconnect": "kde/apps/kdeconnect.bst",
        "ark":        "kde/apps/ark.bst",
        "dolphin":    "kde/apps/dolphin.bst",
        "elisa":      "kde/apps/elisa.bst",
        "gwenview":   "kde/apps/gwenview.bst",
        "kate":       "kde/apps/kate.bst",
        "okular":     "kde/apps/okular.bst",
    }
    if dep in apps_map: return apps_map[dep]

    # KDE frameworks - strip kf6- prefix
    fw_name = dep
    if fw_name.startswith("kf6-"):
        fw_name = fw_name[4:]

    FRAMEWORKS = {
        "attica","baloo","bluez-qt","breeze-icons","extra-cmake-modules",
        "frameworkintegration","karchive","kauth","kbookmarks","kcalendarcore",
        "kcmutils","kcodecs","kcolorscheme","kcompletion","kconfig",
        "kconfigwidgets","kcontacts","kcoreaddons","kcrash","kdav",
        "kdbusaddons","kdeclarative","kded","kdnssd","kdoctools",
        "kfilemetadata","kglobalaccel","kguiaddons","kholidays","ki18n",
        "kiconthemes","kidletime","kimageformats","kio","kirigami",
        "kitemmodels","kitemviews","kjobwidgets","knewstuff","knotifications",
        "knotifyconfig","kpackage","kparts","kplotting","kpty","kquickcharts",
        "krunner","kservice","kstatusnotifieritem","ksvg","ktexteditor",
        "ktexttemplate","ktextwidgets","kunitconversion","kuserfeedback",
        "kwallet","kwidgetsaddons","kwindowsystem","kxmlgui",
        "modemmanager-qt","networkmanager-qt","plasma-wayland-protocols",
        "prison","purpose","qqc2-desktop-style","solid","sonnet",
        "syndication","syntax-highlighting","threadweaver",
    }
    if fw_name in FRAMEWORKS:
        return f"kde/frameworks/{fw_name}.bst"

    return None  # unknown, skip

# ── Fetch PKGBUILD ──────────────────────────────────────────────────────────────
def fetch_pkgbuild(pkg_name):
    url = f"https://gitlab.archlinux.org/archlinux/packaging/packages/{pkg_name}/-/raw/main/PKGBUILD"
    try:
        with urllib.request.urlopen(url, timeout=15) as r:
            return r.read().decode("utf-8", errors="replace")
    except Exception:
        return None

def parse_makedepends(pkgbuild_text):
    """Extract makedepends from PKGBUILD text."""
    if not pkgbuild_text:
        return set()
    deps = set()
    # Find makedepends=(...) blocks (may span multiple lines)
    for m in re.finditer(r'makedepends(?:_[a-z]+)?\s*=\s*\(([^)]*)\)', pkgbuild_text, re.DOTALL):
        block = m.group(1)
        for token in re.split(r'[\s\n]+', block):
            token = token.strip().strip("'\"")
            if token:
                # Strip version constraints
                token = re.split(r'[><=]', token)[0].strip()
                if token:
                    deps.add(token)
    return deps

def parse_build_depends(content):
    """Extract build-depends list from BST file content."""
    m = re.search(r'^build-depends:\n((?:- .+\n)*)', content, re.MULTILINE)
    if not m:
        return []
    lines = []
    for line in m.group(1).split('\n'):
        line = line.strip()
        if line.startswith('- '):
            lines.append(line[2:].strip())
    return lines

# ── Element list ──────────────────────────────────────────────────────────────
def get_elements():
    elements = []
    for d in ["frameworks", "plasma", "apps", "libs"]:
        path = os.path.join(BASE, d)
        for fname in sorted(os.listdir(path)):
            if fname.endswith(".bst"):
                elements.append((d, fname, os.path.join(path, fname)))
    return elements

# ── Arch package name for a BST element ──────────────────────────────────────
def arch_pkg_name(category, fname):
    name = fname[:-4]  # strip .bst
    if category == "frameworks":
        # special cases
        special = {
            "extra-cmake-modules": "extra-cmake-modules",
            "breeze-icons":        "breeze-icons",
            "plasma-wayland-protocols": "plasma-wayland-protocols",
            "kirigami":            "kf6-kirigami",
            "frameworkintegration":"kf6-frameworkintegration",
            "networkmanager-qt":   "kf6-networkmanager-qt",
            "modemmanager-qt":     "kf6-modemmanager-qt",
            "bluez-qt":            "kf6-bluez-qt",
            "kuserfeedback":       "kuserfeedback",
        }
        if name in special:
            return special[name]
        return f"kf6-{name}"
    elif category == "plasma":
        return name
    elif category == "apps":
        return name
    elif category == "libs":
        lib_map = {
            "libcanberra":        "libcanberra",
            "phonon":             "phonon-qt6",
            "polkit-qt-1":        "polkit-qt-1",
            "poppler-qt6":        "poppler",
            "qcoro":              "qcoro-qt6",
            "qtkeychain-qt6":     "qtkeychain-qt6",
            "kquickimageeditor":  "kquickimageeditor",
            "libqaccessibilityclient": "libqaccessibilityclient-qt6",
            "perl-uri":           "perl-uri",
        }
        return lib_map.get(name, name)
    return name

# ── Main ─────────────────────────────────────────────────────────────────────
elements = get_elements()
print(f"Found {len(elements)} elements", flush=True)

# Build Arch package name list
pkg_names = [(cat, fname, fpath, arch_pkg_name(cat, fname)) for cat, fname, fpath in elements]

# Fetch all PKGBUILDs in parallel
print("Fetching PKGBUILDs...", flush=True)
pkgbuild_cache = {}

def fetch_one(item):
    cat, fname, fpath, pkgname = item
    text = fetch_pkgbuild(pkgname)
    return (cat, fname, fpath, pkgname, text)

with ThreadPoolExecutor(max_workers=30) as ex:
    futures = {ex.submit(fetch_one, item): item for item in pkg_names}
    done = 0
    for fut in as_completed(futures):
        cat, fname, fpath, pkgname, text = fut.result()
        pkgbuild_cache[(cat, fname)] = (pkgname, text)
        done += 1
        if done % 20 == 0:
            print(f"  {done}/{len(pkg_names)} fetched", flush=True)

print("Done fetching. Computing diffs...", flush=True)

# Compute missing deps and collect edits
edits = {}  # fpath -> list of deps to add
missing_summary = []

for cat, fname, fpath in elements:
    pkgname, pkgbuild_text = pkgbuild_cache.get((cat, fname), (None, None))
    
    with open(fpath) as f:
        content = f.read()
    
    current_deps = set(parse_build_depends(content))
    
    if pkgbuild_text is None:
        print(f"  SKIP (no PKGBUILD): {cat}/{fname} (tried: {pkgname})", flush=True)
        continue
    
    makedeps = parse_makedepends(pkgbuild_text)
    
    needed = []
    for dep in sorted(makedeps):
        bst = arch_dep_to_bst(dep)
        if bst and bst not in current_deps:
            needed.append(bst)
    
    if needed:
        edits[fpath] = (content, needed, current_deps)
        missing_summary.append(f"{cat}/{fname}: +{needed}")

print(f"\nElements needing edits: {len(edits)}")
for s in missing_summary:
    print(f"  {s}")

# Apply edits
print("\nApplying edits...", flush=True)

def insert_deps_into_bst(content, new_deps):
    """Insert new_deps into the build-depends section, sorted appropriately."""
    # Find the build-depends block
    m = re.search(r'^(build-depends:\n)((?:- .+\n)*)', content, re.MULTILINE)
    if not m:
        print("WARNING: no build-depends block found!")
        return content, False
    
    existing_lines = []
    for line in m.group(2).split('\n'):
        line_stripped = line.strip()
        if line_stripped.startswith('- '):
            existing_lines.append(line_stripped[2:].strip())
    
    # Combine existing + new, sort: freedesktop-sdk first, then kde/
    all_deps = set(existing_lines) | set(new_deps)
    
    fds_deps = sorted(d for d in all_deps if d.startswith("freedesktop-sdk.bst:"))
    kde_deps = sorted(d for d in all_deps if d.startswith("kde/"))
    other_deps = sorted(d for d in all_deps if not d.startswith("freedesktop-sdk.bst:") and not d.startswith("kde/"))
    
    new_block_lines = "\n".join(f"- {d}" for d in fds_deps + kde_deps + other_deps)
    new_block = f"build-depends:\n{new_block_lines}\n"
    
    old_block = m.group(0)
    new_content = content[:m.start()] + new_block + content[m.end():]
    return new_content, True

applied = 0
for fpath, (content, new_deps, current_deps) in edits.items():
    new_content, ok = insert_deps_into_bst(content, new_deps)
    if ok:
        with open(fpath, 'w') as f:
            f.write(new_content)
        applied += 1
        print(f"  Edited: {os.path.relpath(fpath, BASE)}", flush=True)

print(f"\nApplied edits to {applied} files.")
