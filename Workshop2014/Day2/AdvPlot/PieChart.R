# Pie Chart with Percentage 


Temp <- c(10, 12, 4, 16, 8, 11) 
Statelabels <- c("NE", "IA", "KS", "CO", "SD","ND")
#%calculate percentage 
percentage <- round(Temp/sum(Temp)*100)
# add percents to labels vector 
Statelabels <- paste(Statelabels, percentage) 
Statelabels <- paste(Statelabels,"%",sep="") # ad % to labels 
pie(Temp,labels = Statelabels, col=rainbow(length(Statelabels)),
    main="Pie Chart of States")



#3D
library(plotrix)

pie3D(Temp,labels=Statelabels,explode=0.3,
      main="Pie Chart of States ")
