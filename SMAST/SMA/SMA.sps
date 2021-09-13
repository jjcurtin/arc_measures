COMPUTE SMA_Tot = (mean(SMA_2,SMA_3,SMA_6,SMA_7,SMA_8,SMA_9,SMA_10,SMA_11,SMA_12,SMA_13)*10) + (3-(mean(SMA_1,SMA_4,SMA_5)*3)).
COMPUTE SMA_Miss = sum(sysmis(SMA_1),sysmis(SMA_2),sysmis(SMA_3),sysmis(SMA_4),sysmis(SMA_5),sysmis(SMA_6),sysmis(SMA_7),sysmis(SMA_8),sysmis(SMA_9),sysmis(SMA_10),sysmis(SMA_11),sysmis(SMA_12),sysmis(SMA_13)).
EXECUTE .
IF (SMA_Miss > 2) SMA_Tot = $Sysmis .
EXECUTE .

