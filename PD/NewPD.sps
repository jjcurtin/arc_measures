COMPUTE PD__Tot = (mean(PD_3,PD_4,PD_5,PD_6,PD_7,PD_9,PD_10,PD_11,PD_12,PD_13,PD_15,PD_17,PD_19,PD_20,PD_22,PD_23,PD_24,PD_35,PD_36,PD_40,PD_41,PD_44,PD_47,PD_50)*24) + (26-(mean(PD_1,PD_2,PD_8,PD_14,PD_16,PD_18,PD_21,PD_25,PD_26,PD_27,PD_28,PD_29,PD_30,PD_31,PD_32,PD_33,PD_34,PD_37,PD_38,PD_39,PD_42,PD_43,PD_45,PD_46,PD_48,PD_49)*26)).

COMPUTE PD_Miss = sum(sysmis(PD_1),sysmis(PD_2),sysmis(PD_3),sysmis(PD_4),sysmis(PD_5),sysmis(PD_6),sysmis(PD_7),sysmis(PD_8),sysmis(PD_9),sysmis(PD_10),sysmis(PD_11),sysmis(PD_12),sysmis(PD_13),sysmis(PD_14),sysmis(PD_15),sysmis(PD_16),sysmis(PD_17),sysmis(PD_18),sysmis(PD_19),sysmis(PD_20),sysmis(PD_21),sysmis(PD_22),sysmis(PD_23),sysmis(PD_24),sysmis(PD_25),sysmis(PD_26),sysmis(PD_27),sysmis(PD_28),sysmis(PD_29),sysmis(PD_30),sysmis(PD_31),sysmis(PD_32),sysmis(PD_33),sysmis(PD_34),sysmis(PD_35),sysmis(PD_36),sysmis(PD_37),sysmis(PD_38),sysmis(PD_39),sysmis(PD_40),sysmis(PD_41),sysmis(PD_42),sysmis(PD_43),sysmis(PD_44),sysmis(PD_45),sysmis(PD_46),sysmis(PD_47),sysmis(PD_48),sysmis(PD_49),sysmis(PD_50)).
EXECUTE.

IF (PD_Miss>10) PD_Tot=$Sysmis.
EXECUTE .
