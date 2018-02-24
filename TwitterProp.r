##################################
# FAKE AND CONSPIRACY NEWS ON TWITTER
# PRE-ALPHA VERSION 0.1
#
##############################


#INITIAL TEST TO ENSURE EVERYONE CAN MAKE GITHUB COMMITS.
#I've make a quick Hello World program below. Add your own.

MattHello <- "Hellow world! This is Matt."
print(MattHello)



  
# LOAD LIBRARIES

#We will start by using rrecsys; 
# recommenderlab is another option but some functionality we need is missing.
#Also: recosystem is a wrapper for the libmf C++ matrix factorization program.
#At scale we may need that: 

if(!"rrecsys" %in% rownames(installed.packages())){
  install.packages("rrecsys")
  }
library(rrecsys)

set.seed(8888)   # for replicability. Note: Changing order may alter results.
# setwd()   # set working directory here


#####  LOAD DATA FROM SOCIAL FEED MANAGER ######




#####   DESCRIPTIVE STATISTICS  ######







#### TO BE ADDED LATER: CODE FOR SHINY DASHBOARD 




