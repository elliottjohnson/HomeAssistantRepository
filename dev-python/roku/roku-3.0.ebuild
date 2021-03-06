# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Client for the Roku media player"
HOMEPAGE="https://github.com/jcarbaugh/python-roku https://pypi.org/project/roku/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=">=dev-python/requests-2.10[${PYTHON_USEDEP}]
		 <dev-python/requests-2.11[${PYTHON_USEDEP}]
		 dev-python/six[${PYTHON_USEDEP}]
		 >=dev-python/tox-2.3[${PYTHON_USEDEP}]
		 <dev-python/tox-2.4[${PYTHON_USEDEP}]"
DEPEND="${REDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
