COMPUTE CESD_Tot = (mean(CESD_1,CESD_2,CESD_3,CESD_5,CESD_6,CESD_7,CESD_9,CESD_10,CESD_11,CESD_13,CESD_14,CESD_15,CESD_17,CESD_18,CESD_19,CESD_20)*16) + (3-(mean (CESD_4,CESD_8,CESD_12,CESD_16)*4)) .
COMPUTE CESD_Miss = sum(sysmis(CESD_1),sysmis(CESD_2),sysmis(CESD_3),sysmis(CESD_4),sysmis(CESD_5),sysmis(CESD_6),sysmis(CESD_7),sysmis(CESD_8),sysmis(CESD_9),sysmis(CESD_10),sysmis(CESD_11),sysmis(CESD_12),sysmis(CESD_13),sysmis(CESD_14),sysmis(CESD_15),sysmis(CESD_16),sysmis(CESD_17),sysmis(CESD_18),sysmis(CESD_19),sysmis(CESD_20)).
EXECUTE .
IF (CESD_Miss > 4) CESD_Tot = $Sysmis .
EXECUTE .
