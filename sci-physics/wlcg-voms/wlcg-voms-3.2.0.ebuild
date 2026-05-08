# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

RPM_COMPRESS_TYPE=xz,zstd
inherit rpm

# https://repo.cloud.cnaf.infn.it/#browse/browse:infn-vos
WLCG_RPM_VER=1.1.0-1
# https://linuxsoft.cern.ch/wlcg/el9/x86_64/
WLCG_IAM_LSC_ALICE_RPM_VER=4.0.0-1
WLCG_IAM_VOMSES_ALICE_RPM_VER=3.0.0-1
WLCG_IAM_LSC_ATLAS_RPM_VER=4.0.0-1
WLCG_IAM_VOMSES_ATLAS_RPM_VER=3.0.0-1
WLCG_IAM_LSC_CMS_RPM_VER=4.0.0-1
WLCG_IAM_VOMSES_CMS_RPM_VER=3.0.0-1
WLCG_IAM_LSC_DTEAM_RPM_VER=3.0.0-1
WLCG_IAM_VOMSES_DTEAM_RPM_VER=1.0.0-1
WLCG_IAM_LSC_LHCB_RPM_VER=4.0.0-1
WLCG_IAM_VOMSES_LHCB_RPM_VER=3.0.0-1
WLCG_LSC_BELLE_RPM_VER=1.0.0-1
WLCG_VOMSES_BELLE_RPM_VER=1.0.0-1
WLCG_LSC_DUNE_RPM_VER=1.0.0-1
WLCG_VOMSES_DUNE_RPM_VER=1.0.0-1
WLCG_IAM_LSC_OPS_RPM_VER=3.0.0-1
WLCG_IAM_VOMSES_OPS_RPM_VER=2.0.0-1

DESCRIPTION="VOMS LSC files"
HOMEPAGE="https://twiki.cern.ch/twiki/bin/view/LCG/VOMSLSCfileConfiguration"

SRC_URI="alice? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-alice-${WLCG_IAM_LSC_ALICE_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-alice-${WLCG_IAM_VOMSES_ALICE_RPM_VER}.el9.noarch.rpm
	)
	atlas? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-atlas-${WLCG_IAM_LSC_ATLAS_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-atlas-${WLCG_IAM_VOMSES_ATLAS_RPM_VER}.el9.noarch.rpm
	)
	cms? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-cms-${WLCG_IAM_LSC_CMS_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-cms-${WLCG_IAM_VOMSES_CMS_RPM_VER}.el9.noarch.rpm
	)
	dteam? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-dteam-${WLCG_IAM_LSC_DTEAM_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-dteam-${WLCG_IAM_VOMSES_DTEAM_RPM_VER}.el9.noarch.rpm
	)
	lhcb? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-lhcb-${WLCG_IAM_LSC_LHCB_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-lhcb-${WLCG_IAM_VOMSES_LHCB_RPM_VER}.el9.noarch.rpm
	)
	belle? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-lsc-belle-${WLCG_LSC_BELLE_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-vomses-belle-${WLCG_VOMSES_BELLE_RPM_VER}.el9.noarch.rpm
	)
	dune? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-lsc-dune-${WLCG_LSC_DUNE_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-vomses-dune-${WLCG_VOMSES_DUNE_RPM_VER}.el9.noarch.rpm
	)
	ops? (
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-lsc-ops-${WLCG_IAM_LSC_OPS_RPM_VER}.el9.noarch.rpm
		https://linuxsoft.cern.ch/wlcg/el9/x86_64/wlcg-iam-vomses-ops-${WLCG_IAM_VOMSES_OPS_RPM_VER}.el9.noarch.rpm
	)
	wlcg? ( https://repo.cloud.cnaf.infn.it/repository/infn-vos/centos7/infn-vo-wlcg-${WLCG_RPM_VER}.el7.noarch.rpm )
	"

S="${WORKDIR}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alice +atlas +belle +cms +dteam +dune +lhcb +ops +wlcg"

src_install() {
	insinto "/etc/vomses"
	doins etc/vomses/*

	insinto "/etc/grid-security/vomsdir"
	doins -r etc/grid-security/vomsdir/*
}
