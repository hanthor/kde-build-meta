kind: cmake
description: ksshaskpass - SSH password dialog for KDE

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/kdoctools.bst

variables:
  cmake-local: >- -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/ksshaskpass.git
  track: Plasma/6.6
  ref: 25204a5999be268fbdac62dc1ca902ffb8ee7e5c
