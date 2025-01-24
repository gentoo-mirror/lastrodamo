# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Clocktimer is a countdown timer remastered with C++ and Qt6"
HOMEPAGE="https://codeberg.org/lastrodamo/Clocktimer"
if [[ ${PV} = *9999* ]] ; then
    EGIT_REPO_URI="https://codeberg.org/lastrodamo/Clocktimer"
    inherit git-r3
else
    SRC_URI="https://codeberg.org/lastrodamo/Clocktimer/archive/${P}-alpha1.tar.gz"
    S="${WORKDIR}/clocktimer"

    KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="3"
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
i	elog "Clocktimer has been installed."
	elog "You can start using it by running the clocktimer command."
}

