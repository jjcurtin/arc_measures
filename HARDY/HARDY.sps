COMPUTE HARDY_Chal = (mean(HARDY_15,HARDY_21,HARDY_30,HARDY_33,HARDY_36)*5) + (30-(mean (HARDY_5,HARDY_6,HARDY_12,HARDY_16,HARDY_20,HARDY_27,HARDY_32,HARDY_35,HARDY_38,HARDY_40)*10)) .

COMPUTE HARDY_Chal_Miss = sum(sysmis(HARDY_15),sysmis(HARDY_21),sysmis(HARDY_30),sysmis(HARDY_33),sysmis(HARDY_36),sysmis(HARDY_5),sysmis(HARDY_6)sysmis(HARDY_12),sysmis(HARDY_16),sysmis(HARDY_20),sysmis(HARDY_27),sysmis(HARDY_32),sysmis(HARDY_35),sysmis(HARDY_38),sysmis(HARDY_40)).
EXECUTE .
IF (HARDY_Chal_Miss > 3) HARDY_Chal = $Sysmis .


COMPUTE HARDY_Comm = (mean(HARDY_1,HARDY_8,HARDY_17, HARDY_25,HARDY_39)*5) + (30-(mean (HARDY_7,HARDY_9,HARDY_18,HARDY_23,HARDY_24,HARDY_31,HARDY_37,HARDY_41,HARDY_44,HARDY_45)*10)) .

COMPUTE HARDY_Comm_Miss = sum(sysmis(HARDY_1),sysmis(HARDY_8),sysmis(HARDY_17),sysmis(HARDY_25),sysmis(HARDY_39),sysmis(HARDY_7),sysmis(HARDY_9)sysmis(HARDY_18),sysmis(HARDY_23),sysmis(HARDY_24),sysmis(HARDY_31),sysmis(HARDY_37),sysmis(HARDY_41),sysmis(HARDY_44),sysmis(HARDY_45)).
EXECUTE .
IF (HARDY_Comm_Miss > 3) HARDY_Comm = $Sysmis .


COMPUTE HARDY_Cont = (mean(HARDY_2,HARDY_13,HARDY_19,HARDY_22,HARDY_42)*5) + (30-(mean (HARDY_3,HARDY_4,HARDY_10,HARDY_11,HARDY_14,HARDY_26,HARDY_28,HARDY_29,HARDY_34,HARDY_43)*10)) .

COMPUTE HARDY_Cont_Miss = sum(sysmis(HARDY_2),sysmis(HARDY_13),sysmis(HARDY_19),sysmis(HARDY_22),sysmis(HARDY_42),sysmis(HARDY_3),sysmis(HARDY_4)sysmis(HARDY_10),sysmis(HARDY_11),sysmis(HARDY_14),sysmis(HARDY_26),sysmis(HARDY_28),sysmis(HARDY_29),sysmis(HARDY_34),sysmis(HARDY_43)).
EXECUTE .
IF (HARDY_Cont_Miss > 3) HARDY_Cont = $Sysmis .

EXECUTE .


