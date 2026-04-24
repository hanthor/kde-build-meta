# KDE Build Metadata

KDE Build Metadata is a collection of BuildStream elements for building KDE Plasma 6 and related packages.
It follows the same architecture as GNOME's `gnome-build-meta`, adapted for KDE.

## Overview

This repository contains `.bst` element definitions for:

| Category | Elements | Description |
|----------|----------|-------------|
| **Qt6** | 29 | Qt 6 base, declarative, and related modules |
| **Frameworks** | 69 | KDE Frameworks 6 (kcoreaddons, kio, kirigami, etc.) |
| **Libs** | 7 | Additional KDE libraries |
| **Plasma** | 40 | KDE Plasma 6 (plasma-workspace, kwin, sddm, etc.) |
| **Apps** | 7 | KDE Applications (dolphin, konsole, kate, etc.) |

## Architecture

```
hanthor/kde-build-meta
├── elements/
│   ├── kde/
│   │   ├── qt6/           # Qt6 modules
│   │   ├── frameworks/    # KDE Frameworks 6
│   │   ├── libs/          # Additional KDE libraries
│   │   ├── plasma/        # Plasma 6 components
│   │   ├── apps/          # KDE Applications
│   │   ├── deps.bst       # Master KDE deps stack
│   │   ├── org.kde.Sdk.bst
│   │   ├── org.kde.apps.bst
│   │   └── org.kde.plasma.desktop.bst
│   └── freedesktop-sdk.bst  # Junction → freedesktop-sdk
├── project.conf           # Project configuration
├── include/               # Shared includes (aliases.yml)
└── patches/               # Upstream patches
```

## Usage

This repository is designed to be consumed as a BuildStream junction by a top-level project.
See [hanthor/tromso](https://github.com/hanthor/tromso) for the Aurora OCI image that uses this repo.

### Local Development

To build an element locally:

```bash
# Open a workspace for local modifications
bst workspace open --no-checkout kde/plasma/plasma-workspace.bst --directory ../plasma-workspace/

# Build the element
bst build kde/plasma/plasma-workspace.bst

# Get a runtime shell
bst shell kde/plasma/plasma-workspace.bst
```

### Updating the Junction

When updating kde-build-meta in a consuming project:

1. Commit and push changes to this repo
2. Compute the new tarball SHA256:
   ```bash
   SHA=$(git rev-parse --short=7 HEAD)
   curl -sL https://github.com/hanthor/kde-build-meta/archive/${SHA}.tar.gz | sha256sum
   ```
3. Update the junction `.bst` file with new URL, SHA256, and base-dir

## Adding New Elements

### CMake-based KDE Packages

```yaml
# kde/frameworks/example.bst
type: cmake

depends:
- kde/frameworks/extra-cmake-modules.bst

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

source:
  type: https
  url: https://api.github.com/repos/KDE/example/tarball/master

variables:
  cmake-local: -DBUILD_TESTING=OFF
```

### Key Patterns

- **Always include `kde/qt6/qt6-qtbase.bst`** in `build-depends` for Qt6 CMake detection
- **Use `cmake-local`** (not `cmake-options`) for CMake flags
- **KDE framework dependencies needed by CMake** must appear in both `depends:` and `build-depends:`

## References

- **[KDE Linux](https://invent.kde.org/kde-linux/kde-linux)** — authoritative KDE package list
- **[Arch Linux KDE PKGBUILDs](https://github.com/archlinux/svntogit-community/tree/packages/kde-*/trunk/)** — reference for CMake flags
- **[BuildStream Docs](https://docs.buildstream.build/)** — build system documentation
- **[freedesktop-sdk](https://freedesktop-sdk.io/)** — base SDK
