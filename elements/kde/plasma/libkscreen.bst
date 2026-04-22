kind: cmake
description: libkscreen

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/plasma-wayland-protocols.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qttools.bst
- kde/qt6/qt6-qtwayland.bst
- freedesktop-sdk.bst:components/wayland.bst

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
    -DCMAKE_DISABLE_FIND_PACKAGE_XCB=ON

sources:
- kind: git_repo
  url: kde:plasma/libkscreen.git
  track: Plasma/6.6
  ref: 19a51032795e026cb5c3a04293242dcf364a9a77
- kind: patch
  path: patches/libkscreen/0001-optional-xcb-dpms.patch
