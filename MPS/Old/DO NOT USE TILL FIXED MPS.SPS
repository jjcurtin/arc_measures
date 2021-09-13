* Last edited: 12-06-06 by JJC.
* Assumes 1 = 'True' 0= 'False'.
* Does NOT score the validity indices (VRIN, TRIN) and therefore does NOT detect Invalid profiles.
* User must verify that all primary trait scales were scored (i.e., not missing) before interpreting broad trait (i.e. PEM,NEM, CON) b/c broad trait will be calculated regardless of missing primary trait scales.

*COUNT THE NUMBER OF NON-MISSING ITEMS FOR EACH SCALE.
*MPS ITEMS WRITTEN IN UPPER CASE ARE KEYED AS FALSE (REVERSE CODED), LOWER CASE KEYED AS TRUE (NORMAL CODED).

COUNT WB_N = mps1 mps26 mps38 mps50 mps62 mps74 mps85 mps97 mps109 mps121
 mps133 mps144 (0,1).
COUNT SP_N = mps2 mps15 mps39 mps51 mps75 mps87 mps110 MPS63 MPS98
 MPS122 MPS134 MPS145 (0,1).
COUNT AC_N = mps3 mps16 mps27 mps52 mps76 mps88 mps111 mps123 mps135
 mps146 MPS64 MPS99 (0,1).
COUNT SC_N = mps5 mps17 mps40 mps77 mps112 MPS28 MPS65 MPS89 MPS100
 MPS124 MPS136 MPS148 (0,1).

COUNT SR_N = mps6 mps18 mps29 mps41 mps53 mps78 mps90 mps101 mps113
 mps125 mps137 mps149 (0,1).
COUNT AL_N = mps7 mps19 mps30 mps42 mps54 mps66 mps91 mps102 mps114 mps126
 mps138 mps150 (0,1).
COUNT AG_N = mps8 mps20 mps31 mps43 mps55 mps67 mps103 mps115 mps127
 mps139 mps151 MPS79 (0,1).

COUNT CT_N = mps9 mps44 mps56 mps68 mps92 mps116 mps128 mps140 MPS21
 MPS33 MPS80 MPS152 (0,1).
COUNT HA_N = mps34 mps69 mps81 mps93 mps105 mps129 MPS11 MPS22 MPS46
 MPS57 MPS141 MPS153 (0,1).
COUNT TD_N = mps12 mps23 mps35 mps58 mps70 mps82 mps94 mps106 mps142
 mps154 MPS47 MPS118 (0,1).

COUNT AB_N = mps13 mps24 mps36 mps48 mps59 mps71 mps83 mps95 mps107
 mps119 mps130 mps155 (0,1).
COUNT UV_N = mps25 mps49 mps72 mps96 mps120 mps143 mps147 MPS4 MPS14 MPS37
 MPS61 MPS84 MPS108 MPS131 (0,1).

*TOTAL RAW SCALES.
COUNT WB_T= mps1 mps26 mps38 mps50 mps62 mps74 mps85 mps97 mps109 mps121
 mps133 mps144 (1).
COUNT SP_T = mps2 mps15 mps39 mps51 mps75 mps87 mps110 (1).
COUNT SP_F = MPS63 MPS98 MPS122 MPS134 MPS145 (0).
COUNT AC_T = mps3 mps16 mps27 mps52 mps76 mps88 mps111 mps123 mps135
 mps146 (1).
COUNT AC_F = MPS64 MPS99 (0).
COUNT SC_T = mps5 mps17 mps40 mps77 mps112 (1).
COUNT SC_F =MPS28 MPS65 MPS89 MPS100 MPS124 MPS136 MPS148 (0).

COUNT AG_T = mps8 mps20 mps31 mps43 mps55 mps67 mps103 mps115 mps127
 mps139 mps151 (1).
COUNT AG_F =  MPS79 (0).
COUNT SR_T = mps6 mps18 mps29 mps41 mps53 mps78 mps90 mps101 mps113 mps125
 mps137 mps149 (1).
COUNT AL_T = mps7 mps19 mps30 mps42 mps54 mps66 mps91 mps102 mps114 mps126
 mps138 mps150 (1).

