# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

DESCRIPTION="A general-purpose Structure-from-Motion and Multi-View Stereo pipeline."
HOMEPAGE="https://colmap.github.io/"
SRC_URI="https://github.com/colmap/colmap/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vlarsson/PoseLib/archive/refs/tags/v0.1.tar.gz -> poselib-0.1.tar.gz"

LICENSE="BSD"
SLOT="3.11"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/boost
	dev-cpp/eigen
	sci-libs/flann
	media-libs/freeimage
	sci-libs/metis
	dev-db/sqlite
	media-libs/glew
	dev-qt/qtbase
	dev-qt/qtopengl
	sci-mathematics/cgal
	sci-libs/ceres-solver
"

DEPEND="${RDEPEND}"

BDEPEND="
	dev-build/cmake
	sys-devel/gcc:13
"

S="${WORKDIR}/colmap-${PV}"

PATCHES=( "${FILESDIR}/fix-cmake-paths.patch" )

src_prepare() {
	default
	cmake_src_prepare
	# Apply any necessary patches here

	# Unpack PoseLib manually
	einfo "Unpacking PoseLib"
	tar -xzf "${DISTDIR}/poselib-0.1.tar.gz" -C "${S}/lib" || die

	# Comment out tests in PoseLib CMakeLists.txt
	einfo "Disabling PoseLib tests"
	sed -i 's|add_subdirectory(tests)|# add_subdirectory(tests)|g' "${S}/lib/PoseLib/CMakeLists.txt" || die
}

src_configure() {
	local mycmakeargs=(
		-DPoseLib_DIR="${S}/lib/PoseLib"
		-DCMAKE_CUDA_ARCHITECTURES=75
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	xdg_desktop_database_update
	elog "Colmap has been installed."
	elog "You can start using it by running the colmap command."
}
