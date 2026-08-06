kind: cmake
description: plasma-pa - Plasma PulseAudio integration

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/kdoctools.bst
- freedesktop-sdk.bst:components/libpulse.bst
- kde/libs/pulseaudio-qt.bst
- kde/plasma/libplasma.bst
- kde/libs/libcanberra.bst

- kde/frameworks/kirigami.bst
- kde/libs/kirigami-addons.bst
- kde/frameworks/kitemmodels.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kdeclarative.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kstatusnotifieritem.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/ksvg.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kwindowsystem.bst
variables:
  cmake-local: >-
    -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
    -DBUILD_TESTING=OFF
    -DBUILD_HTML_DOCS=OFF
    -DBUILD_DOC=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:plasma/plasma-pa.git
  track: master
  ref: v6.6.90-13-gf600f19fd33feb38d00f8b279707121f3ea60912
