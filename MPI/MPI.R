# Added dS and dI to match new scoring conventions- Megan F 2018_March
# Note: MPI is officially scored on a scale from 0 to 4. Range selected as 1 to 5 based on lab convention.
# Score correction as -29 to adjust for scale shift to 1 through 5

dS$MPI_TOT = varScore(dI, Forward= c('MPI1', 'MPI2', 'MPI3', 'MPI4',  'MPI5', 'MPI6', 'MPI7', 'MPI8', 'MPI9', 'MPI10', 'MPI11', 'MPI12', 'MPI13', 'MPI14', 'MPI15', 'MPI16', 'MPI17', 'MPI18', 'MPI19',  'MPI20', 'MPI21', 'MPI22', 'MPI23', 'MPI24', 'MPI25', 'MPI26', 'MPI27', 'MPI28', 'MPI29'), Range = c(1,5) ) - 29