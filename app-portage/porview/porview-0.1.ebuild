# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7

inherit autotools flag-o-matic

DESCRIPTION="Graphical Portage frontend based on FLTK using gentoolkit"
HOMEPAGE="https://github.com/dimibyte/porview"
SRC_URI="https://github.com/dimibyte/porview/archive/refs/tags/v${PV}.tar.gz"
 
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
 
DEPEND="sys-devel/autoconf
	sys-devel/automake
	x11-libs/fltk
	dev-libs/boost
	app-portage/gentoolkit"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/add_source_0_1.patch
)

pkg_setup() {
	append-ldflags $(no-as-needed)
}

src_configure() {
	default
	eautoreconf
	econf
}

src_compile() {
	emake CXXFLAGS="${CXXFLAGS}" LDLIBS="-lfltk -lXrender -lXcursor -lXfixes -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm -lX11 -lboost_iostreams" || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install
}
