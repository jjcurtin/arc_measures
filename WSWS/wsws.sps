COMPUTE WSWS1r = 4 - WSWS1.
COMPUTE WSWS2r = 4 - WSWS2.
COMPUTE WSWS4r = 4 - WSWS4.
COMPUTE WS7WSr = 4 - WSWS7.
COMPUTE WSWS10r = 4 - WSWS10.
COMPUTE WSWS17r = 4 - WSWS17.
COMPUTE WSWS22r = 4 - WSWS22.
COMPUTE WSWS24r = 4 - WSWS24.

COMPUTE wsws_anger =  mean.3(wsws13, wsws15, wsws18).  
COMPUTE wsws_anx =  mean.3(wsws3, wsws6, wsws8, wsws10r).  
COMPUTE wsws_conc =  mean.3(wsws4r, wsws23, wsws27).  
COMPUTE wsws_crave =  mean.3(wsws9, wsws11, wsws20, wsws26).  
COMPUTE wsws_hunger =  mean.4(wsws1r, wsws14, wsws16, wsws21, wsws28).  
COMPUTE wsws_sad =  mean.3(wsws7r, wsws12, wsws19, wsws24r).  
COMPUTE wsws_sleep = mean.3(wsws2r, wsws5, wsws17r, wsws22r,wsws25).
COMPUTE wsws_tot = mean.3(wsws1r, wsws2r, wsws3, wsws4r, wsws5, wsws6, wsws7r, wsws8, wsws9, wsws10r, wsws11, wsws12, wsws13, wsws14, wsws15, wsws16, wsws17r, wsws18, wsws19, wsws20, wsws21, wsws22r, wsws23, wsws24r, wsws25, wsws26, wsws27, wsws28).
EXECUTE.  

DELETE VARIABLES wsws1 to wsws28.
DELETE VARIABLES wsws1r to wsws24r
EXECUTE.