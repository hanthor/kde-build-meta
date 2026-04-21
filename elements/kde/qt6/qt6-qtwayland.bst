kind: cmake
description: Qt6 Wayland module

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/wayland-protocols.bst

sources:
- kind: tar
  url: qt:6.9/6.9.3/submodules/qtwayland-everywhere-src-6.9.3.tar.xz
  ref: e413d4bc9263e80a465761debf8cb8317aa6b01e814b20046a05258e6573dadd
