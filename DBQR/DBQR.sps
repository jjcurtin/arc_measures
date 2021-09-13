COMPUTE DBQR_PREF=DBQR1.
RECODE DBQR2 (1=.25) (2=.625) (3=1) (4=2) (5=3.5) (6=5.5) (7=7.5) (8=10.5) (9=17.5) (10=21) INTO DBQR_Freq.
RECODE DBQR3 (1=.5) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=8) (9=11) (10=13) INTO DBQR_Quan.
RECODE DBQR4 (1=.25) (2=.375) (3=.75) (4=1) (5=2) (6=3) (7=4) (8=6) (9=9) (10=11) INTO DBQR_RTLG.
COMPUTE DBQR_PVRT=DBQR5.
RECODE DBQR6 (1=.125) (2=.25) (3=.5) (4=.75) (5=1) (6=2) (7=3) (8=4) (9=6) (10=8) INTO DBQR_FrHG.
RECODE DBQR7 (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=8) (9=11) (10=13) INTO DBQR_QnHG.
RECODE DBQR8 (1=.125) (2=.25) (3=.5) (4=.75) (5=1) (6=2) (7=3) (8=4) (9=6) (10=8) INTO DBQR_FrDK.
RECODE DBQR9 (1=0) (2=1) (3=2) (4=3) (5=4) (6=5) (7=6) (8=8) (9=11) (10=13) INTO DBQR_QnDK.
RECODE DBQR10 (1=.5) (2=1) (3=2) (4=3) (5=4) (6=5.5) (7=8) (8=12) (9=16.5) (10=19) INTO DBQR_QnMax.
COMPUTE DBQR_TOLR=DBQR11.
COMPUTE DBQR_DrnksWeek=DBQR_Freq * DBQR_Quan.
EXECUTE.