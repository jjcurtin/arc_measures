#Mindful Attention Awareness Scale (MAAS) 
#Brown and Ryan, JPSP, 2003
#Raw data items coded 1-6
#Published manuscript indicates scale scores is average, but just calculated as sum below
#last checked by JTK, 2017-06-01

nItemsMAAS = 15
MAAS_Tot = varScore(d, Forward= c('MAAS_1','MAAS_2','MAAS_3','MAAS_4','MAAS_5','MAAS_6','MAAS_7','MAAS_8','MAAS_9','MAAS_10',
                                  'MAAS_11','MAAS_12','MAAS_13','MAAS_14','MAAS_15'), Range = c(1,6)) / nItemsMAAS