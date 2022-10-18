# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Dyson Pure Cool/Hot+Cool Link and 360 eye robot vacuum devices Python library"
HOMEPAGE="https://github.com/etheralm/libpurecool https://libpurecool.readthedocs.io https://pypi.org/project/libpurecool/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}

distutils_enable_tests pytest
