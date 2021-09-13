RECODE
  taiy_1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_1r .
EXECUTE .

RECODE
  taiy_3
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_3r .
EXECUTE 


RECODE
  taiy_6
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_6r .
EXECUTE .

RECODE
  taiy_7
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_7r .
EXECUTE .

RECODE
  taiy_10
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_10r .
EXECUTE .

RECODE
  taiy_13
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_13r .
EXECUTE .

RECODE
  taiy_14
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_14r .
EXECUTE 

RECODE
  taiy_16
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_16r .
EXECUTE .

RECODE
  taiy_19
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  taiy_19r .
EXECUTE .

COMPUTE TAIy_Tot = mean.15(taiy_1r,taiy_2,taiy_3r,taiy_4,taiy_5,taiy_6r,taiy_7r,taiy_8 ,taiy_9,taiy_10r,taiy_11,taiy_12,taiy_13r,taiy_14r,taiy_15,taiy_16r,taiy_17,taiy_18,taiy_19r,taiy_20) * 20 + 20.
EXECUTE .
