kind: cmake
description: kwalletmanager — KDE Wallet password manager GUI

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- kde/qt6/qt6-qtbase.bst
- kde/frameworks/karchive.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kcodecs.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kio.bst
- kde/frameworks/kitemviews.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kstatusnotifieritem.bst
- kde/frameworks/kwallet.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kxmlgui.bst
# libKF6XmlGui links kglobalaccel; libKF6IconThemes links breeze-icons
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/breeze-icons.bst
# meinproc6 (from kdoctools) needs libxslt at runtime during doc generation
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/docbook-xml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DBUILD_HTML_DOCS=OFF
    -DBUILD_MAN_DOCS=OFF
    -DBUILD_QTHELP_DOCS=OFF
    -DBUILD_DOC=OFF
    -DKF_SKIP_PO_PROCESSING=ON
    -DBUILD_QT5=OFF
    -DBUILD_WITH_QT6=ON
    -DQT_MAJOR_VERSION=6

sources:
- kind: git_repo
  url: kde:utilities/kwalletmanager.git
  track: master
  ref: v24.01.90-350-g92b58afbf87e5de23462f2d72b45c11bd6802af3
