#Types of libraries I've installed and will be using

library(tidyverse)
library(dplyr)
ggplot2::ggplot()#Assigning ggplot2 to ggplot()
library(psych)

#Loading in CSV File
MMD<- read_csv("C:\\Users\\chris\\OneDrive\\Documents\\Data Science\\Data Visualisation\\Assignments\\Datasets\\MMA marketing_data_sample.csv")

#index feature is nice to have but not needed so commented out
#MMD$index<-1:nrow(MMD)

#Our First pass of our summary commands to show state of current data
describe(MMD) #psych package function
summary(MMD)
str(MMD)
glimpse(MMD)

#Transforming our Data with Mutate Function
MMD <- MMD%>% 
  mutate(pdays=ifelse(pdays==999,NA,pdays),
         age=ifelse(age>65,NA,age),
         y_numeric=ifelse(y=="no",0,1),
         marital=ifelse(marital=='unknown',NA,marital),
         default=ifelse(default=='unknown',NA,default),
         housing=ifelse(housing=='unknown',NA,housing),
         loan=ifelse(loan=='unknown',NA,loan),
         duration=ifelse(duration<30,NA,ifelse(duration>600,NA,duration)))

#Changing Columns from Character to Factor
MMD$job<-as.factor(MMD$job)
MMD$marital<-as.factor(MMD$marital)
MMD$k<-as.factor(MMD$k)
MMD$default<-as.factor(MMD$default)
MMD$housing<-as.factor(MMD$housing)
MMD$loan<-as.factor(MMD$loan)
MMD$contact<-as.factor(MMD$contact)
MMD$month<-as.factor(MMD$month)
MMD$month<-ordered(MMD$month,levels=c("apr","may","jun","jul","aug","sep",
                                      "oct","nov","dec"))
MMD$day_of_week<-as.factor(MMD$day_of_week)
MMD$day_of_week<-ordered(MMD$day_of_week,levels=c("mon","tue","wed",
                                                  "thu","fri"))
MMD$poutcome<-as.factor(MMD$poutcome)
MMD$pdays<-as.numeric(MMD$pdays)
MMD$y<-as.factor(MMD$y)

#Using summary now,can see the count on string values as it's been transformed
#to factor as shown above
summary(MMD)

#Bar chart showing the distribution of Pdays and Age Skewness
#Would need to do the mutations before and after to show the difference
#along with the change in variable types (e.g. string to factor)

ggplot(data = MMD) + #skewness caused before the removal of 999 values
  geom_histogram(mapping = aes(x = pdays,fill="red")) 

ggplot(data = MMD) +
  geom_bar(mapping = aes(x = age)) #skewness after age>65

ggplot(data = MMD) + 
  #wide distribution for calls after 600seconds.Want to compare range 30-600
  geom_bar(mapping = aes(x = duration)) 

ggplot(data = MMD) + #Day of the week and success
  geom_bar(mapping = aes(x = previous, fill="red"))

#Mix of visuals to explain the data set

ggplot(data = MMD) + #Day of the week and success
  geom_bar(mapping = aes(x = day_of_week, fill=y))

ggplot(data = MMD) + #Day of the week and success
  geom_bar(mapping = aes(x = month))+
  facet_wrap(~ contact, nrow=1)

#Min and max plot, histogram for poutcome,duration. Added y as mean
ggplot(data = MMD )+ 
  stat_summary(
    mapping = aes(x=poutcome,y=duration),
    fun.ymin = min,
    fun.ymax = max,
    fun.y=mean
  )

#Outcome of deposit success by education
ggplot(data = MMD) + 
  geom_bar(mapping = aes(y = k, fill=y)) +
  labs(y="Education")

ggplot(data=MMD) + 
  geom_point(mapping=aes(x=age,y=pdays, color=poutcome),
             position = "jitter")


#Finding the correlation between variables in our data set
#Will only be using numeric columns, new variable setup MMD_Numeric

MMD_numeric = MMD[,c("y_numeric","age","campaign","duration","pdays",
                     "nr.employed","euribor3m","cons.conf.idx",
                     "cons.price.idx","emp.var.rate")]

correlation<-cor(MMD_numeric,use = 'complete.obs')

head(correlation) #showing general correlation summary

library(reshape2) #Library used for converting wide to long
melted_correlation <- melt(correlation,na.rm=TRUE)

#GGplot for correlation matrix, as shown in Figure 12
ggplot(melted_correlation,aes(x=Var1,y=Var2,fill=value))+
  geom_tile()+
  scale_x_discrete(guide = guide_axis(n.dodge=2))


#binomial regression to show relationships

ggplot(MMD,aes(x=cons.conf.idx, y=y_numeric))+
  geom_point()+
  stat_smooth(method="glm",se=FALSE,method.args = list(family=binomial))

