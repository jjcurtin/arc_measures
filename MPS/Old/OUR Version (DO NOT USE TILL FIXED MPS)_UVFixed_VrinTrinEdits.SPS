* Last edited: 12-06-06 by JJC.
* Assumes 1 = 'True' 0= 'False'.
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
	COMPUTE MPS_uv = ((UV_T + UV_F) / UV_N) * 14.
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

*VRINbf.

Compute VRINbf1 = 0.
Compute VRINbf2 = 0.
Compute VRINbf3 = 0.
Compute VRINbf4 = 0.
Compute VRINbf5 = 0.
Compute VRINbf6 = 0.
Compute VRINbf7 = 0.
Compute VRINbf8 = 0.
Compute VRINbf9 = 0.
Compute VRINbf10 = 0.
Compute VRINbf11 = 0.
Compute VRINbf12 = 0.
Compute VRINbf14 = 0.
Compute VRINbf15 = 0.
Compute VRINbf16 = 0.
Compute VRINbf17 = 0.
Compute VRINbf18 = 0.
Compute VRINbf19 = 0.
Compute VRINbf20 = 0.
Compute VRINbf21 = 0.

COMPUTE VRINbf1 = mps5 EQ 1 AND mps112 EQ 0.
COMPUTE VRINbf1 = mps5 EQ 0 AND mps112 EQ 1.
COMPUTE VRINbf2 = mps20 EQ 1 AND mps139 EQ 0.
COMPUTE VRINbf2 = mps20 EQ 0 AND mps139 EQ 1.
COMPUTE VRINbf3 = mps44 EQ 1 AND mps140 EQ 0.
COMPUTE VRINbf3 = mps44 EQ 0 AND mps140 EQ 1.
COMPUTE VRINbf4 = mps2 EQ 1 AND mps110 EQ 0.
COMPUTE VRINbf4 = mps2 EQ 0 AND mps110 EQ 1.
COMPUTE VRINbf5 = mps88 EQ 1 AND mps135 EQ 0.
COMPUTE VRINbf5 = mps88 EQ 0 AND mps135 EQ 1.
COMPUTE VRINbf6 = mps51 EQ 1 AND mps45 EQ 0.
COMPUTE VRINbf6 = mps51 EQ 0 AND mps45 EQ 1.
COMPUTE VRINbf7 = mps6 EQ 1 AND mps90 EQ 0.
COMPUTE VRINbf7 = mps6 EQ 0 AND mps90 EQ 1.
COMPUTE VRINbf8 = mps76 EQ 1 AND mps146 EQ 0.
COMPUTE VRINbf8 = mps76 EQ 0 AND mps146 EQ 1.
COMPUTE VRINbf9 = mps38 EQ 1 AND mps109 EQ 0.
COMPUTE VRINbf9 = mps38 EQ 0 AND mps109 EQ 1.
COMPUTE VRINbf10 = mps30 EQ 1 AND mps91 EQ 0.
COMPUTE VRINbf10 = mps30 EQ 0 AND mps91 EQ 1.
COMPUTE VRINbf11 = mps82 EQ 1 AND mps142 EQ 0.
COMPUTE VRINbf11 = mps82 EQ 0 AND mps142 EQ 1.
COMPUTE VRINbf12 = mps33 EQ 1 AND mps152 EQ 0.
COMPUTE VRINbf12 = mps33 EQ 0 AND mps152 EQ 1.
COMPUTE VRINbf13 = mps50 EQ 1 AND mps62 EQ 0.
COMPUTE VRINbf13 = mps50 EQ 0 AND mps62 EQ 1.
COMPUTE VRINbf14 = mps28 EQ 1 AND mps136 EQ 0.
COMPUTE VRINbf14 = mps28 EQ 0 AND mps136 EQ 1.
COMPUTE VRINbf15 = mps52 EQ 1 AND mps111 EQ 0.
COMPUTE VRINbf15 = mps52 EQ 0 AND mps111 EQ 1.
COMPUTE VRINbf16 = mps65 EQ 1 AND mps148 EQ 0.
COMPUTE VRINbf16 = mps65 EQ 0 AND mps148 EQ 1.
COMPUTE VRINbf17 = mps71 EQ 1 AND mps130 EQ 0.
COMPUTE VRINbf17 = mps71 EQ 0 AND mps130 EQ 1.
COMPUTE VRINbf18 = mps85 EQ 1 AND mps144 EQ 0.
COMPUTE VRINbf18 = mps85 EQ 0 AND mps144 EQ 1.
COMPUTE VRINbf19 = mps132 EQ 1 AND mps53 EQ 0.
COMPUTE VRINbf19 = mps132 EQ 0 AND mps53 EQ 1.
COMPUTE VRINbf20 = mps15 EQ 1 AND mps117 EQ 0.
COMPUTE VRINbf20 = mps15 EQ 0 AND mps117 EQ 1.
COMPUTE VRINbf21 = mps10 EQ 1 AND mps29 EQ 0.
COMPUTE VRINbf21 = mps10 EQ 0 AND mps29 EQ 1.

