# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="LuxCoreRender is a physically based and unbiased rendering engine"
HOMEPAGE="https://luxcorerender.org/"
SRC_URI="https://github.com/LuxCoreRender/LuxCore/archive/refs/tags/luxcorerender-v${PV}alpha1.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/LuxCore-luxcorerender-v${PV}alpha1"

DEPEND="
	dev-libs/boost:=[python,numpy]
	media-libs/openimageio
	media-libs/openexr
	media-gfx/openvdb:=[static-libs]
	media-libs/libpng
	media-libs/libjpeg-turbo
	media-libs/tiff
	media-libs/embree
	media-libs/oidn
	dev-cpp/tbb
	dev-libs/c-blosc
	dev-python/numpy
	dev-python/pyside6
	virtual/opengl
	app-text/doxygen
	sys-libs/zlib
	x11-libs/gtk+
	dev-lang/python:3.10
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-build/cmake
	sys-devel/bison
	sys-devel/flex
"

src_prepare() {
	# default
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

