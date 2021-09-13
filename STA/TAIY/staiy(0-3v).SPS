RECODE
  stai1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai1r .
EXECUTE .

RECODE
  stai2
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai2r .
EXECUTE .

RECODE
  stai5
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai5r .
EXECUTE .

RECODE
  stai8
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai8r .
EXECUTE .

RECODE
  stai10
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai10r .
EXECUTE .

RECODE
  stai11
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai11r .
EXECUTE .

RECODE
  stai15
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai15r .
EXECUTE .

RECODE
  stai16
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai16r .
EXECUTE .

RECODE
  stai19
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai19r .
EXECUTE .

RECODE
  stai20
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  stai20r .
EXECUTE .

COMPUTE STAI_Tot = mean.15(stai1r,stai2r,stai3,stai4,stai5r,stai6,stai7,stai8r ,stai9,stai10r,stai11r,stai12,stai13,stai14,stai15r,stai16r,stai17,stai18,stai19r,stai20) * 20 + 20.
EXECUTE .
