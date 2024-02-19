#Loading our SAV file on data from the Health Survey for England
library(haven) #needed for loading in SAV files
Health_DataFormative<-read_sav("C:/Users/chris/OneDrive/Documents/Data Science/Numerical Analysis/R Files/Datasets/HealthDataFormative.sav")


reg<-glm(formula = Health_DataFormative$sbp~Health_DataFormative$dbp)
summary(reg)
#regression summary shows the positive correlation is statstically signifciant
#to not just 5% (0.05) but less than 1% with ***

library(ggplot2)
ggplot2::ggplot()
ggplot(Health_DataFormative, aes(x=dbp,y=sbp))+
  geom_point()+
  geom_smooth()

#Graph by ggplot shows smooth positive correlation. 
#As dpb increases, so does sdp