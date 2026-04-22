kind: cmake
description: okular - KDE document viewer

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- freedesktop-sdk.bst:components/docbook-xml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- freedesktop-sdk.bst:components/libxslt.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtsvg.bst
- kde/qt6/qt6-qtspeech.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk.bst:components/libtiff.bst
- kde/libs/poppler-qt6.bst
- kde/libs/phonon.bst
- kde/frameworks/karchive.bst
- kde/frameworks/kbookmarks.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kio.bst
- kde/frameworks/kparts.bst
- kde/frameworks/ktextwidgets.bst
- kde/frameworks/kwallet.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kxmlgui.bst
- kde/frameworks/purpose.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/solid.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kjobwidgets.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/breeze-icons.bst
- kde/frameworks/threadweaver.bst
- kde/frameworks/sonnet.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DOKULAR_UI=desktop

sources:
- kind: git_repo
  url: kde:graphics/okular.git
  track: release/25.04
  ref: 85a264dbd54bebd3bd971d6649e872b178b0e3aa
