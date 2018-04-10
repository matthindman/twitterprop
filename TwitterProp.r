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
<<<<<<< HEAD
=======

TaishiHello <- "Hello world! This is Taishi."
print(TaishiHello)
>>>>>>> 568a3513d9d078f959b783b8dbc9bf032850ad0d

# setwd()   # set working directory here if needed
  
# LOAD LIBRARIES

# Initial installation -- these lines only need to be run once.
# Add additional libraries that might need to be installed to the list below.  

# We're installing lots of interesting packages even if we won't use them initially.
# And then calling individual libraries only when needed.  


list.of.packages <- c("tidyverse","tidytext","tm","chunked",    # basic data sci tools
                      "sparklyr","rsparkling",                  # spark db interface
                      "h2o",                                    # big data ml on clusters
                      "twitteR","streamR","ROAuth","rtweet",    # twitter specific libs
                      "lubridate",                              # time/ date tools
                      "rrecsys","recosystem", "recommenderlab", # recommender sys libs
                      "shiny","shinydashboard",                 # shiny libs
                      "network","igraph","tidygraph", "sna",    # graph / network libs
                      "intergraph",                             # translation btwn graph libs
                      "ggraph",                                 # network visualization libs
                      "keras")                                  # TensorFlow. For fun. :) 
                      
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


# Install Mike Kearney's botornot tool

if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}
devtools::install_github("mkearney/botornot")
library(botornot)

# TWITTER SPECIFIC LIBRARIES
# Allow you to access / pull tweets directly from Twitter 
# We won't use at first but may be useful for prototyping.

# NOTE:twitteR seems to be starting to be replaced by newer rtweet package.  
# Both have a good structure for treating users, tweets, followers etc. as R objects. 
# Docs here: https://cran.r-project.org/web/packages/twitteR/twitteR.pdf and for rtweet
# https://cran.r-project.org/web/packages/rtweet/rtweet.pdf 

# library(twitteR)   # popular Twitter lib, but commented out for now
library(rtweet)   # Alternative Twitter library. We'll try this to start with.  


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

<<<<<<< HEAD
#### CODE FOR TEXT MINING ####
library(qdap)#Word Frequencies
library(readr)#Read Data from CSV
library(tm)#Text Mining,create dtm and tdm
library(stringr)#Extract word from sentence
library(dplyr)
library(wordcloud)#Create Word Cloud
library(SnowballC)
library(topicmodels)#Build Topic Models
sample <- fake1[1:5000,]#choose 5000 twitter as sample
text <- as.character(sample$text)
text <- iconv(text, 'utf-8', 'ascii', sub='')
#clean text
clean_tweet = gsub("&amp", "", text)
clean_tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", clean_tweet)
clean_tweet = gsub("@\\w+", "", clean_tweet)
clean_tweet = gsub("[[:punct:]]", "", clean_tweet)
clean_tweet = gsub("[[:digit:]]", "", clean_tweet)
clean_tweet = gsub("http\\w+", "", clean_tweet)
clean_tweet = gsub("[ \t]{2,}", "", clean_tweet)
clean_tweet = gsub("^\\s+|\\s+$", "", clean_tweet)
#convert texts into corpus format
tweet_source <- VectorSource(clean_tweet)
tweet_corpus <- VCorpus(tweet_source)
#clean corpus format text
clean_corpus <- function(corpus){
  corpus <- tm_map(corpus, content_transformer(tolower))
  corpus <- tm_map(corpus, removeWords, stopwords("en"))
  corpus <- tm_map(corpus, stripWhitespace)
  corpus <- tm_map(corpus, stemDocument)
  return(corpus)
}
tweet <- clean_corpus(tweet_corpus)
tweet[[10]][1]
#Create tdm and dtm(divide sentences into words)
tweet_dtm <- DocumentTermMatrix(tweet)
dim(tweet_dtm)
tweet_m1 <- as.matrix(tweet_dtm)
tweet_m1[148:150,2587:2590]
tweet_tdm <- TermDocumentMatrix(tweet)
dim(tweet_tdm)
tweet_m2 <- as.matrix(tweet_tdm)
tweet_m2[2587:2590,148:150]
term_frequency<-rowSums(tweet_m2)
term_frequency<-sort(term_frequency,decreasing=TRUE)
# Plot a barchart of the 30 most common words
barplot(term_frequency[1:30],col="tan",las=2)
# Create a wordcloud for the values in word_freqs
color<-c("grey80", "darkgoldenrod1","red")
wordcloud(word_freqs$term, 
          word_freqs$num, 
          max.words = 100, 
          colors = color)
