# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="PyTado from chrism0dwk, modfied by w.malgadey"
HOMEPAGE="https://github.com/wmalgadey/PyTado https://pypi.org/project/python-tado/"
MY_PN="PyTado"
SRC_URI="https://github.com/wmalgadey/${MY_PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND=""
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
