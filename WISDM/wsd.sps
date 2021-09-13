COMPUTE wisdm_aff = mean.4(wisdm20,wisdm36,wisdm43,wisdm48,wisdm67).
COMPUTE wisdm_auto = mean.4(wisdm5,wisdm19,wisdm26,wisdm41,wisdm55).
COMPUTE wisdm_loss = mean.3(wisdm6,wisdm28,wisdm34,wisdm62).
COMPUTE wisdm_beh = mean.6(wisdm10,wisdm21,wisdm35,wisdm38,wisdm46,wisdm49,wisdm68).
COMPUTE wisdm_cog = mean.4(wisdm13,wisdm15,wisdm24,wisdm39,wisdm57).
COMPUTE wisdm_cra = mean.3(wisdm11,wisdm29,wisdm37,wisdm50).
COMPUTE wisdm_cue = mean.6(wisdm4,wisdm17,wisdm23,wisdm40,wisdm42,wisdm51,wisdm59).
COMPUTE wisdm_neg = mean.5(wisdm7,wisdm18,wisdm25,wisdm32,wisdm58,wisdm65).
COMPUTE wisdm_pos = mean.3(wisdm3,wisdm8,wisdm45,wisdm60,wisdm64).
COMPUTE wisdmsoc = mean.3(wisdm22,wisdm30,wisdm44,wisdm52).
COMPUTE wisdm_taste = mean.5(wisdm1,wisdm12,wisdm27,wisdm33,wisdm53,wisdm66).
COMPUTE wisdm_tol = mean.4(wisdm9,wisdm14,wisdm47,wisdm54,wisdm63).
COMPUTE wisdm_wel = mean.4(wisdm2,wisdm16,wisdm31,wisdm56,wisdm61).
COMPUTE wisdm_tot1 = mean.51(wisdm1 to wisdm68) * 68.
COMPUTE wisdm_tot2 = sum(wisdm_aff to wisdm_wel).
EXECUTE .

DELETE VARIABLES wisdm1 wisdm2 wisdm3 wisdm4 wisdm5 wisdm6 wisdm7 wisdm8 wisdm9 wisdm10 wisdm11 wisdm12 wisdm13 wisdm14 wisdm15 wisdm16 wisdm17 wisdm18 wisdm19 wisdm20.
DELETE VARIABLES wisdm21 wisdm22 wisdm23 wisdm24 wisdm25 wisdm26 wisdm27 wisdm28 wisdm29 wisdm30 wisdm31 wisdm32 wisdm33 wisdm34 wisdm35 wisdm36 wisdm37 wisdm38 wisdm39 wisdm40. 
DELETE VARIABLES wisdm41 wisdm42 wisdm43 wisdm44 wisdm45 wisdm46 wisdm47 wisdm48 wisdm49 wisdm50 wisdm51 wisdm52 wisdm53 wisdm54 wisdm55 wisdm56 wisdm57 wisdm58 wisdm59 wisdm60.
DELETE VARIABLES wisdm61 wisdm62 wisdm63 wisdm64 wisdm65 wisdm66 wisdm67 wisdm68.
EXECUTE .