COMPUTE MSM_Tot = (mean(MSM_2,MSM_3,MSM_6,MSM_7,MSM_8,MSM_9,MSM_10,MSM_11,MSM_12,MSM_13)*10) + (3-(mean (MSM_1,MSM_4,MSM_5)*3)) .
COMPUTE MSM_Miss = sum(sysmis(MSM_1),sysmis(MSM_2),sysmis(MSM_3),sysmis(MSM_4),sysmis(MSM_5),sysmis(MSM_6),sysmis(MSM_7),sysmis(MSM_8),sysmis(MSM_9),sysmis(MSM_10),sysmis(MSM_11),sysmis(MSM_12),sysmis(MSM_13)).
EXECUTE .
IF (MSM_Miss > 2) MSM_Tot = $Sysmis .
EXECUTE .
