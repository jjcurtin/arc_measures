#McMaster Family Assessment Device (FAD) - Susan Schneck 2017_May
#Epstein et al., THE McMASTER FAMILY ASSESSMENT DEVICE, Journal of Marital and Family Therapy 1983, Vol. 9, No. 2,171-180
#Six subscales: Problem Solving (Prob), Communication (Comm), Roles (Role), Affective Responsiveness (Resp), Affective Involvement (Inv), Behavior Control (Beh), General Functioning (Gen)
#Added dS and dI to match new scoring conventions- Megan F 2018_March

#Problem Solving (Prob)                                                                                                        
dS$FAD_Prob = varScore(dI, Forward= c('FAD_2', 'FAD_12', 'FAD_24', 'FAD_38', 'FAD_50', 'FAD_60'), Range = c(1,4) )

#Communication (Comm)
dS$FAD_Comm = varScore(dI, Forward= c('FAD_3', 'FAD_18', 'FAD_29', 'FAD_43', 'FAD_59'), Reverse= c('FAD_14', 'FAD_22', 'FAD_35', 'FAD_52'), Range = c(1,4) )

#Roles (Role)
dS$FAD_Role = varScore(dI, Forward= c('FAD_10', 'FAD_30', 'FAD_40'), Reverse= c('FAD_4', 'FAD_8', 'FAD_15', 'FAD_23', 'FAD_34', 'FAD_45', 'FAD_53', 'FAD_58'), Range = c(1,4) )

#Affective Responsiveness (Resp)
dS$FAD_Resp = varScore(dI, Forward= c('FAD_49', 'FAD_57'), Reverse= c('FAD_9', 'FAD_19', 'FAD_28', 'FAD_39'), Range = c(1,4) )

#Affective Involvement (Inv)
dS$FAD_Inv = varScore(dI, Forward= c(), Reverse= c('FAD_5', 'FAD_13', 'FAD_25', 'FAD_33', 'FAD_37', 'FAD_42', 'FAD_54'), Range = c(1,4) )

#Behavior Control (Beh)
dS$FAD_Beh = varScore(dI, Forward= c('FAD_20', 'FAD_32', 'FAD_55'), Reverse= c('FAD_7', 'FAD_17', 'FAD_27', 'FAD_44', 'FAD_47', 'FAD_48'), Range = c(1,4) )

#General Functioning (Gen)
dS$FAD_Gen = varScore(dI, Forward= c('FAD_6', 'FAD_16', 'FAD_26', 'FAD_36', 'FAD_46', 'FAD_56'), Reverse= c('FAD_1', 'FAD_11', 'FAD_21', 'FAD_31', 'FAD_41', 'FAD_51'), Range = c(1,4) )




                                                                                                        

                                                                                                        
                                                                                                                                                                         
                                                                                                                                                                                                                                                     