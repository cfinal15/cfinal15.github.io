library(haven)
library(psych)
library(dplyr)
library(readr)
library(tidyverse)
library(ggplot2)

#Loading our SAV file on data from the Health Survey for England
library(haven) #needed for loading in SAV files
Health_DataFormative<-read_sav("C:/Users/chris/OneDrive/Documents/Data Science/Numerical Analysis/R Files/Datasets/HealthDataFormative.sav")

library(psych)
describe(Health_DataFormative$age)
#mean is 26.51, median is 27

library(dplyr) #Mode is 26 with highest count of 16 
Health_DataFormative %>%
  group_by(age)%>%
  summarise(Count = n()) %>%
  arrange(desc(Count),.by_group = TRUE)

median(Health_DataFormative$dbp[Health_DataFormative$diabetes==1])
#diastolic blood pressure for diabetic people is 83
median(Health_DataFormative$dbp[Health_DataFormative$diabetes==2])
#diastolic blood pressure for normal people is 82
Health_DataFormative$diabetes

Health_DataFormative$sbp #continuous variable
Health_DataFormative$occupation #1=Gov Job, 2=Priv Job, 3=Business, 4=Other

library(ggplot2)
ggplot2::ggplot()
ggplot(Health_DataFormative, aes(x=occupation,y=sbp))+
  geom_col()
#Gov Job has highest tally for systolic blood pressure, Gov Jobs more stressful?

