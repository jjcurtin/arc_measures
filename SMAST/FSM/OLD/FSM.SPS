COMPUTE FSMTot = (mean(FSM2,FSM3,FSM6,FSM7,FSM8,FSM9,FSM10,FSM11,FSM12,FSM13)*10) + (3-(mean (FSM1,FSM4,FSM5)*3)) .
COMPUTE FSMMiss = sum(sysmis(FSM1),sysmis(FSM2),sysmis(FSM3),sysmis(FSM4),sysmis(FSM5),sysmis(FSM6),sysmis(FSM7),sysmis(FSM8),sysmis(FSM9),sysmis(FSM10),sysmis(FSM11),sysmis(FSM12),sysmis(FSM13)).
EXECUTE .
IF (FSMMiss > 3) FSMTot = $Sysmis .
EXECUTE .
