COMPUTE BAI_pun = mean(BAI_6,BAI_10,BAI_13,BAI_15, BAI_20) * 5+(5-mean(BAI_1, BAI_18)).
COMPUTE BAI_punmiss= sum(sysmis(BAI_1), sysmis(BAI_6), sysmis(BAI_10), sysmis(BAI_13), sysmis(BAI_15), sysmis(BAI_18), sysmis(BAI_20)).  
IF (BAI_punmiss>1) BAI_pun= $sysmis.
Execute. 



COMPUTE BAI_rew = mean.4(BAI_3,BAI_5,BAI_11,BAI_14,BAI_19) * 5.
COMPUTE BAI_drv = mean.4(BAI_2,BAI_7,BAI_9,BAI_17) * 4.
COMPUTE BAI_fun = mean.4(BAI_4,BAI_8,BAI_12,BAI_16) * 4.

Compute BAS = BAI_rew + BAI_drv + BAI_fun .
Execute .
