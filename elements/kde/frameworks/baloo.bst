kind: cmake
description: baloo

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/frameworks/kio.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kidletime.bst
- kde/frameworks/solid.bst
- kde/frameworks/kfilemetadata.bst
- kde/frameworks/kcrash.bst

depends:
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/frameworks/kio.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF

sources:
- kind: git_repo
  url: kde:frameworks/baloo.git
  track: v6.22.0
  ref: e14a102aaf956030181821bfd93c11ce2981e529
