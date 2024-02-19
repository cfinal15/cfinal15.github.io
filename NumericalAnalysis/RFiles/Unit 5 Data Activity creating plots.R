#Unit 5 Data Activity
library(haven) #needed for loading in SAV files
df<-read_sav("C:/Users/chris/OneDrive/Documents/Data Science/Numerical Analysis/R Files/Datasets/CrimeSurvey.sav")
df
library(ggplot2)
ggplot2::ggplot()#Assigning ggplot2 to ggplot()

ggplot(df,aes(y = antisocx)) +
  geom_boxplot(outlier.color="red", fill="yellow")+
  ggtitle("Levels of anti-social behaviour in neighbourhood ‘antisocx")

ggplot(df,aes(x=bcsvictim)) +
  geom_bar(fill="orange")+
  ggtitle("Number of victims to suffer crime in past 12 months (0=no,1=yes)")
