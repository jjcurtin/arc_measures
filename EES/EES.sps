COMPUTE EES_Tot = (mean(EES_1,EES_5,EES_7,EES_8,EES_9,EES_10,EES_12,EES_14,EES_16,EES_17,EES_18,EES_19,EES_25,EES_27,EES_29,EES_31)*16) + (8-(mean EES_2,EES_3,EES_4,EES_6,EES_11,EES_13,EES_15,EES_20,EES_21,EES_22,EES_23,EES_24,EES_26,EES_28,EES_30,EES_32,EES_33)*17)).
COMPUTE EES_Miss = sum(sysmis(EES_1),sysmis(EES_2),sysmis(EES_3),sysmis(EES_4),sysmis(EES_5),sysmis(EES_6),sysmis(EES_7),sysmis(EES_8),sysmis(EES_9),sysmis(EES_10),sysmis(EES_11),sysmis(EES_12),sysmis(EES_13),sysmis(EES_14),sysmis(EES_15),sysmis(EES_16),sysmis(EES_17),sysmis(EES_18),sysmis(EES_19),sysmis(EES_20), sysmis(EES_21),sysmis(EES_22),sysmis(EES_23),sysmis(EES_24),sysmis(EES_25),sysmis(EES_26),sysmis(EES_27),sysmis(EES_28),sysmis(EES_29),sysmis(EES_30),sysmis(EES_31),sysmis(EES_32),sysmis(EES_33)).
EXECUTE .
IF (EES_Miss > 6) EES_Tot = $Sysmis .
EXECUTE .


