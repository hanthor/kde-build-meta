kind: cmake
description: kxmlgui

depends:
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kiconwidgets.bst

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kiconwidgets.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kcolorscheme.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kxmlgui.git
  track: v6.22.0
  ref: cc8ef30b396de591ca0cc261a4776d56c2615bc1
