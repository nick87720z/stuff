# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2

DESCRIPTION="/etc/portage manager"
HOMEPAGE="https://github.com/megabaks/portconf"
EGIT_REPO_URI="git://github.com/megabaks/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-shells/bash
		sys-apps/portage"
RDEPEND="${DEPEND}
		app-portage/eix
		sys-apps/gawk"

S="${WORKDIR}"

src_install(){
	if [ -f "${ROOT}/etc/portconf.conf" ];then
	  cp "${ROOT}/etc/portconf.conf" "${D}/etc/portconf.conf"
	else
	  insinto /etc/
	  doins "portconf.conf"
	fi
	dosbin portconf
}