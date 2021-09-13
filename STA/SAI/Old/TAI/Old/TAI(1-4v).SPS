RECODE
  tai1
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  tai1r .
EXECUTE .

RECODE
  tai6
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai6r .
EXECUTE .

RECODE
  tai7
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai7r .
EXECUTE .

RECODE
  tai10
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai10r .
EXECUTE .

RECODE
  tai13
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai13r .
EXECUTE .

RECODE
  tai16
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai16r .
EXECUTE .

RECODE
  tai19
  (1=4)  (2=3)  (3=2)  (4=1)    INTO  tai19r .
EXECUTE .

COMPUTE TAI_Tot = mean.15(tai1r,tai2,tai3,tai4,tai5,tai6r,tai7r,tai8 ,tai9,tai10r,tai11,tai12,tai13r,tai14,tai15,tai16r,tai17,tai18,tai19r,tai20) * 20.
EXECUTE .
