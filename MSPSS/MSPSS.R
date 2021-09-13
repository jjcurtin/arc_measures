#Multidimensional Scale of Perceived Social Support (MSPSS) - Susan Schneck 2017_May
#Zimet, Dahlem, Zimet & Farley, 1988
#Three subscales: Family (Fam), Friends (Fri), Significant Others (SO)
# Added dS and dI to match new scoring conventions- Megan F 2018_March

#Family
dS$MSPSS_Fam = varScore(dI, Forward= c('MSPSS_3', 'MSPSS_4', 'MSPSS_8', 'MSPSS_11'), Range = c(1,7) )


#Friends
dS$MSPSS_Fri = varScore(dI, Forward= c('MSPSS_6', 'MSPSS_7', 'MSPSS_9', 'MSPSS_12'), Range = c(1,7) )


#Significant Others
dS$MSPSS_SO = varScore(dI, Forward= c('MSPSS_1', 'MSPSS_2', 'MSPSS_5', 'MSPSS_10'), Range = c(1,7) )

