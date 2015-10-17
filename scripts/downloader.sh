BASE=http://wwwn.cdc.gov/Nchs/Nhanes

for Y in 2015-2016 2013-2014 2011-2012 2009-2010 2007-2008 2005-2006 2003-2004 2001-2002 1999-2000
do

# Yyear = 2009-2010

    echo $Y

    mkdir -p $Y
    cd $Y

    SECTION=Demographic

    f=DEMO_F.XPT
    echo $Y for $SECTION
    wget -c "$BASE/$Y/$f"

    SECTION=Dietary Data

    for f in \
	DR1IFF_F.XPT \
	DR2IFF_F.XPT \
	DR1TOT_F.XPT \
	DR2TOT_F.XPT \
	DRXFCD_F.XPT \
	DRXMCD_F.XPT \
	DTQ_F.XPT \
	DSBI.XPT \
	DSII.XPT \
	DSPI.XPT \
	DS1IDS_F.XPT \
	DS2IDS_F.XPT \
	DS1TOT_F.XPT \
	DS2TOT_F.XPT \
	DSQIDS_F.XPT \
	DSQTOT_F.XPT
    do
	echo $Y for $SECTION
	wget -c "$BASE/$Y/$f"
    done

#     Y=2009-2010

    SECTION=Examination Data

    for f in \
	ARX_F.XPT \
	AUX_F.XPT \
	AUXAR_F.XPT \
	AUXTYM_F.XPT \
	BPX_F.XPT \
	BMX_F.XPT \
	DXXFEM_F.XPT \
	DXXSPN_F.XPT \
	ENX_F.XPT \
	OHXDEN_F.XPT \
	OHXPER_F.XPT \
	OHXREF_F.XPT \
	SPX_F.XPT \
	SPXRAW_F.ZIP
    do
	echo $Y for $SECTION
	wget -c "$BASE/$Y/$f"
    done



SECTION=Laboratory Data

    for f in \
	ALB_CR_F.XPT \
	APOB_F.XPT \
	UAS_F.XPT \
	PBCD_F.XPT \
	CAFE_F.XPT \
	CHLMDA_F.XPT \
	HDL_F.XPT \
	TRIGLY_F.XPT \
	TCHOL_F.XPT \
	CBC_F.XPT \
	COTNAL_F.XPT \
	CRP_F.XPT \
	EPH_F.XPT \
	SSEBV_F.XPT \
	FASTQX_F.XPT \
	FERTIN_F.XPT \
	FOLATE_F.XPT \
	GHB_F.XPT \
	HEPA_F.XPT \
	HEPB_S_F.XPT \
	HEPBD_F.XPT \
	SSHCV_E.XPT \
	HEPC_F.XPT \
	HEPE_F.XPT \
	HSV_F.XPT \
	HIV_F.XPT \
	HPVSER_F.XPT \
	ORHPV_F.XPT \
	HPVSWR_F.XPT \
	SSHPV_F.XPT \
	UIO_F.XPT \
	MMRV_F.XPT \
	IHG_F.XPT \
	UHG_F.XPT \
	UHM_F.XPT \
	OGTT_F.XPT \
	PERNT_F.XPT \
	PP_F.XPT \
	PHTHTE_F.XPT \
	PHYTO_F.XPT \
	GLU_F.XPT \
	SSPOLI_F.XPT \
	PAH_F.XPT \
	PFC_F.XPT \
	UCPREG_F.XPT \
	PSA_F.XPT \
	UPHOPM_F.XPT \
	BIOPRO_F.XPT \
	THYROD_F.XPT \
	TGEMA_F.XPT \
	SSTOXO_F.XPT \
	TFR_F.XPT \
	UCFLOW_F.XPT \
	UCOSMO_F.XPT \
	VID_F.XPT
    do
	echo $Y for $SECTION
	wget -c "$BASE/$Y/$f"
    done


    SECTION=Questionnaire Data

    for f in \
	ACQ_F.XPT \
	AQQ_F.XPT \
	ALQ_F.XPT \
	ALQY_F.XPT \
	ARQ_F.XPT \
	AUQ_F.XPT \
	BPQ_F.XPT \
	BHQ_F.XPT \
	CDQ_F.XPT \
	CBQ_F.XPT \
	CBQPFA_F.XPT \
	CBQPFC_F.XPT \
	HSQ_F.XPT \
	DEQ_F.XPT \
	DIQ_F.XPT \
	DBQ_F.XPT \
	DUQ_F.XPT \
	ECQ_F.XPT \
	FSQ_F.XPT \
	HIQ_F.XPT \
	HCQ_F.XPT \
	HUQ_F.XPT \
	HOQ_F.XPT \
	IMQ_F.XPT \
	INQ_F.XPT \
	KIQ_U_F.XPT \
	MCQ_F.XPT \
	DPQ_F.XPT \
	OCQ_F.XPT \
	OHQ_F.XPT \
	OSQ_F.XPT \
	PUQMEC_F.XPT \
	PAQ_F.XPT \
	PFQ_F.XPT \
	RXQ_RX_F.XPT \
	RXQ_DRUG.XPT \
	RHQ_F.XPT \
	RDQ_F.XPT \
	SXQ_F.XPT \
	SLQ_F.XPT \
	SMQ_F.XPT \
	SMQFAM_F.XPT \
	SMQRTU_F.XPT \
	WHQ_F.XPT \
	WHQMEC_F.XPT
    do
	echo $Y for $SECTION
	wget -c "$BASE/$Y/$f"
    done

    SECTION=Limited Acccess Data

    for f in \
	ALQY_F_R.XPT \
	SSH7N9_R.XPT \
	CHLM_F_R.XPT \
	DUQY_F_R.XPT \
	FSQ_F_R.XPT \
	N0910_GE.XPT \
	SSHN10_R.XPT \
	HSV_F_R.XPT \
	B27_F_R.XPT \
	SER_F_R.XPT \
	OHPV_F_R.XPT \
	HPVS_F_R.XPT \
	SSHP_F_R.XPT \
	SSIF_F_R.XPT \
	SSUIFG_R.XPT \
	DPQY_F_R.XPT \
	OCQ_F_R.XPT \
	RHQ_F_R.XPT \
	SXQY_F_R.XPT \
	SSUE10_R.XPT
    do
    # wget -c "$BASE/$Y/$f"
    # no operation: noop or :
	echo $Y for $SECTION
	: 
    done

    cd -

done 
