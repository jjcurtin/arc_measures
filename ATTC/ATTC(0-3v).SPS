RECODE
  attc1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc1r .
EXECUTE .

RECODE
  attc2
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc2r .
EXECUTE .

RECODE
  attc3
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc3r .
EXECUTE .

RECODE
  attc6
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc6r .
EXECUTE .

RECODE
  attc7
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc7r .
EXECUTE .

RECODE
  attc8
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc8r .
EXECUTE .

RECODE
  attc11
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc11r .
EXECUTE .

RECODE
  attc12
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc12r .
EXECUTE .

RECODE
  attc15
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc15r .
EXECUTE .

RECODE
  attc16
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc16r .
EXECUTE .

RECODE
  attc20
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  attc20r .
EXECUTE .

COMPUTE attc_foc = mean.7(attc1r,attc2r,attc3r,attc4,attc5,attc6r,attc7r,attc8r,attc9) * 9 + 9.
EXECUTE .

COMPUTE attc_shf = mean.8(attc10,attc11r,attc12r,attc13,attc14, attc15r,attc16r,attc17,attc18,attc19,attc20r) * 11 + 11.
EXECUTE .

COMPUTE attc_tot =  mean.17(attc1r,attc2r,attc3r,attc4,attc5,attc6r,attc7r,attc8r,attc9,attc10,attc11r,attc12r,attc13,attc14, attc15r,attc16r,attc17,attc18,attc19,attc20r) * 20 + 20.
EXECUTE .
