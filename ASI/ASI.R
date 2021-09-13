# ASI (original) Sarah Sant'Ana 2018_Feb
# 16 items
# Reiss, S., Peterson, R. A., Gursky, D. M., & McNally, R. J. (1986).
# Individual's Anxiety Sensitivity score is sum of the 16 items
# Note: ASI 3 has subscales, there are no subscales in this version
# Note: ASI is officially scored on a scale from 0 to 4. Range selected as 1 to 5 based on lab convention.
# Score correction as -16 to adjust for scale shift to 1 through 5
#Added Cronbach's alpha calculations - Megan F. 05/2018

dS$ASI_Tot= varScore(dI, Forward = c('ASI_1', 'ASI_2', 'ASI_3', 'ASI_4', 'ASI_5', 'ASI_6', 'ASI_7', 'ASI_8', 'ASI_9', 'ASI_10',
                       'ASI_11', 'ASI_12', 'ASI_13', 'ASI_14', 'ASI_15', 'ASI_16'), Range = c(1,5))-16

# Calculate Alphas --------------------------------------------------------

dASI = dI[,c('ASI_1', 'ASI_2', 'ASI_3', 'ASI_4', 'ASI_5', 'ASI_6', 'ASI_7', 'ASI_8', 'ASI_9', 'ASI_10',
             'ASI_11', 'ASI_12', 'ASI_13', 'ASI_14', 'ASI_15', 'ASI_16')] #ASI Total
aASI = alpha(dASI, keys=NULL)
aASI$total #output stats