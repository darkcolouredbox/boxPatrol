//////////////////////////////////
// Blackbox's rad patrol script //
// v1 - Unit initialization     //
//////////////////////////////////
// This isn't a script to call, it's unit definitions

allInfantry = [
	[ // NATO units
		["B_soldier_AR_F","B_medic_F","B_engineer_F","B_Soldier_F","B_Soldier_lite_F"], // Light Infantry
		["B_soldier_AR_F","B_medic_F","B_engineer_F","B_Soldier_GL_F","B_soldier_M_F","B_Soldier_F","B_soldier_LAT2_F","B_Sharpshooter_F","B_Soldier_SL_F","B_Soldier_TL_F"], // Medium Infantry
		["B_Patrol_Soldier_A_F","B_Patrol_Soldier_AR_F","B_Patrol_Medic_F","B_Patrol_Engineer_F","B_Patrol_HeavyGunner_F","B_Patrol_Soldier_M_F","B_Patrol_Soldier_AT_F","B_Patrol_Soldier_TL_F","B_Soldier_TL_F","B_Soldier_SL_F","B_Sharpshooter_F","B_soldier_LAT2_F","B_soldier_LAT_F","B_Soldier_F","B_HeavyGunner_F","B_Soldier_GL_F"], // Heavy Infantry
		["B_MRAP_01_F","B_LSV_01_armed_F"], // Light Vehicles
		["B_MRAP_01_hmg_F","B_APC_Wheeled_01_cannon_F"], // Medium Vehicles
		["B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_AFV_Wheeled_01_up_cannon_F","B_MBT_01_cannon_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F"] // Heavy Vehicles
	],
	[ // NATO (Pacific) units
		["B_T_Soldier_AR_F","B_T_Medic_F","B_T_Engineer_F","B_T_Soldier_F","B_T_Officer_F"],
		["B_T_Soldier_AR_F","B_T_Medic_F","B_T_Engineer_F","B_T_Soldier_GL_F","B_T_soldier_M_F","B_T_Soldier_F","B_T_Soldier_LAT2_F","B_T_Soldier_SL_F","B_T_Soldier_TL_F"],
		["B_T_Recon_JTAC_F","B_T_Recon_Exp_F","B_T_Recon_M_F","B_T_Recon_Medic_F","B_T_Recon_F","B_T_Recon_LAT_F","B_T_Recon_TL_F","B_T_Soldier_AR_F","B_T_Medic_F","B_T_Engineer_F","B_T_Soldier_GL_F","B_T_soldier_M_F","B_T_Soldier_AT_F","B_T_Soldier_F","B_T_Soldier_LAT_F","B_T_Soldier_LAT2_F","B_T_Soldier_SL_F","B_T_Soldier_TL_F"],
		["B_T_LSV_01_armed_F","B_T_MRAP_01_hmg_F"],
		["B_T_MRAP_01_hmg_F","B_T_MRAP_01_gmg_F","B_T_APC_Wheeled_01_cannon_F"],
		["B_T_APC_Tracked_01_rcws_F","B_T_AFV_Wheeled_01_up_cannon_F","B_T_APC_Wheeled_01_cannon_F","B_T_MBT_01_cannon_F"]
	],
	[ // FIA (Blufor) units
		["B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_lite_F","B_G_Sharpshooter_F"],
		["B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT2_F","B_G_Sharpshooter_F","B_G_Soldier_TL_F"],
		["B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_officer_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT2_F","B_G_Sharpshooter_F","B_G_Soldier_SL_F","B_G_Soldier_TL_F"],
		["B_G_Offroad_01_armed_F"],
		["B_G_Offroad_01_armed_F"],
		["B_G_Offroad_01_armed_F","B_G_Offroad_01_AT_F"]
	],
	[ // CSAT units
		["O_medic_F","O_Soldier_AR_F","O_soldier_M_F","O_Soldier_lite_F","O_Soldier_F"],
		["O_Soldier_AR_F","O_medic_F","O_engineer_F","O_Soldier_GL_F","O_Soldier_F","O_Soldier_LAT_F","O_Sharpshooter_F","O_Soldier_TL_F"],
		["O_Soldier_AR_F","O_medic_F","O_engineer_F","O_Soldier_GL_F","O_HeavyGunner_F","O_soldier_M_F","O_Soldier_F","O_Soldier_HAT_F","O_Soldier_LAT_F","O_Soldier_F","O_Sharpshooter_F","O_Soldier_AA_F","O_Soldier_AT_F"],
		["O_LSV_02_armed_F","O_MRAP_02_hmg_F"],
		["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Wheeled_02_rcws_v2_F","O_MRAP_02_gmg_F"],
		["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_v2_F","O_MBT_04_command_F"]
	],
	[ // CSAT (Pacific) units
		["O_T_Soldier_AR_F","O_T_Medic_F","O_T_Soldier_F","O_T_Soldier_M_F","O_T_Soldier_TL_F"],
		["O_T_Soldier_AR_F","O_T_Medic_F","O_T_Engineer_F","O_T_Soldier_GL_F","O_T_Soldier_M_F","O_T_Soldier_F","O_T_Soldier_LAT_F","O_T_Soldier_TL_F"],
		["O_T_Soldier_AR_F","O_T_Medic_F","O_T_Engineer_F","O_T_Soldier_GL_F","O_T_Soldier_M_F","O_T_Soldier_AT_F","O_T_Soldier_AA_F","O_T_Soldier_F","O_T_Soldier_LAT_F","O_T_Soldier_HAT_F","O_T_Soldier_SL_F","O_T_Soldier_TL_F"],
		["O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F"],
		["O_T_MRAP_02_hmg_ghex_F","O_T_MRAP_02_gmg_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"],
		["O_T_APC_Wheeled_02_rcws_v2_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_MBT_04_command_F"]
	],
	[ // FIA (OPFOR) units
		["O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F"],
		["O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT2_F","O_G_Sharpshooter_F","O_G_Soldier_TL_F"],
		["O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_officer_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT2_F","O_G_Sharpshooter_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F"],
		["O_G_Offroad_01_armed_F"],
		["O_G_Offroad_01_armed_F"],
		["O_G_Offroad_01_armed_F","O_G_Offroad_01_AT_F"]
	],
	[ // AAF units
		["I_Soldier_AR_F","I_medic_F","I_soldier_F","I_Soldier_lite_F","I_engineer_F"],
		["I_Soldier_AR_F","I_medic_F","I_engineer_F","I_Soldier_GL_F","I_soldier_F","I_Soldier_LAT2_F","I_Soldier_TL_F","I_Soldier_M_F"],
		["I_Soldier_AR_F","I_medic_F","I_engineer_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AA_F","I_Soldier_AT_F","I_soldier_F","I_Soldier_LAT_F","I_Soldier_LAT2_F","I_Soldier_SL_F","I_Soldier_TL_F"],
		["I_MRAP_03_hmg_F"],
		["I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_APC_Wheeled_03_cannon_F","I_LT_01_AT_F","I_LT_01_cannon_F"],
		["I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F","I_MBT_03_cannon_F"]
	],
	[ // FIA (Independent) units
		["I_G_Soldier_M_F","I_G_Soldier_F","I_G_Soldier_lite_F","I_G_Sharpshooter_F"],
		["I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_M_F","I_G_Soldier_F","I_G_Soldier_LAT2_F","I_G_Sharpshooter_F","I_G_Soldier_TL_F"],
		["I_G_Soldier_A_F","I_G_Soldier_AR_F","I_G_medic_F","I_G_engineer_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_officer_F","I_G_Soldier_F","I_G_Soldier_LAT_F","I_G_Soldier_LAT2_F","I_G_Sharpshooter_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F"],
		["I_G_Offroad_01_armed_F"],
		["I_G_Offroad_01_armed_F"],
		["I_G_Offroad_01_armed_F","I_G_Offroad_01_AT_F"]
	],
	[ // Syndikat units
		["I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_4_F"],
		["I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_2_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_1_F","I_C_Soldier_Bandit_4_F"],
		["I_C_Soldier_Para_7_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_3_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_5_F"],
		["I_C_Offroad_02_LMG_F"],
		["I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F"],
		["I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F"]
	],
	[ // Russia (MSV) units
		["rhs_msv_emr_efreitor","rhs_msv_emr_engineer","rhs_msv_emr_machinegunner","rhs_msv_emr_marksman","rhs_msv_emr_rifleman"],
		["rhs_msv_emr_arifleman","rhs_msv_emr_efreitor","rhs_msv_emr_engineer","rhs_msv_emr_medic","rhs_msv_emr_marksman","rhs_msv_emr_machinegunner","rhs_msv_emr_grenadier_rpg","rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_LAT"],
		["rhs_msv_emr_aa","rhs_msv_emr_at","rhs_msv_emr_arifleman","rhs_msv_emr_efreitor","rhs_msv_emr_engineer","rhs_msv_emr_machinegunner","rhs_msv_emr_marksman","rhs_msv_emr_medic","rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_LAT","rhs_msv_emr_RShG2"],
		["rhs_tigr_sts_msv","rhs_tigr_m_msv"],
		["rhs_tigr_sts_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_bmp2k_msv"],
		["rhs_btr80a_msv","rhs_bmp3mera_msv","rhs_bmp2k_msv","rhs_bmp3_msv"]
	],
	[ // Russia (VDV) units
		["rhs_vdv_efreitor","rhs_vdv_marksman","rhs_vdv_machinegunner","rhs_vdv_rifleman","rhs_vdv_rifleman_lite"],
		["rhs_vdv_arifleman","rhs_vdv_efreitor","rhs_vdv_engineer","rhs_vdv_grenadier_rpg","rhs_vdv_machinegunner","rhs_vdv_marksman","rhs_vdv_medic","rhs_vdv_rifleman","rhs_vdv_grenadier","rhs_vdv_LAT","rhs_vdv_RShG2"],
		["rhs_vdv_aa","rhs_vdv_at","rhs_vdv_arifleman","rhs_vdv_efreitor","rhs_vdv_grenadier_rpg","rhs_vdv_machinegunner","rhs_vdv_marksman","rhs_vdv_rifleman","rhs_vdv_grenadier","rhs_vdv_LAT","rhs_vdv_RShG2","rhs_vdv_rifleman_asval","rhs_vdv_marksman_asval"],
		["rhs_tigr_sts_vdv","rhs_tigr_m_vdv"],
		["rhs_tigr_sts_vdv","rhs_btr80_vdv","rhs_bmd2"],
		["rhs_bmd4ma_vdv","rhs_btr80a_vdv","rhs_sprut_vdv","rhs_bmp2d_vdv"]
	],
	[ // USA (Army - D) units
		["rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_medic","rhsusf_army_ocp_engineer","rhsusf_army_ocp_marksman","rhsusf_army_ocp_riflemanl","rhsusf_army_ocp_rifleman"],
		["rhsusf_army_ocp_maaws","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_medic","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_marksman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_teamleader"],
		["rhsusf_army_ocp_aa","rhsusf_army_ocp_javelin","rhsusf_army_ocp_maaws","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_medic","rhsusf_army_ocp_engineer","rhsusf_army_ocp_grenadier","rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_marksman","rhsusf_army_ocp_rifleman","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_sniper","rhsusf_army_ocp_squadleader","rhsusf_army_ocp_teamleader"],
		["rhsusf_m1025_d_m2"],
		["rhsusf_m1025_d_m2","rhsusf_m1025_d_Mk19","rhsusf_m113d_usarmy_M240"],
		["RHS_M2A3_BUSKIII","rhsusf_m1a2sep1tuskiid_usarmy","rhsusf_M1220_M153_M2_usarmy_d","rhsusf_M1220_MK19_usarmy_d"]
	],
	[ // USA (Army - W) units
		["rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_medic","rhsusf_army_ucp_engineer","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_riflemanl"],
		["rhsusf_army_ucp_autorifleman","f_army_ucp_maaws","rhsusf_army_ucp_medic","rhsusf_army_ucp_engineer","rhsusf_army_ucp_fso","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_marksman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_teamleader"],
		["rhsusf_army_ucp_aa","rhsusf_army_ucp_javelin","rhsusf_army_ucp_maaws","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_medic","rhsusf_army_ucp_engineer","rhsusf_army_ucp_fso","rhsusf_army_ucp_grenadier","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_marksman","rhsusf_army_ucp_rifleman","rhsusf_army_ucp_riflemanat","rhsusf_army_ucp_sniper","rhsusf_army_ucp_squadleader","rhsusf_army_ucp_teamleader"],
		["rhsusf_m1025_w_m2"],
		["rhsusf_m1025_w_m2","rhsusf_m1025_w_mk19","rhsusf_m113_usarmy_M240"],
		["RHS_M2A3_BUSKIII_wd","rhsusf_m1a2sep1tuskiiwd_usarmy","rhsusf_M1220_M153_M2_usarmy_wd","rhsusf_M1220_MK19_usarmy_wd"]
	]
];