* WSWS
* Created by JMHogle on 7/31/07

RECODE
  ws1
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws1r .
EXECUTE .
RECODE
  ws10
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws10r .
EXECUTE .
RECODE
  ws4
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws4r .
EXECUTE .
RECODE
  ws7
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws7r .
EXECUTE .
RECODE
  ws24
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws24r .
EXECUTE .
RECODE
  ws2
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws2r .
EXECUTE .
RECODE
  ws17
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws17r .
EXECUTE .
RECODE
  ws22
  (0=4)  (1=3)  (3=1)  (4=0)  (ELSE=Copy)  INTO  ws22r .
EXECUTE .
COMPUTE ws_ang = MEAN(ws13,ws15,ws18) .
COMPUTE ws_anx = MEAN(ws3,ws6,ws8,ws10r) .
COMPUTE ws_conc = MEAN(ws4r,ws23,ws27) .
COMPUTE ws_crav = MEAN(ws9,ws11,ws20,ws26) .
COMPUTE ws_hung = MEAN(ws1r,ws14,ws16,ws21,ws28) .
COMPUTE ws_sad = MEAN(ws7r,ws12,ws19,ws24r) .
COMPUTE ws_sle = MEAN(ws2r,ws5,ws17r,ws22r,ws25) .
EXECUTE .
COMPUTE ws_tot = SUM(ws_ang,ws_anx,ws_conc,ws_crav,ws_hung,ws_sad,ws_sle) .
EXECUTE .