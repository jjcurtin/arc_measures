
RECODE
  attc3
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc3r .
EXECUTE .

RECODE
  attc7
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc7r .
EXECUTE .

RECODE
  attc8
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc8r .
EXECUTE .

RECODE
  attc11
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc11r .
EXECUTE .

RECODE
  attc12
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc12r .
EXECUTE .

RECODE
  attc16
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc16r .
EXECUTE .


COMPUTE att_sub =  mean.9(attc3r,attc7r,attc8r,attc10,attc11r,attc12r,attc13,attc16r,attc17,attc19) * 10.
EXECUTE .