COUNT CT_T= mps9 mps44 mps56 mps68 mps92 mps116 mps128 mps140 (1).
COUNT CT_F= MPS21 MPS33 MPS80 MPS152 (0).
COUNT HA_T = mps34 mps69 mps81 mps93 mps105 mps129 (1).
COUNT HA_F = MPS11 MPS22 MPS46 MPS57 MPS141 MPS153 (0).
COUNT TD_T = mps12 mps23 mps35 mps58 mps70 mps82 mps94 mps106 mps142
 mps154 (1).
COUNT TD_F = MPS47 MPS118 (0).

COUNT AB_T = mps13 mps24 mps36 mps48 mps59 mps71 mps83 mps95 mps107 mps119
 mps130 mps155 (1).
COUNT UV_T = mps25 mps49 mps72 mps96 mps120 mps143 mps147 (1).
COUNT UV_F = MPS4 MPS14 MPS37 MPS61 MPS84 MPS108 MPS131 (0).
EXECUTE.

*PRORATE SCALES.  SET TO MISSING IF < 75% NON-MISSING.
DO IF (WB_N > 8).
	COMPUTE MPS_wb = ((WB_T) / WB_N ) * 12.
END IF.

DO IF (SP_N > 8).
	COMPUTE MPS_sp = ((SP_T + SP_F) / SP_N) * 12.
END IF.

DO IF (AC_N > 8).
	COMPUTE MPS_ac = ((AC_T + AC_F) / AC_N) * 12.
END IF.

DO IF (SC_N > 8).
	COMPUTE MPS_sc = ((SC_T + SC_F) / SC_N) * 12.
END IF.

DO IF (SR_N > 8).
	COMPUTE MPS_sr = ((SR_T) / SR_N) * 12.
END IF.

DO IF (AL_N > 8).
	COMPUTE MPS_al = ((AL_T) / AL_N) * 12.
END IF.

DO IF (AG_N > 8).
	COMPUTE MPS_ag = ((AG_T + AG_F) / AG_N) * 12.
END IF.

DO IF (CT_N > 8).
	COMPUTE MPS_ct = ((CT_T + CT_F) / CT_N) * 12.
END IF.

DO IF (HA_N > 8).
	COMPUTE MPS_ha = ((HA_T + HA_F) / HA_N) * 12.
END IF.

DO IF (TD_N > 8).
	COMPUTE MPS_td = ((TD_T + TD_F) / TD_N) * 12.
END IF.

DO IF (AB_N > 8).
	COMPUTE MPS_ab = ((AB_T) / AB_N) * 12.
END IF.

DO IF (UV_N > 8).
	COMPUTE MPS_uv = ((UV_T + UV_F) / UV_N) * 12.
END IF.


* SCORE THE FACTORS.
COMPUTE MPS_pem = RND((MPS_wb * 1.933) + (mps_sp * 1.669) + (MPS_ac * 1.671) + 
 (MPS_sc * 1.950) + (MPS_sr * 0.085) + (MPS_al * 0.292) + 
 (MPS_ag * 0.130) + (MPS_ct * 0.048) + (MPS_ha * 0.015) + 
 (MPS_td * 0.070) + 13.712).

COMPUTE MPS_nem = RND((MPS_wb * 0.127) + (mps_sp * 0.150) + (MPS_ac * 0.038) + 
 (MPS_sc * 0.279) + (MPS_sr * 1.90) + (MPS_al * 3.061) + 
 (MPS_ag * 2.551) + (MPS_ct * 0.045) + (MPS_ha * 0.126) + 
 (MPS_td * 0.147) + 6.270).

COMPUTE MPS_con = RND((MPS_wb * -0.085) + (MPS_sp * -0.052) + (MPS_ac * 0.241) + 
 (MPS_sc * -0.068) + (MPS_sr * 0.046) + (MPS_al * -0.302) + 
 (MPS_ag * 0.296) + (MPS_ct * 2.717) + (MPS_ha * 2.579) + 
 (MPS_td * 2.199) + 20.742).
EXECUTE.

DELETE VARIABLES mps1 to mps155.
DELETE VARIABLES WB_N to UV_F.
EXECUTE.