COMPUTE BFI_Ext = (mean(BFI_1,BFI_11,BFI_16,BFI_26,BFI_36)*5) + (12-(mean (BFI_6,BFI_21,BFI_31)*3)) .

COMPUTE BFI_Ext_Miss = sum(sysmis(BFI_1),sysmis(BFI_11),sysmis(BFI_16),sysmis(BFI_26),sysmis(BFI_36),sysmis(BFI_6),sysmis(BFI_21),sysmis(BFI_31)) .
EXECUTE .
IF (BFI_Ext_Miss > 1) BFI_Ext = $Sysmis .


COMPUTE BFI_Agr = (mean(BFI_7,BFI_17,BFI_22,BFI_32,BFI_42)*5) + (16-(mean (BFI_2,BFI_12,BFI_27,BFI_37)*4)) .

COMPUTE BFI_Agr_Miss = sum(sysmis(BFI_7),sysmis(BFI_17),sysmis(BFI_22),sysmis(BFI_32),sysmis(BFI_42),sysmis(BFI_2),sysmis(BFI_12),sysmis(BFI_27),sysmis(BFI_37)) .
EXECUTE .
IF (BFI_Agr_Miss > 1) BFI_Agr = $Sysmis .


COMPUTE BFI_Con = (mean(BFI_3,BFI_13,BFI_28,BFI_33,BFI_38)*5) + (16-(mean (BFI_8,BFI_18,BFI_23,BFI_43)*4)) .

COMPUTE BFI_Con_Miss = sum(sysmis(BFI_3),sysmis(BFI_13),sysmis(BFI_28),sysmis(BFI_33),sysmis(BFI_38),sysmis(BFI_8),sysmis(BFI_18),sysmis(BFI_23),sysmis(BFI_43)) .
EXECUTE .
IF (BFI_Con_Miss > 1) BFI_Con = $Sysmis .


COMPUTE BFI_Neu = (mean(BFI_4,BFI_14,BFI_19,BFI_29,BFI_39)*5) + (12-(mean (BFI_9,BFI_24,BFI_34)*3)) .

COMPUTE BFI_Neu_Miss = sum(sysmis(BFI_4),sysmis(BFI_14),sysmis(BFI_19),sysmis(BFI_29),sysmis(BFI_39),sysmis(BFI_9),sysmis(BFI_24),sysmis(BFI_34)) .
EXECUTE .
IF (BFI_Neu_Miss > 1) BFI_Neu = $Sysmis .


COMPUTE BFI_Ope = (mean(BFI_5,BFI_10,BFI_15,BFI_20,BFI_25,BFI_30,BFI_40,BFI_44)*8) + (8-(mean (BFI_35,BFI_41)*2)) .

COMPUTE BFI_Ope_Miss = sum(sysmis(BFI_5),sysmis(BFI_10),sysmis(BFI_15),sysmis(BFI_20),sysmis(BFI_25),sysmis(BFI_30),sysmis(BFI_40),sysmis(BFI_44),sysmis(BFI_35),sysmis(41)) .
EXECUTE .
IF (BFI_Ope_Miss > 2) BFI_Ope = $Sysmis .


EXECUTE .


