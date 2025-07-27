TERMUX_PKG_HOMEPAGE="https://community.kde.org/Frameworks"
TERMUX_PKG_DESCRIPTION="Documentation generation from docbook (KDE)"
TERMUX_PKG_LICENSE="LGPL-2.0, LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="6.16.0"
_KF6_MINOR_VERSION="${TERMUX_PKG_VERSION%.*}"
TERMUX_PKG_SRCURL="https://download.kde.org/stable/frameworks/${_KF6_MINOR_VERSION}/kdoctools-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=5c0c531a7978650f593a63a2aba1a641d590537e74c644aa361c63584b115aa2
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="docbook-xsl, docbook-xml, libc++, libxml2, libxslt, kf6-karchive, kf6-ki18n, qt6-qtbase"
TERMUX_PKG_BUILD_DEPENDS="doxygen, extra-cmake-modules (>= ${_KF6_MINOR_VERSION}), qt6-qttools"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DCMAKE_SYSTEM_NAME=Linux
-DKDE_INSTALL_QMLDIR=lib/qt6/qml
-DKDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
"

termux_step_make() {
	sed -i "s|-isystem/data/data|-isystem /data/data|g" build.ninja
}
