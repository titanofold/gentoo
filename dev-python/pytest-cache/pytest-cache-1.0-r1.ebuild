# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5,6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="mechanisms for caching across test runs"
HOMEPAGE="https://pypi.python.org/pypi/pytest-cache http://bitbucket.org/hpk42/pytest-cache/ http://pythonhosted.org/pytest-cache/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="MIT"
KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ~m68k ppc ppc64 ~s390 ~sh ~sparc x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/execnet[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	"

# https://bitbucket.org/hpk42/pytest-cache/issues/12
RESTRICT=test

python_test() {
	PYTEST_PLUGINS="pytest_cache" py.test -v -v || die
}
