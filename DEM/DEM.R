#Demographics form (DEM) - Susan Schneck 2017_May
#DiClemente CC; Carbonari JP; Montgomery RPG; Hughes SO. The Alcohol Abstinence Self-Efficacy Scale. Journal of Studies on Alcohol 1994;55:141-148.


#Recode items

#DEM_Age = d$DEM_1 in years

DEM_Gender = varRecode(d$DEM_2, c(1,2), c('Female', 'Male'))

DEM_Race = varRecode(d$DEM_3, 1:6, c('American Indian', 'Asian', 'Pacific Islander', 'Black', 'White', 'Other'))

#DEM_3.1 If Other/Multiracial, please specify


DEM_Hispanic = varRecode(d$DEM_4, 1:5, c('No', 'Mexican', 'Puerto Rican', 'Cuban', 'Other Hispanic'))


#DEM_4.1 If another Hispanic, Latino, or Spanish origin, please specify

DEM_Education = varRecode(d$DEM_5, 1:6, c('Less than high school or GED degree', 'High school or GED', 
                                                        'Some college', '2-Year degree', 'College degree', 'Advanced degree'))
DEM_Employment = varRecode(d$DEM_6, 1:8, c('Employed', 'Temporarily laid off, sick leave, or family leave', 
                                          'Unemployed', 'Retired', 'Disabled', 'Homemaker', 'Full-time student', 'Other, not otherwise specified'))

DEM_EmployedStatus = varRecode(d$DEM_6.1, 1:2, c('Part-time', 'Full-time'))


DEM_Income = varRecode(d$DEM_7, 1:7, c('<20K', '20K-34K', '35K-49K', '50K-74K', '75K-99K', '>100K', 'Pref_No_Ans'))
#DEM_Income = d$DEM_7 integer gross

DEM_MaritalStatus = varRecode(d$DEM_8, 1:5, c('Married', 'Widowed', 'Divorced', 'Separated', 'Never Married'))




DEM_Handedness = varRecode(d$DEM_Handedness, c(1,2,3,4), c('Strongly Right', 'Moderately Right', 'Moderately Left', 'Strongly Left'))


DEM_LivingParents = varRecode(d$DEM2_1, 1:2, c('No', 'Yes'))

#DEM2_2 How many living parents do you have?

DEM_DeceasedParents = varRecode(d$DEM2_3, 1:2, c('No', 'Yes'))

#DEM2_4  How many living parents do you have?


DEM_LivingChildren = varRecode(d$DEM2_5, 1:2, c('No', 'Yes'))

#DEM2_6 How many living children do you have?

DEM_DeceasedChildren = varRecode(d$DEM2_5, 1:2, c('No', 'Yes'))

#DEM2_8 How many deceased children do you have? 

