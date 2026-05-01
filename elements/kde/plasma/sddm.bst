kind: cmake
description: sddm - Simple Desktop Display Manager

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- freedesktop-sdk.bst:components/pkg-config.bst
- freedesktop-sdk.bst:components/shadow.bst
- freedesktop-sdk.bst:components/systemd.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qttools.bst

depends:
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/systemd-libs.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DENABLE_JOURNALD=ON
    -DNO_SYSTEMD=OFF
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_WITH_QT6=ON
    -DQt6_DIR=/usr/lib/cmake/Qt6
    -DQt5_FIND_QUIETLY=ON
    -DCMAKE_FIND_DEBUG_MODE=FALSE

sources:
- kind: git_repo
  url: github:sddm/sddm.git
  track: v0.21.0
  ref: v0.21.0-0-g63780fcd79f1dbf81a30eef48c28c699ab15aded

