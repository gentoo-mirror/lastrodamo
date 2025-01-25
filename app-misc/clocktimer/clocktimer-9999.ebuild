# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Clocktimer is a countdown timer remastered with C++ and Qt6"
HOMEPAGE="https://codeberg.org/lastrodamo/Clocktimer"
SRC_URI="https://codeberg.org/lastrodamo/Clocktimer.git"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-qt/qtbase
	dev-qt/qtmultimedia
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-build/cmake
	sys-devel/gcc:13
"

src_prepare() {
	default
	cmake_src_prepare
	# Apply any necessary patches here
}

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	elog "Clocktimer has been installed."
	elog "You can start using it by running the clocktimer command."
}

