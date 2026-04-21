kind: cmake
description: plasma-workspace

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/baloo.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- kde/frameworks/networkmanager-qt.bst
- kde/frameworks/plasma-wayland-protocols.bst
- kde/libs/qcoro.bst
- kde/qt6/qt6-qtbase.bst
# System libs
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/pipewire-daemon.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
# Plasma inter-deps
- kde/plasma/kwin.bst
- kde/plasma/kscreenlocker.bst
- kde/plasma/layer-shell-qt.bst
- kde/plasma/libkscreen.bst
- kde/plasma/libplasma.bst
- kde/plasma/kwayland.bst
- kde/plasma/plasma-activities.bst
- kde/plasma/plasma-activities-stats.bst
- kde/plasma/plasma5support.bst
- kde/plasma/libksysguard.bst
- kde/plasma/kpipewire.bst
- kde/plasma/knighttime.bst
- kde/libs/libcanberra.bst

variables:
  cmake-local: >-
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
  url: kde:plasma/plasma-workspace.git
  track: Plasma/6.6
  ref: 708f21c169b546edbc30510192eb1d55ff505fdc
