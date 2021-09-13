*WISDM
COMPUTE wsd_att = MEAN(wisdm20,wisdm36,wisdm43,wisdm48,wisdm67) .
COMPUTE wsd_auto = MEAN(wisdm5,wisdm19,wisdm26,wisdm41,wisdm55) .
COMPUTE wsd_lcon = MEAN(wisdm6,wisdm28,wisdm34,wisdm62) .
COMPUTE wsd_mel = MEAN(wisdm10,wisdm21,wisdm35,wisdm38,wisdm46,wisdm49,wisdm86) .
COMPUTE wsd_cog = MEAN(wisdm13,wisdm15,wisdm24,wisdm39,wisdm57) .
COMPUTE wsd_crav = MEAN(wisdm11,wisdm29,wisdm37,wisdm50) .
COMPUTE wsd_cue = MEAN(wisdm4,wisdm17,wisdm23,wisdm40,wisdm42,wisdm51,wisdm59) .
COMPUTE wsd_negr = MEAN(wisdm7,wisdm18,wisdm25,wisdm32,wisdm58,wisdm65) .
COMPUTE wsd_posr = MEAN(wisdm3,wisdm8,wisdm45,wisdm60,wisdm64) .
COMPUTE wsd_soc = MEAN(wisdm22,wisdm30,wisdm44,wisdm52) .
COMPUTE wsd_tast = MEAN(wisdm1,wisdm12,wisdm27,wisdm33,wisdm53,wisdm66) .
COMPUTE wsd_tol = MEAN(wisdm9,wisdm14,wisdm47,wisdm54,wisdm63) .
COMPUTE wsd_wght = MEAN(wisdm2,wisdm16,wisdm31,wisdm56,wisdm61) .
COMPUTE wsd_tot = SUM(wsd_auto,wsd_lcon,wsd_mel,wsd_cog,wsd_crav,wsd_cue,wsd_negr,wsd_posr,wsd_soc,wsd_tast,wsd_tol,wsd_wght) .
EXECUTE .