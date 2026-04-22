kind: cmake
description: kscreenlocker

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kdoctools.bst
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- kde/plasma/layer-shell-qt.bst
- kde/plasma/libkscreen.bst
- kde/frameworks/plasma-wayland-protocols.bst
- kde/plasma/libplasma.bst
- kde/frameworks/kirigami.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/xcb-util-keysyms.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kio.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kidletime.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/solid.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/ksvg.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtwayland.bst

variables:
  cmake-local: >-
    -DCMAKE_DISABLE_FIND_PACKAGE_X11=ON
    -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
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

sources:
- kind: git_repo
  url: kde:plasma/kscreenlocker.git
  track: Plasma/6.6
  ref: 093598fdf00d069e251cd891e26998df933cbfed
- kind: patch
  path: patches/kscreenlocker/0001-optional-x11.patch
- kind: local
  path: patches/kscreenlocker/override
