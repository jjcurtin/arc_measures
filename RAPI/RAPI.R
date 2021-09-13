# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: RAPI is officially scored on a scale from 0 to 4. Range selected as 1 to 5 based on lab convention.
# Score correction as -16 and -14 respectively to adjust for scale shift to 1 through 5

dS$RAPI_TOT = varScore(dI, Forward= c('RAPI1', 'RAPI2', 'RAPI3', 'RAPI4',  'RAPI5', 'RAPI6', 'RAPI7', 'RAPI8', 'RAPI9', 'RAPI10', 'RAPI11', 'RAPI12', 'RAPI13', 'RAPI14', 'RAPI15','RAPI16','RAPI17','RAPI18','RAPI19','RAPI20','RAPI21','RAPI22','RAPI23'), Range = c(1,5) ) - 23