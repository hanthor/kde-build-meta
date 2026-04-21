kind: cmake
description: kiconthemes

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- kde/qt6/qt6-qtsvg.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/karchive.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/breeze-icons.bst
- kde/qt6/qt6-qtwayland.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kiconthemes.git
  track: v6.22.0
  ref: af4f77d4e19aeab9be438fdac6d4684955da67e6
