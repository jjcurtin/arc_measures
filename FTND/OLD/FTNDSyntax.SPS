*FTND
*Created by JMHogle 7/31/07 to match current CIDA tbs coding file

RECODE
  ftnd_1
  (0=3)  (1=2)  (2=1)  (3=0)  INTO  ftnd_1r .
RECODE
  ftnd_2
  (0=1)  (1=0)  INTO  ftnd_2r .
RECODE
  ftnd_3
  (0=1)  (1=0)  INTO  ftnd_3r .
RECODE
  ftnd_5
  (0=1)  (1=0)  INTO  ftnd_5r .
RECODE
  ftnd_6
  (0=1)  (1=0)  INTO  ftnd_6r .
EXECUTE .
COMPUTE ftnd_tot = SUM(ftnd_4,ftnd_1r,ftnd_2r,ftnd_3r,ftnd_5r,ftnd_6r) .
EXECUTE .