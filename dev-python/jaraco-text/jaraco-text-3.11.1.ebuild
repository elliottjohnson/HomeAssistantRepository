# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Module for text manipulation"
HOMEPAGE="https://github.com/jaraco/jaraco.text https://pypi.org/project/jaraco.text/"
MY_PN=${PN/-/.}
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_PN}-${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="dev-python/jaraco-functools[${PYTHON_USEDEP}]
	>=dev-python/jaraco-context-4.1[${PYTHON_USEDEP}]
	dev-python/autocommand[${PYTHON_USEDEP}]
	dev-python/inflect[${PYTHON_USEDEP}]
	dev-python/more-itertools[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
