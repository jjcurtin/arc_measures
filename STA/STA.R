# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: STA is officially scored on a scale from 0 to 3. Range selected as 1 to 4 based on lab convention.
# Score correction as -20 to adjust for scale shift to 1 through 4

dS$STA_SAI = varScore(dI, Forward= c( 'SAI3', 'SAI4',  'SAI6', 'SAI7',  'SAI9',  'SAI12', 'SAI13', 'SAI14', 'SAI17', 'SAI18'), Reverse = c('SAI1', 'SAI2','SAI5','SAI8','SAI10', 'SAI11','SAI15', 'SAI16','SAI19', 'SAI20'), Range = c(1,4) ) - 20
dS$STA_TAI = varScore(dI, Forward= c( 'TAI2',  'TAI4', 'TAI5',  'TAI8', 'TAI9',  'TAI11', 'TAI12', 'TAI15',  'TAI17', 'TAI18',  'TAI20'), Reverse = c('TAI1','TAI3','TAI6', 'TAI7','TAI19','TAI10','TAI16', 'TAI14', 'TAI13'), Range = c(1,4) ) - 20