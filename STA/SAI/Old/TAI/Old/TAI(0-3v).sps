RECODE
  TAI1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI1r .
RECODE
  TAI6
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI6r .
RECODE
  TAI7
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI7r .
RECODE
  TAI10
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI10r .
RECODE
  TAI13
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI13r .
RECODE
  TAI16
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI16r .
RECODE
  TAI19
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  TAI19r .
COMPUTE tai_tot = mean.15(TAI1r,TAI2,TAI3,TAI4,TAI5,TAI6r,TAI7r,TAI8 ,TAI9,TAI10r,TAI11,TAI12,TAI13r,TAI14,TAI15,TAI16r,TAI17,TAI18,TAI19r,TAI20) * 20 + 20.
EXECUTE .

DELETE VARIABLES TAI1 to TAI20.
DELETE VARIABLES TAI1r TAI6r TAI7r TAI10r TAI13r TAI16r TAI19r.
EXECUTE.

