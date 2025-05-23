# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="Rucio is the new version of ATLAS DDM system services."
HOMEPAGE="https://rucio.cern.ch/"

MY_PV=$(ver_rs 1- ".")
MY_PV="${MY_PV/p/post}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rucio/rucio.git"
	#EGIT_COMMIT="${MY_PV}"
else
	SRC_URI="https://github.com/rucio/rucio/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/rucio-${MY_PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"

# dev-python/pykerberos[${PYTHON_USEDEP}]
RDEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/dogpile-cache[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/kerberos[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/python-swiftclient[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-kerberos[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	|| ( dev-python/python-magic[${PYTHON_USEDEP}] sys-apps/file[python,${PYTHON_USEDEP}] )
	"
DEPEND="${RDEPEND}"

python_prepare_all() {
	mv setup_rucio_client.py setup.py
	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install
	mkdir -p "$D"/etc/ || die
	mv "$D"/usr/etc "$D"/etc/rucio || die
	rm "$D"/usr/requirements.client.txt || die
	mv "$D"/usr/rucio_client "$D"/etc/rucio/ || die
}
