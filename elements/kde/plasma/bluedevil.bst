kind: cmake
description: bluedevil - KDE Bluetooth stack

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/kdoctools.bst
- kde/plasma/libplasma.bst

- kde/frameworks/kirigami.bst
variables:
  cmake-local: >-
    -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/bluedevil.git
  track: Plasma/6.6
  ref: 50ebb1cc773182f1e71ff11aaee211434e3635e3
