COMPUTE ASM_Self = (mean(ASM_2,ASM_3,ASM_6,ASM_7,ASM_8,ASM_9,ASM_10,ASM_11,ASM_12,ASM_13)*10) + (3-(mean (ASM_1,ASM_4,ASM_5)*3)) .
COMPUTE ASMSelfMiss = sum(sysmis(ASM_1),sysmis(ASM_2),sysmis(ASM_3),sysmis(ASM_4),sysmis(ASM_5),sysmis(ASM_6),sysmis(ASM_7),sysmis(ASM_8),sysmis(ASM_9),sysmis(ASM_10),sysmis(ASM_11),sysmis(ASM_12),sysmis(ASM_13)).
EXECUTE .

IF (ASMSelfMiss > 3) ASM_Self = $Sysmis .


COMPUTE ASM_Dad = (mean(ASM_15,ASM_16,ASM_19,ASM_20,ASM_21,ASM_22,ASM_23,ASM_24,ASM_25,ASM_26)*10) + (3-(mean (ASM_14,ASM_17,ASM_18)*3)) .
COMPUTE ASMDadMiss = sum(sysmis(ASM_14),sysmis(ASM_15),sysmis(ASM_16),sysmis(ASM_17),sysmis(ASM_18),sysmis(ASM_19),sysmis(ASM_20),sysmis(ASM_21),sysmis(ASM_22),sysmis(ASM_23),sysmis(ASM_24),sysmis(ASM_25),sysmis(ASM_26)).
EXECUTE .

IF (ASMDadMiss > 3) ASM_Dad = $Sysmis .


COMPUTE ASM_Mom = (mean(ASM_28,ASM_29,ASM_32,ASM_33,ASM_34,ASM_35,ASM_36,ASM_37,ASM_38,ASM_39)*10) + (3-(mean (ASM_27,ASM_30,ASM_31)*3)) .
COMPUTE ASMMomMiss = sum(sysmis(ASM_27),sysmis(ASM_28),sysmis(ASM_29),sysmis(ASM_30),sysmis(ASM_31),sysmis(ASM_32),sysmis(ASM_33),sysmis(ASM_34),sysmis(ASM_35),sysmis(ASM_36),sysmis(ASM_37),sysmis(ASM_38),sysmis(ASM_39)).
EXECUTE .

IF (ASMMomMiss > 3) ASM_Mom = $Sysmis .

EXECUTE .
