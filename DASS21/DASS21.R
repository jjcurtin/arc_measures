#Depression Anxiety Stress Scale( DASS-21)
#Lovibond, S.H. & Lovibond, P.F. (1995). Manual for the Depression Anxiety Stress Scales. (2nd. Ed.) Sydney: Psychology Foundation.
#This Questionnaire is a short version (21 item) of a 42-item self report instrument designed to measure three related negative emotional states: depression, anxiety and tension/stress.
#Multiply by 2 to scale to 42 item normed version.
#Raw data items coded 1-4 but rescored to normed 0-3 range
#Last checked by JJC on 2017-05-22
# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$DASS21_ANX = (varScore(dI, Forward= c('DASS21_2', 'DASS21_4', 'DASS21_7', 'DASS21_9', 'DASS21_15', 'DASS21_19', 'DASS21_20'), Range = c(1,4) ) - 7) * 2
dS$DASS21_DEP = (varScore(dI, Forward= c('DASS21_3', 'DASS21_5', 'DASS21_10', 'DASS21_13', 'DASS21_16', 'DASS21_17', 'DASS21_21'), Range = c(1,4) ) - 7) * 2
dS$DASS21_STR = (varScore(dI, Forward= c('DASS21_1', 'DASS21_6', 'DASS21_8', 'DASS21_11', 'DASS21_12', 'DASS21_14', 'DASS21_18'), Range = c(1,4) ) - 7) *2
dS$DASS21_TOT = (varScore(dI, Forward= paste0('DASS21_', 1:21), Range = c(1,4) ) - 21) * 2