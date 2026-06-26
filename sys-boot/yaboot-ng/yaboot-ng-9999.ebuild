# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic toolchain-funcs

DESCRIPTION="PPC Bootloader"
HOMEPAGE="https://github.com/peppergrayxyz/yaboot-ng"

if [[ ${PV} = *9999* ]]; then
	EGIT_REPO_URI="https://github.com/peppergrayxyz/yaboot-ng.git"
	inherit git-r3
else
	SRC_URI="https://github.com/peppergrayxyz/yaboot-ng.git"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-* ppc ppc64"
IUSE="ibm"

DEPEND=""
RDEPEND="
	!sys-boot/yaboot-static
	!sys-boot/yaboot
	sys-apps/ibm-powerpc-utils
	!ibm? (
		sys-fs/hfsutils
		sys-fs/hfsplusutils
		sys-fs/mac-fdisk
	)"

PATCHES=(
	"${FILESDIR}/e2fsprogs-1.47.4.patch-lseek-musl.patch"
)

src_configure() {
	# ld.gold fails to link yaboot as:
	#  sorry, I can't find space in second/yaboot.chrp to put the note
	# bug #678710
	tc-ld-disable-gold

	default
}

src_install() {
	sed -i -e 's/\/local//' etc/yaboot.conf || die
	emake \
		ROOT="${D}" \
		PREFIX=/usr \
		MANDIR=share/man \
		install
	mv "${ED}"/etc/yaboot.conf{,.sample} || die
}
