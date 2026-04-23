kind: cmake
description: plasma-integration

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/plasma-wayland-protocols.bst
- freedesktop-sdk.bst:components/wayland.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kio.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/kstatusnotifieritem.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DBUILD_HTML_DOCS=OFF
    -DBUILD_MAN_DOCS=OFF
    -DBUILD_QTHELP_DOCS=OFF
    -DBUILD_DOC=OFF
    -DBUILD_PYTHON_BINDINGS=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DBUILD_QT5=OFF
    -DBUILD_WITH_QT6=ON
    -DQT_MAJOR_VERSION=6
    -DWITH_X11=OFF

sources:
- kind: git_repo
  url: kde:plasma/plasma-integration.git
  track: Plasma/6.6
  ref: 9588bd0ea75a7a166352cb27f9e284f5902adcfa