COUNT VRINbf=VRINbf1 to VRINbf21 (1).

*TRINbf.

Compute TRINbft1 = 0.
Compute TRINbft2 = 0.
Compute TRINbft3 = 0.
Compute TRINbft4 = 0.
Compute TRINbft5 = 0.
Compute TRINbft6 = 0.
Compute TRINbft7 = 0.
Compute TRINbft8 = 0.
Compute TRINbff1 = 0.
Compute TRINbff2 = 0.
Compute TRINbff3 = 0.
Compute TRINbff4 = 0.
Compute TRINbff5 = 0.
Compute TRINbff6 = 0.
Compute TRINbff7 = 0.
Compute TRINbff8 = 0.
Compute TRINbff9 = 0.
Compute TRINbff10 = 0.
Compute TRINbff11 = 0.
Compute TRINbff12 = 0.

COMPUTE TRINbft1 = mps28 EQ 1 AND mps112 EQ 1.
COMPUTE TRINbft2 = mps52 EQ 1 AND mps64 EQ 1.
COMPUTE TRINbft3 = mps70 EQ 1 AND mps118 EQ 1.
COMPUTE TRINbft4 = mps99 EQ 1 AND mps146 EQ 1.
COMPUTE TRINbft5 = mps5 EQ 1 AND mps136 EQ 1.
COMPUTE TRINbft6 = mps20 EQ 1 AND mps79 EQ 1.
COMPUTE TRINbft7 = mps15 EQ 1 AND mps98 EQ 1.
COMPUTE TRINbft8 = mps110 EQ 1 AND mps145 EQ 1.

COMPUTE TRINbff1 = mps51 EQ 0 AND mps63 EQ 0.
COMPUTE TRINbff2 = mps40 EQ 0 AND mps148 EQ 0.
COMPUTE TRINbff3 = mps69 EQ 0 AND mps46 EQ 0.
COMPUTE TRINbff4 = mps80 EQ 0 AND mps140 EQ 0.
COMPUTE TRINbff5 = mps5 EQ 0 AND mps136 EQ 0.
COMPUTE TRINbff6 = mps20 EQ 0 AND mps79 EQ 0.
COMPUTE TRINbff7 = mps15 EQ 0 AND mps98 EQ 0.
COMPUTE TRINbff8 = mps110 EQ 0 AND mps145 EQ 0.
COMPUTE TRINbff9 = mps132 EQ 0 AND mps60 EQ 0.
COMPUTE TRINbff10 = mps86 EQ 0 AND mps9 EQ 0.
COMPUTE TRINbff11 = mps30 EQ 0 AND mps73 EQ 0.
COMPUTE TRINbff12 = mps32 EQ 0 AND mps104 EQ 0.

COUNT TRINbft=TRINbft1 TO TRINbft8 (1).
COUNT TRINbff=TRINbff1 TO TRINbff12 (1).

COMPUTE TRINbf =12+TRINbft - TRINbff.

DELETE VARIABLES mps1 to mps155.
DELETE VARIABLES WB_N to UV_F.
EXECUTE.