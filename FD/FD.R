# Fear of Darkness scale is an in-house measure
# The scale is rated on a scale from 0 to 4, but is recoded to 1 to 5 to match lab conventions.
# Score corrections are added at the end to adjust for scale shift.
# Meaning of scale ratings vary based on subscale
# None of the items are reverse-coded.

dS$FD_ = varScore(dI, Reverse= c('ICU15', 'ICU23', 'ICU16', 'ICU3', 'ICU17', 'ICU24','ICU13', 'ICU5'), Range = c(1,4) ) - 8
dS$ICU_UNE = varScore(dI, Reverse= c('ICU1', 'ICU19', 'ICU6', 'ICU22', 'ICU14'), Range = c(1,4) ) - 5