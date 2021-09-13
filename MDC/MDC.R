# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: MDC is officially scored on a scale from 0 to 1. Range selected as 1 to 2 based on lab convention.
# Score correction as -10 to adjust for scale shift to 1 through 2

dS$MDC_TOT = varScore(dI, Forward= c('MDC1', 'MDC2', 'MDC3', 'MDC4',  'MDC5', 'MDC6', 'MDC7', 'MDC8', 'MDC9', 'MDC10'), Range = c(1,2) ) - 10