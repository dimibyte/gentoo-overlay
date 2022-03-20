# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A multi-purpose WAVE data processing and reporting utility"
HOMEPAGE="http://www.etree.org/shnutils/shntool/"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://salsa.debian.org/debian/shntool.git"
	inherit git-r3 autotools flag-o-matic
else
	SRC_URI="http://www.etree.org/shnutils/shntool/dist/src/${P}.tar.gz"
	KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux ~ppc-macos"
fi


LICENSE="GPL-2"
SLOT="0"

IUSE="alac flac mac shorten sox wavpack"

RDEPEND="
	alac? ( media-sound/alac_decoder )
	flac? ( media-libs/flac )
	mac? ( media-sound/mac )
	shorten? ( media-sound/shorten )
	sox? ( media-sound/sox )
	wavpack? ( media-sound/wavpack )"
DEPEND="${RDEPEND}"

PATCHES=(
	"${WORKDIR}/${PF}"/debian/patches/no-cdquality-check.patch
	"${WORKDIR}/${PF}"/debian/patches/large-times.patch
	"${WORKDIR}/${PF}"/debian/patches/large-size.patch
	"${WORKDIR}/${PF}"/debian/patches/950803.patch
)

src_configure() {
	export CONFIG_SHELL=${BASH}  # bug #527310
	default
	eautoreconf
	econf
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc -r doc/.
}
