#No scoring of the WHO-ASSIST needed for research purposes. For clinical scoring see manual on server:
#P:\ID\WHO-ASSIST\assist_v3_english.pdf

#World Health Organization - Alcohol, Smoking and Substance Involvement Screening Test v3.0 (WHO-ASSIST)
dID = varRename(dID, c('ASSIST_1_1','ASSIST_1_2','ASSIST_1_3','ASSIST_1_4','ASSIST_1_5','ASSIST_1_6','ASSIST_1_7','ASSIST_1_8',
                       'ASSIST_2_1','ASSIST_2_2','ASSIST_2_3','ASSIST_2_4','ASSIST_2_5','ASSIST_2_6','ASSIST_2_7','ASSIST_2_8',
                       'ASSIST_3_1','ASSIST_3_2','ASSIST_3_3','ASSIST_3_4','ASSIST_3_5','ASSIST_3_6','ASSIST_3_7','ASSIST_3_8',
                       'ASSIST_4_1','ASSIST_4_2','ASSIST_4_3','ASSIST_4_4','ASSIST_4_5','ASSIST_4_6','ASSIST_4_7','ASSIST_4_8',
                       'ASSIST_5_1','ASSIST_5_2','ASSIST_5_3','ASSIST_5_4','ASSIST_5_5','ASSIST_5_6','ASSIST_5_7','ASSIST_5_8',
                       'ASSIST_6_1','ASSIST_6_2','ASSIST_6_3','ASSIST_6_4','ASSIST_6_5','ASSIST_6_6','ASSIST_6_7','ASSIST_6_8',
                       'ASSIST_7_1','ASSIST_7_2','ASSIST_7_3','ASSIST_7_4','ASSIST_7_5','ASSIST_7_6','ASSIST_7_7','ASSIST_7_8',
                       'ASSIST_8'),
                c('ASSIST_UseEver_Tobacco','ASSIST_UseEver_Cannabis','ASSIST_UseEver_Cocaine','ASSIST_UseEver_Stimulant','ASSIST_UseEver_Inhalant','ASSIST_UseEver_Sedative','ASSIST_UseEver_Hallucinogen','ASSIST_UseEver_Opioid',
                  'ASSIST_UseFreq_Tobacco','ASSIST_UseFreq_Cannabis','ASSIST_UseFreq_Cocaine','ASSIST_UseFreq_Stimulant','ASSIST_UseFreq_Inhalant','ASSIST_UseFreq_Sedative','ASSIST_UseFreq_Hallucinogen','ASSIST_UseFreq_Opioid',
                  'ASSIST_UrgeFreq_Tobacco','ASSIST_UrgeFreq_Cannabis','ASSIST_UrgeFreq_Cocaine','ASSIST_UrgeFreq_Stimulant','ASSIST_UrgeFreq_Inhalant','ASSIST_UrgeFreq_Sedative','ASSIST_UrgeFreq_Hallucinogen','ASSIST_UrgeFreq_Opioid',
                  'ASSIST_ProbsFreq_Tobacco','ASSIST_ProbsFreq_Cannabis','ASSIST_ProbsFreq_Cocaine','ASSIST_ProbsFreq_Stimulant','ASSIST_ProbsFreq_Inhalant','ASSIST_ProbsFreq_Sedative','ASSIST_ProbsFreq_Hallucinogen','ASSIST_ProbsFreq_Opioid',
                  'ASSIST_FailedFreq_Tobacco','ASSIST_FailedFreq_Cannabis','ASSIST_FailedFreq_Cocaine','ASSIST_FailedFreq_Stimulant','ASSIST_FailedFreq_Inhalant','ASSIST_FailedFreq_Sedative','ASSIST_FailedFreq_Hallucinogen','ASSIST_FailedFreq_Opioid',
                  'ASSIST_ConcernFreq_Tobacco','ASSIST_ConcernFreq_Cannabis','ASSIST_ConcernFreq_Cocaine','ASSIST_ConcernFreq_Stimulant','ASSIST_ConcernFreq_Inhalant','ASSIST_ConcernFreq_Sedative','ASSIST_ConcernFreq_Hallucinogen','ASSIST_ConcernFreq_Opioid',
                  'ASSIST_QuitFreq_Tobacco','ASSIST_QuitFreq_Cannabis','ASSIST_QuitFreq_Cocaine','ASSIST_QuitFreq_Stimulant','ASSIST_QuitFreq_Inhalant','ASSIST_QuitFreq_Sedative','ASSIST_QuitFreq_Hallucinogen','ASSIST_QuitFreq_Opioid',
                  'ASSIST_Ever_Injection'))