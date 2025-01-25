# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

DESCRIPTION="A general-purpose Structure-from-Motion and Multi-View Stereo pipeline."
HOMEPAGE="https://colmap.github.io/"
SRC_URI="https://github.com/colmap/colmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/colmap"


LICENSE="BSD"
SLOT="3.11"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sci-libs/ceres-solver
	dev-libs/boost
	media-libs/freeimage
	sci-libs/metis"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-build/cmake
	sys-devel/gcc:13
"

#CMAKE_IN_SOURCE_BUILD=1

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

MYCMAKEARGS="-DCMAKE_CUDA_ARCHITECTURES=75"

pkg_postinst() {
	xdg_desktop_database_update
	elog "Colmap has been installed."
	elog "You can start using it by running the colmap command."
}
