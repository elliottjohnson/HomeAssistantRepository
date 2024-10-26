# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="pyvesync is a library to manage Etekcity Devices and Levoit Air Purifier"
HOMEPAGE="https://github.com/markperdue/pyvesync https://pypi.org/project/pyvesync/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/requests-2.20.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest