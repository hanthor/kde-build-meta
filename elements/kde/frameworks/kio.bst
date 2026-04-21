kind: cmake
description: kio

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kservice.bst
- kde/frameworks/solid.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kcodecs.bst

depends:
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kservice.bst
- kde/frameworks/solid.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kcodecs.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kio.git
  track: v6.22.0
  ref: 1f471941c4be1de739322ed302266aea85de68c7
