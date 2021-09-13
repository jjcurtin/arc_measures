RECODE
  STAI_1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_1r .
EXECUTE .

RECODE
  STAI_2
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_2r .
EXECUTE .

RECODE
  STAI_5
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_5r .
EXECUTE .

RECODE
  STAI_8
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_8r .
EXECUTE .

RECODE
  STAI_10
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_10r .
EXECUTE .

RECODE
  STAI_11
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_11r .
EXECUTE .

RECODE
  STAI_15
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_15r .
EXECUTE .

RECODE
  STAI_16
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_16r .
EXECUTE .

RECODE
  STAI_19
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_19r .
EXECUTE .

RECODE
  STAI_20
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  STAI_20r .
EXECUTE .

COMPUTE STAI_Tot = mean.15(STAI_1r,STAI_2r,STAI_3,STAI_4,STAI_5r,STAI_6,STAI_7,STAI_8r ,STAI_9,STAI_10r,STAI_11r,STAI_12,STAI_13,STAI_14,STAI_15r,STAI_16r,STAI_17,STAI_18,STAI_19r,STAI_20) * 20 + 20.
EXECUTE .
