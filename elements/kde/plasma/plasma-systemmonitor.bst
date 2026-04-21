kind: cmake
description: plasma-systemmonitor - KDE system monitor

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst

- kde/frameworks/kirigami.bst
variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/plasma-systemmonitor.git
  track: Plasma/6.6
  ref: 72c0618fe230d301a6b0eb7b6ada9ef639c1ced9
