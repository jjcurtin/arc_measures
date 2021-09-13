COMPUTE PSWQ_Tot = (mean(PSWQ_2,PSWQ_4,PSWQ_5,PSWQ_6,PSWQ_7,PSWQ_9,PSWQ_12,PSWQ_13,PSWQ_14,PSWQ_15,PSWQ_16)*11) + (20-(mean(PSWQ_1,PSWQ_3,PSWQ_8,PSWQ_10,PSWQ_11)*5)) .
COMPUTE PSWQ_Miss = sum(sysmis(PSWQ_1),sysmis(PSWQ_2),sysmis(PSWQ_3),sysmis(PSWQ_4),sysmis(PSWQ_5),sysmis(PSWQ_6),sysmis(PSWQ_7),sysmis(PSWQ_8),sysmis(PSWQ_9),sysmis(PSWQ_10),sysmis(PSWQ_11),sysmis(PSWQ_12),sysmis(PSWQ_13),sysmis(PSWQ_14),sysmis(PSWQ_15),sysmis(PSWQ_16)).
EXECUTE .
IF (PSWQ_Miss > 3) PSWQ_Tot = $Sysmis .
EXECUTE .
