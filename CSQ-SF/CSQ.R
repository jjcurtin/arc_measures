#Cognitive-Style Questionnaire, Short Form (CSQ-SF) - Susan Schneck 2017_Feb
#Meins, E., McCarthy-Jones, S., Fernyhough, C., Lewis, G., Bentall, R. P., and Alloy, L. B. (2012). Assessing negative cognitive style: Development and validation of a short-form version of the Cognitive Style Questionnaire. Personality and Individual Differences, 52, 581-585. 

#Recode reverse-coded items

dID$CSQ_1_1 = varRecode(dID$CSQ_1_2, 1:5, c(5,4,3,2,1))
dID$CSQ_1_3 = varRecode(dID$CSQ_1_3, 1:5, c(5,4,3,2,1))
dID$CSQ_1_7 = varRecode(dID$CSQ_1_7, 1:5, c(5,4,3,2,1))
dID$CSQ_1_9 = varRecode(dID$CSQ_1_9, 1:5, c(5,4,3,2,1))
dID$CSQ_2_1 = varRecode(dID$CSQ_2_1, 1:5, c(5,4,3,2,1))
dID$CSQ_2_3 = varRecode(dID$CSQ_2_3, 1:5, c(5,4,3,2,1))
dID$CSQ_2_7 = varRecode(dID$CSQ_2_7, 1:5, c(5,4,3,2,1))
dID$CSQ_2_9 = varRecode(dID$CSQ_2_9, 1:5, c(5,4,3,2,1))
dID$CSQ_3_1 = varRecode(dID$CSQ_3_1, 1:5, c(5,4,3,2,1))
dID$CSQ_3_3 = varRecode(dID$CSQ_3_3, 1:5, c(5,4,3,2,1))
dID$CSQ_3_7 = varRecode(dID$CSQ_3_7, 1:5, c(5,4,3,2,1))
dID$CSQ_3_9 = varRecode(dID$CSQ_3_9, 1:5, c(5,4,3,2,1))
dID$CSQ_4_1 = varRecode(dID$CSQ_4_1, 1:5, c(5,4,3,2,1))
dID$CSQ_4_3 = varRecode(dID$CSQ_3_4, 1:5, c(5,4,3,2,1))
dID$CSQ_4_7 = varRecode(dID$CSQ_4_7, 1:5, c(5,4,3,2,1))
dID$CSQ_4_9 = varRecode(dID$CSQ_4_9, 1:5, c(5,4,3,2,1))
dID$CSQ_5_1 = varRecode(dID$CSQ_5_1, 1:5, c(5,4,3,2,1))
dID$CSQ_5_3 = varRecode(dID$CSQ_5_3, 1:5, c(5,4,3,2,1))
dID$CSQ_5_7 = varRecode(dID$CSQ_5_7, 1:5, c(5,4,3,2,1))
dID$CSQ_5_9 = varRecode(dID$CSQ_5_9, 1:5, c(5,4,3,2,1))
dID$CSQ_6_1 = varRecode(dID$CSQ_6_1, 1:5, c(5,4,3,2,1))
dID$CSQ_6_3 = varRecode(dID$CSQ_6_3, 1:5, c(5,4,3,2,1))
dID$CSQ_6_7 = varRecode(dID$CSQ_6_7, 1:5, c(5,4,3,2,1))
dID$CSQ_6_9 = varRecode(dID$CSQ_6_9, 1:5, c(5,4,3,2,1))
dID$CSQ_7_1 = varRecode(dID$CSQ_7_1, 1:5, c(5,4,3,2,1))
dID$CSQ_7_3 = varRecode(dID$CSQ_7_3, 1:5, c(5,4,3,2,1))
dID$CSQ_7_7 = varRecode(dID$CSQ_7_7, 1:5, c(5,4,3,2,1))
dID$CSQ_7_9 = varRecode(dID$CSQ_7_9, 1:5, c(5,4,3,2,1))
dID$CSQ_8_1 = varRecode(dID$CSQ_8_1, 1:5, c(5,4,3,2,1))
dID$CSQ_8_3 = varRecode(dID$CSQ_8_3, 1:5, c(5,4,3,2,1))
dID$CSQ_8_7 = varRecode(dID$CSQ_8_7, 1:5, c(5,4,3,2,1))
dID$CSQ_8_9 = varRecode(dID$CSQ_8_9, 1:5, c(5,4,3,2,1))

#Internality sub-scale
#Scores for items 1 and 6 can be totalled to give the overall score for internality. Possible scores thus range between 16 and 80.
CSQ_IN = varScore(d, Forward= c('CSQ_1_1', 'CSQ_2_1', 'CSQ_3_1', 'CSQ_4_1', 'CSQ_5_1', 'CSQ_6_1', 'CSQ_7_1', 'CSQ_8_1', 'CSQ_1_6', 'CSQ_2_6', 'CSQ_3_6', 'CSQ_4_6', 'CSQ_5_6', 'CSQ_6_6', 'CSQ_7_6', 'CSQ_8_6'), Range = c(1,5) )

