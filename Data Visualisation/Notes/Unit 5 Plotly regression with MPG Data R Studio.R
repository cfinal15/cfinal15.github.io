library(plotly)
library(ggplot2)

#displ means the engine displacement, in litres e.g. 1 litre, 2 litre etc
#hwy means highway miles effieiceny in MPG 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(method="lm")

#Overall trend is negative, the bigger the engine the less efficient it is
#Regression shows that a 4.5 litre engine will tpyically get 20 MPG