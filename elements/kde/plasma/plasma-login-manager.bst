kind: cmake
description: plasma-login-manager - Plasma Login Manager (SDDM successor)

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qttools.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kio.bst
- kde/frameworks/kcoreaddons.bst
# KCMUtils / KIO / ConfigWidgets pull these in via CMake find_dependency() at
# configure time, so their CMake configs must be present in the sandbox even
# though plasma-login-manager does not use them directly.
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/solid.bst
- kde/frameworks/kirigami.bst
- kde/frameworks/karchive.bst
- kde/frameworks/breeze-icons.bst
# libPlasma (PlasmaQuick) links these, so they must be present when linking
# plasma-login-manager against libPlasma (otherwise: undefined references to
# KSvg::*, KNotificationAction::*, etc.).
- kde/frameworks/ksvg.bst
- kde/frameworks/knotifications.bst
- kde/plasma/plasma-activities.bst
- kde/qt6/qt6-qtwayland.bst
- kde/qt6/qt6-qtsvg.bst
- kde/qt6/qt6-qt5compat.bst
# PlasmaQuick / LibKWorkspace / LibKLookAndFeel / LayerShellQt / KF6Screen
- kde/plasma/libplasma.bst
- kde/plasma/layer-shell-qt.bst
- kde/plasma/plasma-workspace.bst
- kde/plasma/libkscreen.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/xorg-lib-xau.bst

depends:
- freedesktop-sdk.bst:components/dejavu-fonts.bst
- freedesktop-sdk.bst:components/fontconfig.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- freedesktop-sdk.bst:components/xorg-lib-xau.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kio.bst
- kde/frameworks/kcoreaddons.bst
- kde/plasma/libplasma.bst
- kde/plasma/layer-shell-qt.bst
- kde/plasma/plasma-workspace.bst
- kde/plasma/libkscreen.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DINSTALL_PAM_CONFIGURATION=ON
    -DPAM_OS_CONFIGURATION=kde-linux
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: kde:plasma/plasma-login-manager.git
  track: master
  ref: v6.6.90-34-g364783d9d08375d46910011e95f1570fadf24ddc

config:
  install-commands:
    (>):
    # The kde-linux PAM profile includes 'system-login' / 'system-local-login',
    # but this image (freedesktop-sdk based) ships 'system-auth'.  Rewrite the
    # installed PAM files the same way the old sddm.bst element did.  PAM files
    # are installed under /usr/lib/pam.d (immutable /usr) so they survive bootc
    # deployment without the /etc workaround SDDM required.
    - |
      rewrite_pam_includes() {
        pam_file="$1"
        [ -f "$pam_file" ] || return 0

        tmp_file="${pam_file}.tmp"
        : > "$tmp_file"
        while IFS= read -r line || [ -n "$line" ]; do
          line=${line//system-local-login/system-auth}
          line=${line//system-login/system-auth}
          printf '%s\n' "$line" >> "$tmp_file"
        done < "$pam_file"

        install -m 0644 "$tmp_file" "$pam_file"
        rm -f "$tmp_file"
      }

      for pam_file in \
        "%{install-root}%{indep-libdir}/pam.d/plasmalogin" \
        "%{install-root}%{indep-libdir}/pam.d/plasmalogin-autologin" \
        "%{install-root}%{indep-libdir}/pam.d/plasmalogin-greeter"; do
        rewrite_pam_includes "$pam_file"
      done
