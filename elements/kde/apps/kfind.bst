kind: cmake
description: kfind — KDE file search utility

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
# meinproc6 (from kdoctools) needs libxslt at runtime during doc generation
- freedesktop-sdk.bst:components/libxslt.bst
- freedesktop-sdk.bst:components/docbook-xml.bst
- freedesktop-sdk.bst:components/docbook-xsl.bst
- kde/qt6/qt6-qtbase.bst
- kde/qt6/qt6-qt5compat.bst
- kde/frameworks/karchive.bst
- kde/frameworks/kcompletion.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kfilemetadata.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kio.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kxmlgui.bst
# libKF6XmlGui links kglobalaccel; libKF6JobWidgets links knotifications;
# libKF6IconThemes links breeze-icons
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/breeze-icons.bst

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
  url: kde:utilities/kfind.git
  track: master
  ref: v24.01.90-293-g59d651fce6a759234a5c60566c7ddb77f343ddd1
