#Using Sunburst Plots in R Studio 
library(plotly)


fig <- plot_ly(
  labels = c("Eve", "Cain", "Seth", "Enos", "Noam", "Abel", "Awan", "Enoch", "Azura"),
  parents = c("", "Eve", "Eve", "Seth", "Seth", "Eve", "Eve", "Awan", "Eve"),
  values = c(10, 14, 12, 10, 2, 6, 6, 4, 4),
  type = 'sunburst'
)

fig

#Code above displays the users in hierachical menthod, in this case it's parents 
#making the hierachy. E.g. Seth is parent to Enos and Noam. Enos Value 10 while 
#Noam value is 2. 



