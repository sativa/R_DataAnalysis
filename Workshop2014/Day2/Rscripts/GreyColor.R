# -----------------------------------------------------------------------------
# Program: GreyColor.R  
# Author: Baburao Kamble
# Date: 01/22/2015
# Purpose:Use grey color Scheme in ggplot  
# -----------------------------------------------------------------------------


#Demo1

#Define simple chart 

q1<- qplot(mpg, wt, data = mtcars) 
q1

# Add black and white color scheme 
q1+theme_bw()


#Demo2

q2<-ggplot(diamonds, aes(x=cut, y=price, group=cut))+
  geom_boxplot(aes(fill=cut))+scale_fill_brewer(palette="OrRd")

q2 
# Add grey color scheme 

q2+scale_fill_grey()
