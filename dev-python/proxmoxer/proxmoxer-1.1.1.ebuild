# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="Python Wrapper for the Proxmox 2.x API (HTTP and SSH)"
HOMEPAGE="https://github.com/swayf/proxmoxer https://pypi.org/project/proxmoxer/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
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

src_prepare() {
	sed "s/packages=\['proxmoxer', 'proxmoxer.backends', 'tests', 'tests.base'\]/packages=['proxmoxer', 'proxmoxer.backends']/g" -i setup.py || die
	eapply_user
}

python_test() {
	nosetests --verbose || die
	py.test -v -v || die
}
