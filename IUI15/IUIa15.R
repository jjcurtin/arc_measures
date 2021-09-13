# IUI-a15
# From Carleton et al, 2010, Psychological Assessment
# Part A only of IUI - 15 items.
# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$IUIa_TOT = varScore(dI, Forward= c('IUIa1', 'IUIa2', 'IUIa3', 'IUIa4', 'IUIa5', 'IUIa6','IUIa7', 'IUIa8', 'IUIa9','IUIa10', 
                                  'IUIa11', 'IUIa12', 'IUIa13', 'IUIa14','IUIa15'), Range= c(1,5))


#With underscores in variable names
dS$IUIa_TOT = varScore(dI, Forward= c('IUIa_1', 'IUIa_2', 'IUIa_3', 'IUIa_4', 'IUIa_5', 'IUIa_6','IUIa_7', 'IUIa_8', 'IUIa_9','IUIa_10', 
                                    'IUIa_11', 'IUIa_12', 'IUIa_13', 'IUIa_14','IUIa_15'), Range= c(1,5))
