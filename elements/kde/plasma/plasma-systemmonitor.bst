kind: cmake
description: plasma-systemmonitor - KDE system monitor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

- kde/frameworks/kirigami.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kio.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/knewstuff.bst
- kde/frameworks/kitemmodels.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kpackage.bst
variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DCMAKE_DISABLE_FIND_PACKAGE_ksystemstats=ON
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/plasma-systemmonitor.git
  track: Plasma/6.6
  ref: 72c0618fe230d301a6b0eb7b6ada9ef639c1ced9
