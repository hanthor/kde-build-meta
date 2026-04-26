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
- kde/qt6/qt6-qtlocation.bst
- kde/qt6/qt6-qtpositioning.bst
- kde/qt6/qt6-qtsvg.bst
# System libs
- freedesktop-sdk.bst:components/wayland.bst
- freedesktop-sdk.bst:components/pipewire-daemon.bst
- freedesktop-sdk.bst:components/linux-pam-base.bst
- freedesktop-sdk.bst:components/libxkbcommon.bst
# Plasma inter-deps
# - kde/plasma/kwin.bst  # Disabled: X11 dependencies
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

- kde/frameworks/kirigami.bst
- kde/frameworks/kquickcharts.bst
- kde/frameworks/kuserfeedback.bst
- kde/qt6/qt6-qtdeclarative.bst
- kde/qt6/qt6-qtshadertools.bst
- kde/qt6/qt6-qtwayland.bst
- freedesktop-sdk.bst:components/mesa-headers.bst
- kde/frameworks/karchive.bst
- kde/frameworks/kauth.bst
- kde/frameworks/kcoreaddons.bst
- kde/frameworks/kcrash.bst
- kde/frameworks/kdbusaddons.bst
- kde/frameworks/kdeclarative.bst
- kde/frameworks/kglobalaccel.bst
- kde/frameworks/kguiaddons.bst
- kde/frameworks/kholidays.bst
- kde/frameworks/ki18n.bst
- kde/frameworks/kiconthemes.bst
- kde/frameworks/kidletime.bst
- kde/frameworks/kitemmodels.bst
- kde/frameworks/kcmutils.bst
- kde/frameworks/kconfigwidgets.bst
- kde/frameworks/kded.bst
- kde/frameworks/kio.bst
- kde/frameworks/knewstuff.bst
- kde/frameworks/knotifications.bst
- kde/frameworks/kpackage.bst
- kde/frameworks/kparts.bst
- kde/frameworks/prison.bst
- kde/frameworks/krunner.bst
- kde/frameworks/kstatusnotifieritem.bst
- kde/frameworks/ksvg.bst
- kde/frameworks/ktextwidgets.bst
- kde/frameworks/kwallet.bst
- kde/frameworks/kcolorscheme.bst
- kde/frameworks/kconfig.bst
- kde/frameworks/kwindowsystem.bst
- kde/frameworks/kwidgetsaddons.bst
- kde/frameworks/kservice.bst
- kde/frameworks/kxmlgui.bst
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
- kind: patch
  path: patches/plasma-workspace/0001-make-qt6location-optional.patch
