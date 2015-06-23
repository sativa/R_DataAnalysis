# -----------------------------------------------------------------------------
# Program: DemoX
# Author: Baburao Kamble
# Date: 11/10/2014
# Purpose:Check and Install Packages in R 
# -----------------------------------------------------------------------------



libs=c("TSA", "ggplot2", "RColorBrewer","zoo", "ggthemes","xts","forecast" )
type=getOption("pkgType")                           
CheckandInstallPackage <- function(packages, repos="http://cran.r-project.org",
                                depend=c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances"), ...) {
  installed=as.data.frame(installed.packages())
  for(p in packages) {
    if(is.na(charmatch(p, installed[,1]))) { 
      install.packages(p, repos=repos, dependencies=depend, ...) 
    }
  }
} 
CheckandInstallPackage(packages=libs)
