#Unit 3 Data activity
#Creating subset of those aged 75+ and victim of crime to new dataframe

library(haven)

df<-read_sav("C:/Users/chris/OneDrive/Documents/Data Science/Numerical Analysis/R Files/Datasets/CrimeSurvey.sav")
df$agegrp7 #values of 7 are those aged 75+
df$bcsvictim #values of 1 are victim of crime in past 12months

subset(df,agegrp7==7)
subset(df,bcsvictim==1)

df_subset<- subset(df,agegrp7==7 & bcsvictim==1)
#Only 67 from 8843 obs meet criteria, look at data frames in top right
