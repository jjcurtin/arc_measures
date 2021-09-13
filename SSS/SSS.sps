COMPUTE SSS_Dis = (mean(SSS_12,SSS_13,SSS_25,SSS_30,SSS_33,SSS_35) * 6) + (4-(mean(SSS_1,SSS_29,SSS_32,SSS_36)*4)).
COMPUTE SSS_Dis_Miss = sum(sysmis(SSS_12),sysmis(SSS_13),sysmis(SSS_25),sysmis(SSS_30),sysmis(SSS_33),sysmis(SSS_35),sysmis(SSS_1),sysmis(SSS_29),sysmis(SSS_32),sysmis(SSS_36)).
EXECUTE.
IF(SSS_Dis_Miss>2) SSS_Dis=$Sysmis.

COMPUTE SSS_Bor = (mean(SSS_2,SSS_7,SSS_15,SSS_27,SSS_31) * 5) + (5-(mean(SSS_5,SSS_8,SSS_24,SSS_34,SSS_39)*5)).
COMPUTE SSS_Bor_Miss = sum(sysmis(SSS_2),sysmis(SSS_7),sysmis(SSS_15),sysmis(SSS_27),sysmis(SSS_31),sysmis(SSS_5),sysmis(SSS_8),sysmis(SSS_24),sysmis(SSS_34),sysmis(SSS_39)).
EXECUTE.
IF(SSS_Bor_Miss>2) SSS_Bor=$Sysmis.

COMPUTE SSS_Thr = (mean(SSS_11,SSS_20,SSS_21,SSS_38,SSS_40) * 5) + (5-(mean(SSS_3,SSS_16,SSS_17,SSS_23,SSS_28)*5)).
COMPUTE SSS_Thr_Miss = sum(sysmis(SSS_11),sysmis(SSS_20),sysmis(SSS_21),sysmis(SSS_38),sysmis(SSS_40),sysmis(SSS_3),sysmis(SSS_16),sysmis(SSS_17),sysmis(SSS_23),sysmis(SSS_28)).
EXECUTE.
IF(SSS_Thr_Miss>2) SSS_Thr=$Sysmis.

COMPUTE SSS_Exp = (mean(SSS_4,SSS_10,SSS_19,SSS_26,SSS_37) * 5) + (5-(mean(SSS_6,SSS_9,SSS_14,SSS_18,SSS_22)*5)).
COMPUTE SSS_Exp_Miss = sum(sysmis(SSS_4),sysmis(SSS_10),sysmis(SSS_19),sysmis(SSS_26),sysmis(SSS_37),sysmis(SSS_6),sysmis(SSS_9),sysmis(SSS_14),sysmis(SSS_18),sysmis(SSS_22)).
EXECUTE.
IF(SSS_Exp_Miss>2) SSS_Exp=$Sysmis.

COMPUTE SSS_Tot = (mean(SSS_2,SSS_4,SSS_7,SSS_10,SSS_11,SSS_12,SSS_13,SSS_15,SSS_19,SSS_20,SSS_21,SSS_25,SSS_26,SSS_27,SSS_30,SSS_31,SSS_33,SSS_35,SSS_37,SSS_38,SSS_40)*21) + (#-(mean(SSS_1,SSS_3,SSS_5,SSS_6,SSS_8,SSS_9,SSS_14,SSS_16,SSS_17,SSS_18,SSS_22,SSS_23,SSS_24,SSS_28,SSS_29,SSS_32,SSS_34,SSS_36,SSS_39)*19)).
COMPUTE SSS_Miss= sum(sysmis(SSS_1),sysmis(SSS_2),sysmis(SSS_3),sysmis(SSS_4),sysmis(SSS_5),sysmis(SSS_6),sysmis(SSS_7),sysmis(SSS_8),sysmis(SSS_9),sysmis(SSS_10),sysmis(SSS_11),sysmis(SSS_12),sysmis(SSS_13),sysmis(SSS_14),sysmis(SSS_15),sysmis(SSS_16),sysmis(SSS_17),sysmis(SSS_18),sysmis(SSS_19),sysmis(SSS_20),sysmis(SSS_21),sysmis(SSS_22),sysmis(SSS_23),sysmis(SSS_24),sysmis(SSS_25),sysmis(SSS_26),sysmis(SSS_27),sysmis(SSS_28),sysmis(SSS_29),sysmis(SSS_30),sysmis(SSS_31),sysmis(SSS_32),sysmis(SSS_33),sysmis(SSS_34),sysmis(SSS_35),sysmis(SSS_36),sysmis(SSS_37),sysmis(SSS_38),sysmis(SSS_39),sysmis(SSS_40)).
EXECUTE.
IF(SSS_Miss>8)SSS_Tot=$Sysmis.

EXECUTE .