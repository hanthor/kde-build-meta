kind: cmake
description: ksvg

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtsvg.bst
- kde/frameworks/karchive.bst
- kde/frameworks/ki18n.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/ksvg.git
  track: v6.22.0
  ref: c17130897693ca23aace871ae14020979c39ca61
