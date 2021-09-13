# Added dS and dI to match new scoring conventions- Megan F 2018_March
# DAQ is scored on 7-point likert scale ranging from 1, "Strongly Disagree," to 7, "Strongly Agree."
# No reverse-coded items in DAQ
# Added underscores between scale title and items to match Qualtrics conventions.

dS$DAQ_TOT = varScore(dI, Forward= c('DAQ_1', 'DAQ_2', 'DAQ_3', 'DAQ_4', 'DAQ_5', 'DAQ_6'), Range = c(1,7) )