###Part 2: Use tidy format to do sentiment analysis and bigrams analysis
library(ggplot2)
install.packages("devtools")
library(devtools)
#devtools::install_github("ropensci/tokenizers")
library(tokenizers)
library(tidytext)
library(tidyr)
library(magrittr)
library(reshape2)
library(igraph)
library(ggraph)
library(widyr)
tweet2 <- sample[,c(24,6)]
tweet2$text <- as.character(tweet2$text)
###Part1: Data Cleaning and Word Frequencies
#clean text
clean_tweet2 = gsub("&amp", "", tweet2$text)
clean_tweet2 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", clean_tweet2)
clean_tweet2= gsub("@\\w+", "", clean_tweet2)
clean_tweet2 = gsub("[[:punct:]]", "", clean_tweet2)
clean_tweet2 = gsub("[[:digit:]]", "", clean_tweet2)
clean_tweet2 = gsub("http\\w+", "", clean_tweet2)
clean_tweet = gsub("[ \t]{2,}", "", clean_tweet2)
clean_tweet2 = gsub("^\\s+|\\s+$", "", clean_tweet2)
tweet2$text <- clean_tweet2
#convert sentence into tidy text
tidy_tweet <- tweet2 %>%
  unnest_tokens(word, text)
#clean stop words
data(stop_words)
tidy_tweet <- tidy_tweet %>%
  anti_join(stop_words)
tidy_tweet[1:10,]
##sentiment analysis
#we can check the freqencies of joy and anger or other kinds of emotional words for all the tweets
nrc_joy <- get_sentiments("nrc") %>% filter(sentiment == "joy")
nrc_anger <- get_sentiments("nrc") %>% filter(sentiment == "anger")
tidy_tweet %>%
  inner_join(nrc_joy) %>%
  count(word, sort = TRUE)
tidy_tweet %>%
  inner_join(nrc_anger) %>%
  count(word, sort = TRUE)
tidy_cnt <- tidy_tweet %>%
  count(word, sort = TRUE) 
#use lexicon 'bing' to label words as positive/negative
bing_word_counts <- tidy_tweet %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()
#plot the most frequent 20 positive/negative words
bing_word_counts %>%
  group_by(sentiment) %>%
  top_n(20) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Contribution to sentiment",
       x = NULL) +
  coord_flip()
#Plot word cloud for positive/negative words
tidy_tweet %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(colors = c("gray20", "tomato"),
                   max.words = 100)
##bigram analysis
#extract bigrams from sentences
tweet_bigrams <- tweet2 %>%
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>%
  na.omit()
tweet_bigrams %>%
  count(bigram, sort = TRUE)
#clean stopwords
bigrams_separated <- tweet_bigrams %>%
  separate(bigram, c("word1", "word2"), sep = " ")
bigrams_filtered <- bigrams_separated %>%
  filter(!word1 %in% stop_words$word) %>%
  filter(!word2 %in% stop_words$word)
# new bigram counts
bigram_counts <- bigrams_filtered %>% 
  count(word1, word2, sort = TRUE)
bigram_counts
#use this function we can check the first word/second word with the other word given
bigrams_separated %>%
  filter(word1 == "gun") %>%
  count(word2, sort = TRUE)
#plot words'network with frequency larger than 10
bigram_graph <- bigram_counts %>%
  filter(n > 10) %>%
  graph_from_data_frame()
ggraph(bigram_graph, layout = "fr") +
  geom_edge_link() +
  geom_node_point() +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1)
#similar graph with arrow to represent direction of words
a <- grid::arrow(type = "closed", length = unit(.15, "inches"))
ggraph(bigram_graph, layout = "fr") +
  geom_edge_link(aes(edge_alpha = n), show.legend = FALSE,
                 arrow = a, end_cap = circle(.07, 'inches')) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), vjust = 1, hjust = 1) +
  theme_void()
#calculate the phi correlation between words using each user id as a unit
word_cors <- tidy_tweet %>%
  group_by(word) %>%
  filter(n() >= 20) %>%
  pairwise_cor(word,user_id,sort = TRUE)
#plot network plot for words with cor>0.6
word_cors %>%
  filter(correlation > .6) %>%
  graph_from_data_frame() %>%
  ggraph(layout = "fr") +
  geom_edge_link(aes(edge_alpha = correlation), show.legend = FALSE) +
  geom_node_point(color = "lightblue", size = 5) +
  geom_node_text(aes(label = name), repel = TRUE) +
  theme_void()
#use this function to find the words most related to the given word
word_cors %>%
  filter(item2 == "gun")
### Part3: Topic Modeling
rowTotals <- apply(tweet_dtm , 1, sum) #Find the sum of words in each Document
tweet_dtm   <- tweet_dtm[rowTotals> 0, ]           #remove all docs without words
#assume there are 5 topics
k = 5;
SEED = 1234;
#LDA with Gibbs Sampling
tweet.lda <- LDA(tweet_dtm, k, method="Gibbs", control=list(seed = SEED))
lda.topics <- as.matrix(topics(tweet.lda))
#print the 10 most important words in the topic
lda.terms <- terms(tweet.lda,10)
lda.terms
=======
# As an example, here is the Hamilton68 dashboard:
# https://dashboard.securingdemocracy.org/ 



>>>>>>> 568a3513d9d078f959b783b8dbc9bf032850ad0d
