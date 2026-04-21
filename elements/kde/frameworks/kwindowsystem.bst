kind: cmake
description: kwindowsystem

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst
- kde/frameworks/plasma-wayland-protocols.bst
- kde/qt6/qt6-qtwayland.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF -DKWINDOWSYSTEM_X11=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kwindowsystem.git
  track: v6.22.0
  ref: ad68ea2cc4205c524d1766b457a7c5eec2bf9bbf
