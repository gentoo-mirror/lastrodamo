# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LuxCoreRender is a physically based and unbiased rendering engine"
HOMEPAGE="https://luxcorerender.org/"
if [[ ${PV} == 9999 ]] ; then
    EGIT_REPO_URI="https://codeberg.org/lastrodamo/LuxCoreRender"
    inherit git-r3
else
    SRC_URI="https://codeberg.org/lastrodamo/LuxCoreRender/archive/luxcorerender-${PV}alpha3.tar.gz"
    S="${WORKDIR}/luxcorerender"

    KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="2"
IUSE=""

DEPEND="
	app-text/doxygen
	media-libs/openjpeg
	media-libs/libpng
	media-libs/tiff
	dev-libs/spdlog
	dev-libs/libfmt
	media-libs/openexr
	dev-libs/jsoncpp
	dev-lang/python
	dev-libs/boost:=[python,numpy]
	media-libs/embree
	media-libs/oidn
	dev-util/nvidia-cuda-toolkit
	dev-libs/optix
	media-libs/openimageio
	media-libs/opencolorio
	media-libs/opensubdiv
	media-gfx/openvdb
	media-libs/glfw
	dev-cpp/tbb
	dev-libs/c-blosc
	dev-python/numpy
	dev-python/pyside6
	dev-python/pyside6-tools
	sys-libs/zlib
	x11-libs/gtk+
	sys-devel/bison
	sys-devel/flex
	dev-cpp/eigen
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-build/cmake
	sys-devel/gcc:13
	sys-devel/bison
	sys-devel/flex
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
	elog "LuxCoreRender has been installed."
	elog "You can start using it by running the luxcoreui command."
}

