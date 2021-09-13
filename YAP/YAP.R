#Young Adult Alcohol Problems Screening Test (YAP or YAAPST) - Susan Schneck 2017_Feb
#Edited by Sarah Sant'Ana in 2018_Feb (changed second line to simplify code)
#Hurlbut, S. 1992a
#Raw data coded with low anchor of 1 for all items
#Not scoring past year severity b/c its a crappy scale
#Last checked by JJC on 2017-05-22

#Extract YAP columns b/c need to do multiple recodes
dLife = dI[,paste0('YAP_', 1:27)]
dYear = dLife 

#Recode for lifetime
dLife$YAP_1  = varRecode(dLife$YAP_1, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_2  = varRecode(dLife$YAP_2, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_3  = varRecode(dLife$YAP_3, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_4  = varRecode(dLife$YAP_4, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_5  = varRecode(dLife$YAP_5, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_6  = varRecode(dLife$YAP_6, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_7  = varRecode(dLife$YAP_7, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_8  = varRecode(dLife$YAP_8, 1:10, c(0,1,1,1,1,1,1,1,1,1))
dLife$YAP_9  = varRecode(dLife$YAP_9, 1:5, c(0,1,1,1,1))
dLife$YAP_10  = varRecode(dLife$YAP_10, 1:5, c(0,1,1,1,1))
dLife$YAP_11  = varRecode(dLife$YAP_11, 1:5, c(0,1,1,1,1))
dLife$YAP_12  = varRecode(dLife$YAP_12, 1:5, c(0,1,1,1,1))
dLife$YAP_13  = varRecode(dLife$YAP_13, 1:5, c(0,1,1,1,1))
dLife$YAP_14  = varRecode(dLife$YAP_14, 1:5, c(0,1,1,1,1))
dLife$YAP_15  = varRecode(dLife$YAP_15, 1:5, c(0,1,1,1,1))
dLife$YAP_16  = varRecode(dLife$YAP_16, 1:5, c(0,1,1,1,1))
dLife$YAP_17  = varRecode(dLife$YAP_17, 1:5, c(0,1,1,1,1))
dLife$YAP_18  = varRecode(dLife$YAP_18, 1:5, c(0,1,1,1,1))
dLife$YAP_19  = varRecode(dLife$YAP_19, 1:5, c(0,1,1,1,1))
dLife$YAP_20  = varRecode(dLife$YAP_20, 1:5, c(0,1,1,1,1))
dLife$YAP_21  = varRecode(dLife$YAP_21, 1:3, c(0,1,1))
dLife$YAP_22  = varRecode(dLife$YAP_22, 1:3, c(0,1,1))
dLife$YAP_23  = varRecode(dLife$YAP_23, 1:3, c(0,1,1))
dLife$YAP_24  = varRecode(dLife$YAP_24, 1:3, c(0,1,1))
dLife$YAP_25  = varRecode(dLife$YAP_25, 1:3, c(0,1,1))
dLife$YAP_26  = varRecode(dLife$YAP_26, 1:3, c(0,1,1))
dLife$YAP_27  = varRecode(dLife$YAP_27, 1:3, c(0,1,1))

#Recode for past year 
dYear$YAP_1  = varRecode(dYear$YAP_1, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_2  = varRecode(dYear$YAP_2, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_3  = varRecode(dYear$YAP_3, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_4  = varRecode(dYear$YAP_4, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_5  = varRecode(dYear$YAP_5, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_6  = varRecode(dYear$YAP_6, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_7  = varRecode(dYear$YAP_7, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_8  = varRecode(dYear$YAP_8, 1:10, c(0,0,1,1,1,1,1,1,1,1))
dYear$YAP_9  = varRecode(dYear$YAP_9, 1:5, c(0,0,1,1,1))
dYear$YAP_10  = varRecode(dYear$YAP_10, 1:5, c(0,0,1,1,1))
dYear$YAP_11  = varRecode(dYear$YAP_11, 1:5, c(0,0,1,1,1))
dYear$YAP_12  = varRecode(dYear$YAP_12, 1:5, c(0,0,1,1,1))
dYear$YAP_13  = varRecode(dYear$YAP_13, 1:5, c(0,0,1,1,1))
dYear$YAP_14  = varRecode(dYear$YAP_14, 1:5, c(0,0,1,1,1))
dYear$YAP_15  = varRecode(dYear$YAP_15, 1:5, c(0,0,1,1,1))
dYear$YAP_16  = varRecode(dYear$YAP_16, 1:5, c(0,0,1,1,1))
dYear$YAP_17  = varRecode(dYear$YAP_17, 1:5, c(0,0,1,1,1))
dYear$YAP_18  = varRecode(dYear$YAP_18, 1:5, c(0,0,1,1,1))
dYear$YAP_19  = varRecode(dYear$YAP_19, 1:5, c(0,0,1,1,1))
dYear$YAP_20  = varRecode(dYear$YAP_20, 1:5, c(0,0,1,1,1))
dYear$YAP_21  = varRecode(dYear$YAP_21, 1:3, c(0,0,1))
dYear$YAP_22  = varRecode(dYear$YAP_22, 1:3, c(0,0,1))
dYear$YAP_23  = varRecode(dYear$YAP_23, 1:3, c(0,0,1))
dYear$YAP_24  = varRecode(dYear$YAP_24, 1:3, c(0,0,1))
dYear$YAP_25  = varRecode(dYear$YAP_25, 1:3, c(0,0,1))
dYear$YAP_26  = varRecode(dYear$YAP_26, 1:3, c(0,0,1))
dYear$YAP_27  = varRecode(dYear$YAP_27, 1:3, c(0,0,1))

d$YAP_Life = varScore(dLife, Forward= paste0('YAP_', 1:27), Range = c(0,1))
d$YAP_Year = varScore(dYear, Forward= paste0('YAP_', 1:27), Range = c(0,1))

#remove tmp dataframes
rm(dYAP)
rm(dLife)
rm(dYear)