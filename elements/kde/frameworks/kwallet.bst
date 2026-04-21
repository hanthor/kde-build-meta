kind: cmake
description: kwallet

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qttools.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kcoreaddons.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/libgcrypt.bst
- kde/frameworks/kdoctools.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kcolorscheme.bst
- sdk/libsecret.bst

variables:
  cmake-local: -DBUILD_TESTING=OFF -DBUILD_PYTHON_BINDINGS=OFF -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON -DBUILD_KSECRETD=OFF

sources:
- kind: git_repo
  url: kde:frameworks/kwallet.git
  track: v6.22.0
  ref: aee55db955c86fd829b4c4b7d3a8de6757b4a5c9
