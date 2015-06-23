# -----------------------------------------------------------------------------
# Program: Script1.R  
# Author: Baburao Kamble
# Date: 10/27/2014
# Purpose: Advanced Regression (GLM) in R 
# -----------------------------------------------------------------------------


# Randomized Controlled Trial experiment 
counts <- c (18 ,17 ,15 ,20 ,10 ,20 ,25 ,13 ,12)
outcome <- gl (3 ,1 ,9)
treatment <- gl (3 ,3)


print (data.frame ( treatment,outcome, counts ) )


contin.table <-xtabs ( counts ~ treatment + outcome )
mosaicplot ( contin.table , main =" Mosaic Plot ")
dimnames ( contin.table )$ outcome <-c("Out_1","Out_2","Out_3")
dimnames ( contin.table )$ treatment <-c(" Treat _1"," Treat _2"," Treat _3")
dotchart ( contin.table , main ="Dot Chart ")

#Poisson Regression

#Fitting a GLM 
Myglm <- glm(counts ~ outcome + treatment,family = poisson () )
anova(Myglm)
summary(Myglm)
#Analysis of Deviance for Generalized Linear Model Fits
anova(Myglm, test="Chisq")


#Logistic regression 
Insecticidedata<-read.table(file = "Insecticide.txt", header=TRUE, sep = "")
head(Insecticidedata)

attach(Insecticidedata)

survival <-(alive/( alive + dead ) )
MyData <-data.frame ( Insecticidedata , survival )
plot ( survival ~conc , main =" Insecticide ")

MyLogistic <-glm ( cbind ( dead , alive )~conc , family = binomial (link = logit ) , data = MyData )
summary ( MyLogistic)


# Probit 

MyProbit <-glm ( cbind ( dead , alive )~conc , family = binomial (link = probit ) ,data = MyData )
summary(MyProbit)

modcloglog <-glm ( cbind ( dead , alive )~conc , family = binomial ( link = cloglog ) ,data = MyData )
summary(modcloglog)



#Combine Fitted Values by Rows or Columns

MyFitted<-cbind ( fitted ( MyLogistic ) ,fitted ( MyProbit ) ,fitted ( modcloglog ) )

MyLogistic2 <- predict(MyLogistic, type="response")







#Logistic Regression: Categorical Predictors
Categoricaldata<-read.table(file = "Categorical.txt", header=TRUE, sep = "")

dimnames(Categoricaldata)

Myglm = glm(cbind(Admit,Reject) ~ gender * dept, family=binomial(logit), data=Categoricaldata)
options(show.signif.stars=F)         # turn off significance stars (optional)
anova(Myglm, test="Chisq")

#This is a saturated model, meaning we have used up all our degrees of freedom, and there is no residual deviance 
#left over at the end. Saturated models always fit the data perfectly. 

summary(Myglm)
#we are predicting log odds, so to make sense of these coefficients, they need to be "antilogged"
exp(-1.0521)        
#This shows that men were actually at a significant disadvantage when department and the interaction are controlled.