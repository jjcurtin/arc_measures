COMPUTE BFNE_Tot = (mean(BFNE_1,BFNE_3,BFNE_5,BFNE_6,BFNE_8,BFNE_9,BFNE_11,BFNE_12)*8) + (16-(mean(BFNE_2,BFNE_4,BFNE_7,BFNE_10)*4)) .
COMPUTE BFNE_Miss = sum(sysmis(BFNE_1),sysmis(BFNE_2),sysmis(BFNE_3),sysmis(BFNE_4),sysmis(BFNE_5),sysmis(BFNE_6),sysmis(BFNE_7),sysmis(BFNE_8),sysmis(BFNE_9),sysmis(BFNE_10),sysmis(BFNE_11),sysmis(BFNE_12)).
EXECUTE .
IF (BFNE_Miss > 2) BFNE_Tot = $Sysmis .
EXECUTE .
