# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LuxCoreRender is a physically based and unbiased rendering engine"
HOMEPAGE="https://luxcorerender.org/"
#SRC_URI="https://codeberg.org/lastrodamo/LuxCoreRender/archive/luxcorerender-${PV}alpha3.tar.gz"
SRC_URI="https://codeberg.org/lastrodamo/LuxCoreRender/archive/master.tar.gz"

LICENSE="Apache-2.0"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/luxcorerender"

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

src_unpack() {
	unpack ${A}
}

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

