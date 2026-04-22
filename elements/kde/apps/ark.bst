kind: cmake
description: ark - KDE archive manager

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/libarchive.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kfilemetadata.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kio.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kparts.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kpty.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kauth.bst
- kde/frameworks/solid.bst
- kde/frameworks/breeze-icons.bst
- kde/frameworks/kdoctools.bst
- freedesktop-sdk.bst:components/docbook-xml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/libxslt.bst
- kde/frameworks/karchive.bst
- kde/frameworks/knotifications.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON

sources:
- kind: git_repo
  url: kde:utilities/ark.git
  track: release/25.04
  ref: 233870783fad85db275a746226d178b2d2ad5c4b
