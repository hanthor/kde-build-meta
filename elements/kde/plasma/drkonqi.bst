kind: cmake
description: drkonqi - KDE crash handler

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kio.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kwallet.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/kidletime.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/syntax-highlighting.bst
- kde/frameworks/kstatusnotifieritem.bst
- kde/libs/polkit-qt-1.bst
- kde/frameworks/kirigami.bst
- kde/frameworks/kitemmodels.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/drkonqi.git
  track: Plasma/6.6
  ref: b4c1e9ccab90b2cf51edf4c0026cc8715fd1ac19
