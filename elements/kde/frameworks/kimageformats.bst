kind: cmake
description: kimageformats

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/karchive.bst
- freedesktop-sdk.bst:components/libjxl.bst

depends:
- freedesktop-sdk.bst:components/libjxl.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kimageformats.git
  track: master
  ref: v6.27.0-rc1-12-ge6bc1af5e4773ed04a5f5cb16a27ed723bba5199
