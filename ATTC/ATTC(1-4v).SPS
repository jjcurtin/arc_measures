RECODE
  attc1
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc1r .
EXECUTE .

RECODE
  attc2
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc2r .
EXECUTE .

RECODE
  attc3
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc3r .
EXECUTE .

RECODE
  attc6
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc6r .
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
  attc15
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc15r .
EXECUTE .

RECODE
  attc16
  (1=4)  (2=3)  (3=2)  (4=1) INTO  attc16r .
EXECUTE .

RECODE
  attc20
  (1=4)  (2=3)  (3=2)  (4=1)  INTO  attc20r .
EXECUTE .

COMPUTE attc_foc = mean.7(attc1r,attc2r,attc3r,attc4,attc5,attc6r,attc7r,attc8r,attc9) * 9.
EXECUTE .

COMPUTE attc_shf = mean.8(attc10,attc11r,attc12r,attc13,attc14, attc15r,attc16r,attc17,attc18,attc19,attc20r) * 11.
EXECUTE .

COMPUTE attc_tot =  mean.17(attc1r,attc2r,attc3r,attc4,attc5,attc6r,attc7r,attc8r,attc9,attc10,attc11r,attc12r,attc13,attc14, attc15r,attc16r,attc17,attc18,attc19,attc20r) * 20.
EXECUTE .
COMPUTE shortfrm = mean.10(attc3r,attc7r,attc8r,attc10,attc11r,attc12r,attc13
 ,attc16r,attc17,attc19) * 10 .
EXECUTE .
