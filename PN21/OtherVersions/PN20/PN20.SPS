COMPUTE pn20_pos = mean.8(pn20_1,pn20_3,pn20_5,pn20_9,pn20_10,pn20_12,pn20_14,pn20_16,pn20_17,pn20_19) * 10 .
COMPUTE pn20_neg = mean.8(pn20_2,pn20_4,pn20_6,pn20_7,pn20_8,pn20_11,pn20_13,pn20_15,pn20_18,pn20_20) * 10 .
EXECUTE .

DELETE VARIABLES pn20_1 to pn20_20.
EXECUTE.