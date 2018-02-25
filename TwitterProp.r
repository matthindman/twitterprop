##################################
# FAKE AND CONSPIRACY NEWS ON TWITTER
# PRE-ALPHA VERSION 0.1
#
##############################


#INITIAL TEST TO ENSURE EVERYONE CAN MAKE GITHUB COMMITS.
#I've make a quick Hello World program below. Add your own.

MattHello <- "Hellow world! This is Matt."
print(MattHello)


# setwd()   # set working directory here if needed
  
# LOAD LIBRARIES

# Initial installation -- these lines only need to be run once.
# Add additional libraries needed to this list.  

list.of.packages <- c("tidyverse", "rrecsys","shiny","shinydashboard",
                      "network","igraph","tidygraph")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)



# RECOMMENDER SYSTEM LIBRARIES
# We will start by using the rrecsys library. 
# recommenderlab is another option but some functionality we need is missing.
# Also: recosystem is a wrapper for the libmf matrix factorization program.
# It's written in C++. Very powerful and fast at scale if needed. 

library(rrecsys)

library(tidyverse) # lots of 
library(shiny,shinydashboard) # for our dashboard

# NETWORK ANALYSIS LIBRARIES -- possible conflict here.  
# We will start with the "igraph" package, and look at the network, tidygraph, 
# sna, etc. packages later
library(igraph)
#library(intergraph) # add if you need to switch between the formats of different  
                     # graph packages.


# SET SEED FOR REPLICABILITY
set.seed(8888)   # Note: Changing order may alter results.





#####  LOAD DATA FROM SOCIAL FEED MANAGER ######






#####   DESCRIPTIVE STATISTICS  ######







#### CODE FOR SHINY DASHBOARD 




