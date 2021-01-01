# install.packages("shinyjs")
# install.packages("igraph")
# install.packages("shinycssloaders")

library(shinyjs)
library(shiny)
library(vcd)
library(MASS)
library(RColorBrewer)
library(datasets)
library(corrgram)
library(visdat)
library(forecast)
library(tidytext)
library(tidyverse)
library(janeaustenr)
library(stringr)
library(wordcloud2)
library(reshape2)
library(pls)
library(ggplot2)
#library(tabplot)  # WARNING:  This may not install as CRAN is withdrawing tabplot due to maintenance "issues"
library(visNetwork)
library(leaflet)
library(car)
library(shinycssloaders)
library(skimr)
#library(withSpinner)

#install.packages("XQuartz")

data_frame_car <- read.csv("Ass1Data.csv", header=T, sep = ",")
#data_frame_car <- data.frame(seq = seq(1:300), input_data)

data_frame_car$Author <- as.factor(data_frame_car$Author)
data_frame_car$Date <- as.Date(data_frame_car$Date, "%Y/%m/%d")
data_frame_car$Priority <- factor(data_frame_car$Priority, levels = c("Low","Medium","High"))
data_frame_car$Price <- factor(data_frame_car$Price, levels = c("Cheap","Costly","Extravagant"))
data_frame_car$Speed <- factor(data_frame_car$Speed, levels = c("Slow","Medium","Fast"))
data_frame_car$Duration <- factor(data_frame_car$Duration, levels = c("Short","Long","Very Long"))
data_frame_car$Temp <- factor(data_frame_car$Temp, levels = c("Cold","Warm","Hot"))
data_frame_car$Location <- as.factor(data_frame_car$Location)
data_frame_car$Agreed <- as.factor(data_frame_car$Agreed)
data_frame_car$Class <- as.factor(data_frame_car$Class)
data_frame_car$Surface <- as.factor(data_frame_car$Surface)


numeric_dataset <- cbind(data_frame_car[1],data_frame_car[15:44])
cols <- c(1,15:44)
#d<- data_frame_car[, cols]



# The selection in select box for Mosaic Matrix
choicesA <- colnames(data_frame_car[,c(3, 5:14)])


# The selection set in select box for MixedPairs and Rising value Chart
pairs_set <- data_frame_car[,c(1,15:25)]
pairs_set2 <- data_frame_car[,c(1,26:35)]
pairs_set3 <- data_frame_car[,c(1,36:44)]
pairs_set4 <- data_frame_car[,c(1,3:14)]
choicesB <- colnames(data_frame_car)
colname_pairs_set <- colnames(pairs_set)
colname_pairs_set2 <- colnames(pairs_set2)
colname_pairs_set3 <- colnames(pairs_set3)
colname_pairs_set4 <- colnames(pairs_set4)
choicesC <- c(colname_pairs_set, colname_pairs_set2, colname_pairs_set3)







