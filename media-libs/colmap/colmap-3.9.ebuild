# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils git-r3

DESCRIPTION="A general-purpose Structure-from-Motion and Multi-View Stereo pipeline."
HOMEPAGE="https://colmap.github.io/"
#SRC_URI="https://github.com/colmap/colmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/colmap/colmap.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	sci-libs/ceres-solver
	dev-libs/boost
	media-libs/freeimage
	sci-libs/metis"

RDEPEND="${DEPEND}"

#CMAKE_IN_SOURCE_BUILD=1

MYCMAKEARGS="-DCMAKE_CUDA_ARCHITECTURES=75"

pkg_postinst() {
	xdg_desktop_database_update
}
