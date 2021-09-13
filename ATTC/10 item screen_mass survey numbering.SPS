
RECODE
  attc1
  (0=3)  (1=2)  (2=1)  (3=0) INTO  attc1r .
EXECUTE .

RECODE
  attc2 
 (0=3)  (1=2)  (2=1)  (3=0) INTO  attc2r .
EXECUTE .

RECODE
  attc3
  (0=3)  (1=2)  (2=1)  (3=0) INTO  attc3r .
EXECUTE .

RECODE
  attc5
  (0=3)  (1=2)  (2=1)  (3=0) INTO  attc5r .
EXECUTE .

RECODE
  attc6
  (0=3)  (1=2)  (2=1)  (3=0) INTO  attc6r .
EXECUTE .

RECODE
  attc8
  (0=3)  (1=2)  (2=1)  (3=0) INTO  attc8r .
EXECUTE .

COMPUTE att_tot  =  mean.9(attc1r,attc2r,attc3r,attc4,attc5r,attc6r,attc7,attc8r,attc9,attc10) * 10.
EXECUTE .

