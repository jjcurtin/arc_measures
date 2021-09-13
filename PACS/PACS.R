#Penn Alcohol Craving Scale (PACS) - Susan Schneck 2017_May
#Flannery, BA. (1999) Psychometric Properties of the Penn Alcohol Craving Scale. Alcoholism: Clincial and Experimental Research. Vol. 23, No. 8.

#Raw items anchored at 1-7.  Recoded to reflect published norms with items scored 0-6, JC
# Added dS and dI to match new scoring conventions- Megan F 2018_March

#Total score
dS$PACS_Tot = varScore(dI, Forward= c('PACS_1', 'PACS_2', 'PACS_3', 'PACS_4', 'PACS_5'), Range = c(1,7) ) - 5
