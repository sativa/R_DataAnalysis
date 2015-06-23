####Chapter 2: Data Types and Data Structure 



##########Data Types##########
# integer 
SouthAmericaCountries<- as.integer(12)
is.integer(SouthAmericaCountries) 

#double 
x<-145.335
typeof(x) 
y<-6.67
typeof(y) 

#complex 
x <- 1
y <- 1
z <- complex(real = x, imaginary = y)
z
as.complex(-1)

#logical 

x<-100
y<-x> 10
y
z<- (30>x) & (x <= 100)
z

#Character 
x<-c("UNL")
x
y<- c("U","N","L") 
y

#factor 
Wildlife<-c("lion","leopard","tiger","leopard","leopard","tiger","lion","leopard")
Wildlife
FactorWildlife<-factor(Wildlife)
FactorWildlife
#You can change these levels 
MyWLdataNumbers<- factor(Wildlife,labels=c(1,2,3))
MyWLdataNumbers

# Dates and Times 
Adate <- c("01-01-1990", "28-08-1999")
Adate

Bdate <- as.Date(Adate, "%d-%m-%Y")
Bdate
data.class(Bdate)
diffBdate = Bdate[2] - Bdate[1]
diffBdate

#You can add a number to a date object
Bdate+123

#Time and Time zone 
TimeData1<-as.POSIXct("2010-01-20 15:34:55")
TimeData1
#Change Timezone  to GMT 
TimeData1<-as.POSIXct("2010-01-20 15:34:55", tz="Europe/London")
TimeData1
weekdays(TimeData1)



# Missing data 

x<-c(1,2,3,4,5,NA)
is.na(x)
mean(x)
mean(x, na.rm=TRUE)

# recoding missing data 
y<-c(1,2,3,4,5,8,9,10,11,-9999)
y[y==-9999] <- NA
y 

# Infinite values are represented by Inf or ???Inf. 
x<-(10^(290:320)) 
is.finite(x)
is.infinite(x)

##########Data Structure ##########

#vector 
a <- c(1,2,-2,4,4,5,6,7) # int data 
b <- c("Lion","Goat","Cow") #char data 
c <- c(TRUE, FALSE, TRUE, FALSE) # logical data 


#Matrix 

MyMatrix=matrix(data=c(9,2,3,2,3,4),ncol=3) 
MyMatrix
mean (MyMatrix)

#array 
dim1<- c("A1","A2")
dim2<- c("B1","B2","B3")
dim3<- c("C1","C2","C3","C4")

z<-array(1:24,c(2,3,4), dimnames=list(dim1, dim2, dim3))
z

#data frame 

ObservationID<-c(1, 2, 3, 4)
Tmin<-c(25, 34, 28, 52)
WindType<-c("Type1", "Type2", "Type1", "Type1")
CropHealthStatus<-c("Poor", "Improved", "Excellent", "Poor")
CropWeatherdata <- data.frame(ObservationID, Tmin, WindType, CropHealthStatus)
CropWeatherdata
CropWeatherdata[2:3]    

#List 

g<-("My First List")
h<-c(25,26,18,39)
j<-matrix(1:10, nrow=5)
k<-c("one", "two", "three")
mylist<-list(title=g, ages=h, j, k)
mylist

