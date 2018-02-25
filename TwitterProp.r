##################################
# FAKE AND CONSPIRACY NEWS ON TWITTER
# PRE-ALPHA VERSION 0.1
#
##############################


### NOTE: Some of these functions have calls with the same name.
### This can lead to masking 

#INITIAL TEST TO ENSURE EVERYONE CAN MAKE GITHUB COMMITS.
#I've make a quick Hello World program below. Add your own.

MattHello <- "Hellow world! This is Matt."
print(MattHello)


# setwd()   # set working directory here if needed
  
# LOAD LIBRARIES

# Initial installation -- these lines only need to be run once.
# Add additional libraries that might need to be installed to the list below.  

list.of.packages <- c("tidyverse",                               # basic data sci tools
                      "rrecsys","recosystem", "recommenderlab",  # recsys libs
                      "shiny","shinydashboard",                  # shiny libs
                      "network","igraph","tidygraph", "sna",    # graph / network libs
                      "viznetwork", "networkd3", "ggraph")       #network visualization libs

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)



# RECOMMENDER SYSTEM LIBRARY
# We will start by using the rrecsys library. 
# recommenderlab is another option but some functionality we need is missing.
# Also: recosystem is a wrapper for the libmf matrix factorization program.
# libmf is written in C++. Very powerful and fast at scale if needed. 

library(rrecsys)  # Change if we chose a different recommender library

library(tidyverse) # lots of basic tools
library(shiny,shinydashboard) # for our dashboard

# NETWORK ANALYSIS LIBRARIES -- possible function name conflict here.  
# We will start with the "igraph" package, and look at the network, tidygraph, 
# sna, etc. packages later if needed.

library(igraph)    # Allow us to use network objects
library(viznetwork,networkd3,ggraph)   # For network visualizations
# library(tidygraph) # Alternative to igraph, with better syntax and so neat tricks.


#library(intergraph) # add if you need to switch between the formats of different  
                     # graph packages.


# SET SEED FOR REPLICABILITY

set.seed(8888)   # Note: Changing order may alter results.





#####  LOAD DATA FROM SOCIAL FEED MANAGER ######

# NOTE: igraph and similar can take an edgelist and easily turn it into an 
# adjacency matrix.  So that at least is easy!  




#####   DESCRIPTIVE STATISTICS  ######







#### CODE FOR SHINY DASHBOARD 




