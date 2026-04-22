kind: cmake
description: gwenview - KDE image viewer

build-depends:
- freedesktop-sdk.bst:components/wayland-protocols.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtsvg.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/baloo.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kfilemetadata.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kio.bst
- kde/frameworks/kitemmodels.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kparts.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kauth.bst
- kde/frameworks/solid.bst
- kde/frameworks/breeze-icons.bst
- kde/frameworks/kglobalaccel.bst
- kde/plasma/plasma-activities.bst
- kde/libs/phonon.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DCMAKE_DISABLE_FIND_PACKAGE_KF6DocTools=ON
    -DGWENVIEW_SEMANTICINFO_BACKEND=None

sources:
- kind: git_repo
  url: kde:graphics/gwenview.git
  track: release/25.04
  ref: 5c5fb0973378eeeb3a7bb075b69523e7d4504a8f
