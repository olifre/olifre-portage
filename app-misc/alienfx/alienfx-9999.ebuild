# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake-multilib git-r3

DESCRIPTION="Core library for accessing the Microsoft Kinect."
HOMEPAGE="https://github.com/olifre/${PN}"
EGIT_REPO_URI="https://github.com/olifre/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEP="virtual/libusb:1"

RDEPEND="${COMMON_DEP}"
DEPEND="${COMMON_DEP}
	dev-util/cmake"

multilib_src_install() {
	cmake-utils_src_install

	# udev rules
	#insinto /lib/udev/rules.d/
	#doins "${S}"/platform/linux/udev/51-kinect.rules

	# documentation
	#dodoc README.md
	#if use doc; then
	#    cd doc
	#    doxygen || ewarn "doxygen failed"
	#    dodoc -r html || ewarn "dodoc failed"
	#    cd -
	#fi
}

pkg_postinst() {
	elog "Beware: This package is WIP!"
}
