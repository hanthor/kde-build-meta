kind: cmake
description: kdeconnect - KDE Connect device integration

build-depends:
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kpackage.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/libs/kirigami-addons.bst
- kde/frameworks/kirigami.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kitemmodels.bst
- kde/frameworks/kstatusnotifieritem.bst
- kde/frameworks/kio.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/knotifications.bst
- freedesktop-sdk.bst:components/dbus.bst
- kde/qt6/qt6-qtmultimedia.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DWITH_PULSEAUDIO=OFF
    -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:network/kdeconnect-kde.git
  track: release/25.04
  ref: cb53c0cf5e7428e8d7c38d02903e06f371431ae5
- kind: patch
  path: patches/kdeconnect/0001-make-kpeople-optional.patch
