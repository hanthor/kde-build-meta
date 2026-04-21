kind: cmake
description: knotifications

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qttools.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcoreaddons.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:frameworks/knotifications.git
  track: v6.22.0
  ref: a335d7880124bc21a4b9d8a9367fd1a93f8ea0f8
