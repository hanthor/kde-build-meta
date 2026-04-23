kind: cmake
description: kinfocenter

build-depends:
- freedesktop-sdk.bst:components/vulkan-headers.bst
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- kde/frameworks/extra-cmake-modules.bst
- kde/frameworks/kdoctools.bst
- kde/qt6/qt6-qtbase.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kio.bst
- kde/frameworks/kservice.bst
- kde/frameworks/solid.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kcodecs.bst
- freedesktop-sdk.bst:components/libdrm.bst

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
    -DENABLE_OPENGL_BACKEND=ON
    -DENABLE_VULKAN_BACKEND=OFF

sources:
- kind: git_repo
  url: kde:plasma/kinfocenter.git
  track: Plasma/6.6
  ref: 4661524934085c1745ed1d2316269e1b74fbe681
- kind: patch
  path: patches/kinfocenter/0001-opengl-helper-without-qt-vulkan.patch
- kind: patch
  path: patches/kinfocenter/0002-vulkan-helper-without-qt-vulkan.patch