#Globality sub-scale
#Scores for items 2 and 7 can be totalled to give the overall score for globality. Possible scores thus range between 16 and 80.
CSQ_GL = varScore(d, Forward= c('CSQ_1_2', 'CSQ_2_2', 'CSQ_3_2', 'CSQ_4_2', 'CSQ_5_2', 'CSQ_6_2', 'CSQ_7_2', 'CSQ_8_2', 'CSQ_1_7', 'CSQ_2_7', 'CSQ_3_7', 'CSQ_4_7', 'CSQ_5_7', 'CSQ_6_7', 'CSQ_7_7', 'CSQ_8_7'), Range = c(1,5) )

#Stability sub-scale
#Scores for items 3 and 8 can be totalled to give the overall score for stability. Possible scores thus range between 16 and 80.
CSQ_ST = varScore(d, Forward= c('CSQ_1_3', 'CSQ_2_3', 'CSQ_3_3', 'CSQ_4_3', 'CSQ_5_3', 'CSQ_6_3', 'CSQ_7_3', 'CSQ_8_3', 'CSQ_1_8', 'CSQ_2_8', 'CSQ_3_8', 'CSQ_4_8', 'CSQ_5_8', 'CSQ_6_8', 'CSQ_7_8', 'CSQ_8_8'), Range = c(1,5) )

#Negative consequences sub-scale
#Scores for item 4 can be totalled to give the overall score for negative consequences. Possible scores thus range between 8 and 40.
CSQ_NC = varScore(d, Forward= c('CSQ_1_4', 'CSQ_2_4', 'CSQ_3_4', 'CSQ_4_4', 'CSQ_5_4', 'CSQ_6_4', 'CSQ_7_4', 'CSQ_8_4'), Range = c(1,5) )

#Self-worth implications sub-scale
#Scores for items 5 and 9 can be totalled to give the overall score for self-worth implications. Possible scores thus range between 16 and 80.
CSQ_SW = varScore(d, Forward= c('CSQ_1_5', 'CSQ_2_5', 'CSQ_3_5', 'CSQ_4_5', 'CSQ_5_5', 'CSQ_6_5', 'CSQ_7_5', 'CSQ_8_5', 'CSQ_1_9', 'CSQ_2_9', 'CSQ_3_9', 'CSQ_4_9', 'CSQ_5_9', 'CSQ_6_9', 'CSQ_7_9', 'CSQ_8_9'), Range = c(1,5) )

#Total Score
CSQ_TOT = varScore(d, Forward= c('CSQ_1_1', 'CSQ_2_1', 'CSQ_3_1', 'CSQ_4_1', 'CSQ_5_1', 'CSQ_6_1', 'CSQ_7_1', 'CSQ_8_1', 'CSQ_1_2', 'CSQ_2_2', 'CSQ_3_2', 'CSQ_4_2', 'CSQ_5_2', 'CSQ_6_2', 'CSQ_7_2', 'CSQ_8_2', 'CSQ_1_3', 'CSQ_2_3', 'CSQ_3_3', 'CSQ_4_3', 'CSQ_5_3', 'CSQ_6_3', 'CSQ_7_3', 'CSQ_8_3', 'CSQ_1_4', 'CSQ_2_4', 'CSQ_3_4', 'CSQ_4_4', 'CSQ_5_4', 'CSQ_6_4', 'CSQ_7_4', 'CSQ_8_4', 'CSQ_1_5', 'CSQ_2_5', 'CSQ_3_5', 'CSQ_4_5', 'CSQ_5_5', 'CSQ_6_5', 'CSQ_7_5', 'CSQ_8_5', 'CSQ_1_6', 'CSQ_2_6', 'CSQ_3_6', 'CSQ_4_6', 'CSQ_5_6', 'CSQ_6_6', 'CSQ_7_6', 'CSQ_8_6', 'CSQ_1_7', 'CSQ_2_7', 'CSQ_3_7', 'CSQ_4_7', 'CSQ_5_7', 'CSQ_6_7', 'CSQ_7_7', 'CSQ_8_7', 'CSQ_1_8', 'CSQ_2_8', 'CSQ_3_8', 'CSQ_4_8', 'CSQ_5_8', 'CSQ_6_8', 'CSQ_7_8', 'CSQ_8_8', 'CSQ_1_9', 'CSQ_2_9', 'CSQ_3_9', 'CSQ_4_9', 'CSQ_5_9', 'CSQ_6_9', 'CSQ_7_9', 'CSQ_8_9'), Range = c(1,5) )


 
