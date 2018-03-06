##################################
# FAKE AND CONSPIRACY NEWS ON TWITTER
# PRE-ALPHA VERSION 0.1
#
##############################


### NOTE: Some of these functions have calls with the same names.
### This can lead to masking and unexpected behavior.
### Document this if you see it, so we can fix the problem. 

#INITIAL TEST TO ENSURE EVERYONE CAN MAKE GITHUB COMMITS.
#I've made a quick Hello World statement below. Add your own.

MattHello <- "Hellow world! This is Matt."
print(MattHello)

NikkiHello <- "Hellow world! This is Nikki."
print(NikkiHello)

SpencerHello <- "Hello world! This is Spencer."
print(SpencerHello)

TaishiHello <- "Hello world! This is Taishi."
print(TaishiHello)

# setwd()   # set working directory here if needed
  
# LOAD LIBRARIES

# Initial installation -- these lines only need to be run once.
# Add additional libraries that might need to be installed to the list below.  

# We're installing lots of interesting packages even if we won't use them initially.
# And then calling individual libraries only when needed.  


list.of.packages <- c("tidyverse","tidytext","tm","chunked",     # basic data sci tools
                      "twitteR","streamR","ROAuth","rtweet",    # twitter specific libs
                      "lubridate",                               # time/ date tools
                      "rrecsys","recosystem", "recommenderlab",  # recommender sys libs
                      "shiny","shinydashboard",                  # shiny libs
                      "network","igraph","tidygraph", "sna",     # graph / network libs
                      "intergraph",                              # translation btwn graph libs
                      "ggraph",                                  # network visualization libs
                      "keras")                                   # TensorFlow. For fun. :) 
                      
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


# TWITTER SPECIFIC LIBRARIES
# Allow you to access / pull tweets directly from Twitter 
# We won't use at first but may be useful for prototyping.

# NOTE:twitteR seems to be starting to be replaced by newer rtweet package.  
# Both have a good structure for treating users, tweets, followers etc. as R objects. 
# Docs here: https://cran.r-project.org/web/packages/twitteR/twitteR.pdf and for rtweet
# https://cran.r-project.org/web/packages/rtweet/rtweet.pdf 

# library(twitteR)   # Twitter libs, but commented out for now
# library(rtweet)   # Alternative Twitter library


# RECOMMENDER SYSTEM LIBRARY
# We will start by using the rrecsys library. 
# recommenderlab is another option but some functionality we need is missing.
# Also: recosystem is a wrapper for the libmf matrix factorization program.
# libmf is written in C++. Very powerful and fast at scale if needed. 

library(rrecsys)  # Change / add to if we chose a different recommender library

library(tidyverse,tidytext) # lots of basic tools
library(shiny,shinydashboard) # for our shiny dashboard

# NETWORK ANALYSIS LIBRARIES -- possible function name conflict here.  
# We will start with the "igraph" package, and look at the network, tidygraph, 
# sna, etc. packages later if needed.

library(igraph)    # Allow us to use network objects
library(ggraph)    # For network visualizations

# library(tidygraph) # Alternative to igraph, with better syntax and some neat tricks.
                     # We may end up using this instead.  

# library(intergraph) # add if you need to switch between the formats of different  
                     # graph packages.

# SET SEED FOR REPLICABILITY

set.seed(8888)   # Note: Changing order may alter results.




#####  LOAD DATA FROM SOCIAL FEED MANAGER ######

# NOTE: igraph and similar can take an edgelist and easily turn it into an 
# adjacency matrix.  So that at least is easy!  





####  DESCRIPTIVE STATISTICS  #####

# Start with:
# -- Most popular tweets in our network over the last day / week
# -- Accounts that have gained new followers from our network in the last month

# Good examples of code here:
# https://www.tidytextmining.com/twitter.html 

# A different approach but also promising:
# http://www.rdatamining.com/docs/twitter-analysis-with-r





####  NETWORK ANALYSIS ####

# Great intro to the igraph package below.  Start by checking this out: 
# http://kateto.net/networks-r-igraph  
# Also has a good refresher on R basics.  
# Here is the real igraph docs: https://cran.r-project.org/web/packages/igraph/igraph.pdf 





#### CODE FOR SHINY DASHBOARD 

# Start with the sample code here:
# https://rstudio.github.io/shinydashboard/get_started.html



