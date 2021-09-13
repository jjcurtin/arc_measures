

RECODE
  DBQ2
  (1=.25)  (2=.625)  (3=1)  (4=2)  (5=3.5)  (6=5.5)  (7=7.5)  (8=10.5)
  (9=17)  (10=21)  (SYSMIS=SYSMIS)  INTO  DBQ_freq .
VARIABLE LABELS dbq_freq 'drinking frequency (drnks/week rDBQ2)'.
EXECUTE .

RECODE
  DBQ3
  (1=.5)  (2=1)  (3=2)  (4=3)  (5=4)  (6=5)  (7=6)  (8=8)  (9=11)  (10=13)
  (SYSMIS=SYSMIS)  INTO  DBQ_quan .
VARIABLE LABELS dbq_quan 'drinking quantity(drnks/session rDBQ3)'.
EXECUTE .

RECODE
  DBQ4
  (1=.25)  (2=.375)  (3=.75)  (4=1)  (5=2)  (6=3)  (7=4)  (8=6)  (9=9)
  (10=11)  (SYSMIS=SYSMIS)  INTO  DBQ_rtlg .
VARIABLE LABELS dbq_rtlg 'how long drinking at current rate (rDBQ4)'.
EXECUTE .

RECODE
  DBQ5
  (ELSE=Copy)  INTO  DBQ_pvrt .
VARIABLE LABELS DBQ_PVRT 'Previous level of drinking relative to  now'+
 ' (cDBQ5)'.

EXECUTE .
RECODE
  DBQ6
  (1=.125)  (2=.25)  (3=.5)  (4=.75)  (5=1)  (6=2)  (7=3)  (8=4)  (9=8)
  (10=8)  (SYSMIS=SYSMIS)  INTO  DBQ_frhg .
VARIABLE LABELS dbq_frhg 'frequency drinking to high (per week rDBQ6)'.
EXECUTE .

RECODE
  DBQ7
  (1=SYSMIS)  (2=1)  (3=2)  (4=3)  (5=4)  (6=5)  (7=6)  (8=8)  (9=11)  (10=13)
  (SYSMIS=SYSMIS)  INTO  DBQ_qnhg .
VARIABLE LABELS dbq_qnhg 'how many drinks to get high (rDBQ7)'.
EXECUTE .

RECODE
  DBQ8
  (1=.125)  (2=.25)  (3=.5)  (4=.75)  (5=1)  (6=2)  (7=3)  (8=4)  (9=6)
  (10=8)  (SYSMIS=SYSMIS)  INTO  DBQ_frdk .
VARIABLE LABELS dbq_frdk 'how frequent drink till drunk (per week rDBQ8)'.
EXECUTE .

RECODE
  DBQ9
  (1=SYSMIS)  (2=1)  (3=2)  (4=3)  (5=4)  (6=5)  (7=6)  (8=8)  (9=11)
  (10=13)  (SYSMIS=SYSMIS)  INTO  DBQ_qndk .
VARIABLE LABELS dbq_qndk 'how many drink to get drunk (rDBQ9)'.
EXECUTE .

RECODE
  DBQ10
  (ELSE=Copy)  INTO  DBQ_tolr .
VARIABLE LABELS dbq_TOlr 'relative tolerance (cDBQ10)'.
EXECUTE .
