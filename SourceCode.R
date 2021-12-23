---
title: "Google Search analysis"
author: "Muhammad Junaid"
date: "12/14/2021"
---
library(gtrendsR)
library(ggplot2)
library(dplyr)


#Extract Data for Key word Specified
result <- gtrends(c("Machine Learning"))
resultOverRegion<-result$interest_by_country

country<-data.frame(countries = resultOverRegion$location[!is.na(resultOverRegion$hits)],hits=na.omit(resultOverRegion$hits))
sort(country,decreasing = TRUE)
country<-head(country,10)
country
#Bar Plot

p<-ggplot(data=country, aes(x=countries, y=hits)) + geom_bar(stat="identity")
p

#Total Google Searches for Machine Learning
time<-result$interest_over_time

df<-data.frame(date=time$date[!is.na(time$hits)],hits=na.omit(time$hits))
df[order(df$date, -df$hits),]

p<-ggplot(data=df, aes(x=date, y=hits)) + geom_line(aes(color=date)) +ggtitle("Total Google Searches for Machine Learning") +xlab("Year")+ylab("Hits")
p

