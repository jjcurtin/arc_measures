COMPUTE SAI_Tot = (mean(SAI_3,SAI_4,SAI_6,SAI_7,SAI_9,SAI_12,SAI_13,SAI_14,SAI_17,SAI_18)*10) + (30 - (mean(SAI_1,SAI_2,SAI_5,SAI_8,SAI_10,SAI_11,SAI_15,SAI_16,SAI_19,SAI_20)*10)).
COMPUTE SAI_Miss = sum(sysmis(SAI_1),sysmis(SAI_2),sysmis(SAI_3),sysmis(SAI_4),sysmis(SAI_5),sysmis(SAI_6),sysmis(SAI_7),sysmis(SAI_8),sysmis(SAI_9),sysmis(SAI_10),sysmis(SAI_11),sysmis(SAI_12),sysmis(SAI_13),sysmis(SAI_14),sysmis(SAI_15),sysmis(SAI_16),sysmis(SAI_17),sysmis(SAI_18),sysmis(SAI_19),sysmis(SAI_20)).
EXECUTE .
IF (SAI_Miss > 4) SAI_Tot = $Sysmis .
EXECUTE .

