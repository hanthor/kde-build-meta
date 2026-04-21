kind: cmake
description: frameworkintegration

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/ki18n.bst
- freedesktop-sdk.bst:components/mesa-headers.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: kde:frameworks/frameworkintegration.git
  track: v6.22.0
  ref: ac3d6438eea174f9cadd3e641ce9f938d282ca02
