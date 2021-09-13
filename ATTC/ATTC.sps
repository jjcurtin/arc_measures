COMPUTE ATTC_Foc = (mean(ATTC_4,ATTC_5,ATTC_9)*3) + (18-(mean (ATTC_1,ATTC_2,ATTC_3,ATTC_6,ATTC_7,ATTC_8)*6)) .

COMPUTE ATTC_Foc_Miss = sum(sysmis(ATTC_4),sysmis(ATTC_5),sysmis(ATTC_9),sysmis(ATTC_1),sysmis(ATTC_2),sysmis(ATTC_3),sysmis(ATTC_6),sysmis(ATTC_7),sysmis(ATTC_8)).
EXECUTE .
IF (ATTC_Foc_Miss > 1) ATTC_Foc = $Sysmis .


COMPUTE ATTC_Shif = (mean(ATTC_10,ATTC_13,ATTC_14,ATTC_17,ATTC_18,ATTC_19)*6) + (15-(mean (ATTC_11,ATTC_12,ATTC_15,ATTC_16,ATTC_20)*5)) .

COMPUTE ATTC_Shif_Miss = sum(sysmis(ATTC_10),sysmis(ATTC_13),sysmis(ATTC_14),sysmis(ATTC_17),sysmis(ATTC_18),sysmis(ATTC_19),sysmis(ATTC_11),sysmis(ATTC_12),sysmis(ATTC_15),sysmis(ATTC_16),sysmis(ATTC_20)).
EXECUTE .
IF (ATTC_Shif_Miss > 2) ATTC_Shif = $Sysmis .


COMPUTE ATTC_Tot = (mean(ATTC_4,ATTC_5,ATTC_9,ATTC_10,ATTC_13,ATTC_14,ATTC_17,ATTC_18,ATTC_19)*9) + (33-(mean (ATTC_1,ATTC_2,ATTC_3,ATTC_6,ATTC_7,ATTC_8,ATTC_11,ATTC_12,ATTC_15,ATTC_16,ATTC_20)*11)) .

COMPUTE ATTC_Miss = sum(sysmis(ATTC_1),sysmis(ATTC_2),sysmis(ATTC_3),sysmis(ATTC_4),sysmis(ATTC_5),sysmis(ATTC_6),sysmis(ATTC_7),sysmis(ATTC_8),sysmis(ATTC_9),sysmis(ATTC_10),sysmis(ATTC_11),sysmis(ATTC_12),sysmis(ATTC_13),sysmis(ATTC_14),sysmis(ATTC_15),sysmis(ATTC_16),sysmis(ATTC_17),sysmis(ATTC_18),sysmis(ATTC_19),sysmis(ATTC_20)).
EXECUTE .
IF (ATTC_Miss > 4) ATTC_Tot = $Sysmis .

EXECUTE .


