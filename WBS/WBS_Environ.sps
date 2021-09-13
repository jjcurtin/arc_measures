COMPUTE WBS_Env = (mean(WBS_1,WBS_4,WBS_6,WBS_7,WBS_9,WBS_10,WBS_12,WBS_14)*8) + (30-(mean (WBS_2,WBS_3,WBS_5,WBS_8,WBS_11,WBS_13)*6)) .

COMPUTE WBS_Miss = sum(sysmis(WBS_1),sysmis(WBS_2),sysmis(WBS_3),sysmis(WBS_4),sysmis(WBS_5),sysmis(WBS_6),sysmis(WBS_7),sysmis(WBS_8),sysmis(WBS_9),sysmis(WBS_10),sysmis(WBS_11),sysmis(WBS_12),sysmis(WBS_13),sysmis(WBS_14)).
EXECUTE .

IF (WBS_Miss > 2) WBS_Tot = $Sysmis .
EXECUTE .
