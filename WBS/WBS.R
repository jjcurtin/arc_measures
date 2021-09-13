# Added dS and dI to match new scoring conventions- Megan F 2018_March

dS$WBS_AUT = varScore(dI, Forward= c('WBS2', 'WBS3', 'WBS5', 'WBS7', 'WBS9', 'WBS12', 'WBS14'), Reverse= c('WBS1', 'WBS4', 'WBS6', 'WBS8', 'WBS10', 'WBS11', 'WBS13'), Range = c(1,6) )
dS$WBS_ENV = varScore(dI, Forward= c('WBS1', 'WBS4', 'WBS6', 'WBS7', 'WBS9', 'WBS10', 'WBS12', 'WBS14'), Reverse= c('WBS2', 'WBS3', 'WBS5', 'WBS8', 'WBS11', 'WBS13'), Range = c(1,6) )
dS$WBS_PERS = varScore(dI, Forward= c('WBS2', 'WBS3', 'WBS5', 'WBS7', 'WBS8', 'WBS9', 'WBS11', 'WBS12'), Reverse= c('WBS1', 'WBS4', 'WBS6', 'WBS10', 'WBS13', 'WBS14'),  Range = c(1,6) )
dS$WBS_POS = varScore(dI, Forward= c('WBS1', 'WBS4', 'WBS5', 'WBS7', 'WBS9', 'WBS12', 'WBS14'), Reverse= c('WBS2', 'WBS3', 'WBS6', 'WBS8', 'WBS10', 'WBS11', 'WBS13'), Range = c(1,6) )
dS$WBS_PUR = varScore(dI, Forward= c('WBS1', 'WBS4', 'WBS8', 'WBS9', 'WBS10', 'WBS12', 'WBS13'), Reverse= c('WBS2', 'WBS3', 'WBS5', 'WBS6', 'WBS7', 'WBS11', 'WBS14'), Range = c(1,6) )
dS$WBS_SELF = varScore(dI, Forward= c('WBS1', 'WBS2', 'WBS5', 'WBS6', 'WBS8', 'WBS12', 'WBS13'), Reverse= c('WBS3', 'WBS4', 'WBS7', 'WBS9', 'WBS10', 'WBS11', 'WBS14'), Range = c(1,6) )