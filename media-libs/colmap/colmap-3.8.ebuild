# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

DESCRIPTION="A general-purpose Structure-from-Motion and Multi-View Stereo pipeline."
HOMEPAGE="https://colmap.github.io/"
SRC_URI="https://github.com/colmap/colmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sci-libs/ceres-solver
	dev-libs/boost
	media-libs/freeimage
	sci-libs/metis"

RDEPEND="${DEPEND}"

src_configure() {
	CMAKE_BUILD_TYPE=Release

	local mycmakeargs=(
#		-DBOOST_STATIC=0
		-DBoost_USE_STATIC_LIBS=OFF
		-DCMAKE_CUDA_ARCHITECTURES=native
	)
	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
}
