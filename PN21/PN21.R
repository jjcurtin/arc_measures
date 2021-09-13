#PANAS 21 item
#Ignore PN21_1 (Anxious) in total score. PANAS is really a 20-item scale and we added Anxious to our internal lab scales to get a measure of anxiety.
#Item 1 is Anxious, All other items correspond to the published PANAS-20, but the item number is one higher than the PN20. (e.g., PN21_2 = PN20_1)
# Added dS and dI to match new scoring conventions- Megan F 2018_March
d = varRename(d,'PN21_1','PANAS_Anxious') #Rename Variables
dS$PANAS_POS = varScore(dI, Forward= c('PN21_2', 'PN21_4', 'PN21_6', 'PN21_10', 'PN21_11', 'PN21_13', 'PN21_15', 'PN21_17', 'PN21_18', 'PN21_20'), Range = c(1,5) )
dS$PANAS_NEG = varScore(dI, Forward= c('PN21_3', 'PN21_5', 'PN21_7', 'PN21_8', 'PN21_9', 'PN21_12', 'PN21_14', 'PN21_16', 'PN21_19', 'PN21_21'), Range = c(1,5) )
