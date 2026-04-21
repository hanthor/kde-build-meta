kind: cmake
description: ksvg

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- kde/qt6/qt6-qtsvg.bst
- kde/frameworks/karchive.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kguiaddons.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/kirigami.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/ksvg.git
  track: v6.22.0
  ref: c17130897693ca23aace871ae14020979c39ca61
