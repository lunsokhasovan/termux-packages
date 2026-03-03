TERMUX_PKG_HOMEPAGE=https://gitlab.gnome.org/World/design/icon-library
TERMUX_PKG_DESCRIPTION="Symbolic icons for your apps"
TERMUX_PKG_LICENSE="GPL-3.0-or-later"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.0.22"
TERMUX_PKG_SRCURL=https://gitlab.gnome.org/World/design/icon-library/-/archive/${TERMUX_PKG_VERSION}/icon-library-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=55329c9757d794b454d5ef60f036d897753f7b1831d41b778f71afbfeb287ceb
TERMUX_PKG_DEPENDS="glib, gtk4, gnome-desktop4, gtksourceview5, libadwaita"
TERMUX_PKG_BUILD_DEPENDS="desktop-file-utils, gettext, glib-cross"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_glib_cross_pkg_config_wrapper

	local env_host=$(printf $CARGO_TARGET_NAME | tr a-z A-Z | sed s/-/_/g)
	export CARGO_TARGET_${env_host}_RUSTFLAGS+=" -C link-arg=-liconv"
	export CARGO_BUILD_TARGET=$CARGO_TARGET_NAME
	export CARGO_BUILD_TARGET_DIR=$TERMUX_PKG_SRCDIR
}
