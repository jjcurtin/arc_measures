COMPUTE FSM_Tot = (mean(FSM_2,FSM_3,FSM_6,FSM_7,FSM_8,FSM_9,FSM_10,FSM_11,FSM_12,FSM_13)*10) + (3-(mean (FSM_1,FSM_4,FSM_5)*3)) .
COMPUTE FSM_Miss = sum(sysmis(FSM_1),sysmis(FSM_2),sysmis(FSM_3),sysmis(FSM_4),sysmis(FSM_5),sysmis(FSM_6),sysmis(FSM_7),sysmis(FSM_8),sysmis(FSM_9),sysmis(FSM_10),sysmis(FSM_11),sysmis(FSM_12),sysmis(FSM_13)).
EXECUTE .
IF (FSM_Miss > 2) FSM_Tot = $Sysmis .
EXECUTE .
