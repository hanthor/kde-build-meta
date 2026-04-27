kind: cmake
description: plasma-desktop

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- kde/frameworks/kdoctools.bst
- freedesktop-sdk.bst:components/libpulse.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
# - kde/plasma/kwin.bst  # Disabled: X11 dependencies
- kde/plasma/kscreenlocker.bst
- kde/plasma/plasma-workspace.bst
- kde/plasma/libplasma.bst
- kde/plasma/plasma-activities.bst
- kde/plasma/plasma-activities-stats.bst
- kde/plasma/plasma5support.bst
- kde/plasma/libksysguard.bst
- kde/libs/libcanberra.bst

- kde/frameworks/kirigami.bst
- kde/frameworks/kitemmodels.bst
- kde/frameworks/kded.bst
- kde/frameworks/baloo.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtwayland.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/knewstuff.bst
- kde/frameworks/kio.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/knotifyconfig.bst
- kde/frameworks/attica.bst
- kde/frameworks/krunner.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/sonnet.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/ksvg.bst
- kde/frameworks/kcolorscheme.bst

- freedesktop-sdk.bst:components/mesa-headers.bst
variables:
  cmake-local: >-
    -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
    -DBUILD_TESTING=OFF
    -DBUILD_HTML_DOCS=OFF
    -DBUILD_MAN_DOCS=OFF
    -DBUILD_QTHELP_DOCS=OFF
    -DBUILD_DOC=OFF
    -DBUILD_PYTHON_BINDINGS=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DBUILD_QT5=OFF
    -DBUILD_WITH_QT6=ON
    -DQT_MAJOR_VERSION=6
    -DBUILD_KCM_TABLET=OFF

sources:
- kind: git_repo
  url: kde:plasma/plasma-desktop.git
  track: Plasma/6.6
  ref: 304d1725320facc693f6e102c730a0e8e40c757b
