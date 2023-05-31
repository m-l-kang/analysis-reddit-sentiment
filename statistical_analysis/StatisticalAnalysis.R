library(dplyr)
library(car)
setwd("/Users/admin/Documents/UCI/Stats 170AB/Project/Statistical Analysis") #set this to your working Directory
uci = read.csv("UCIRawSentiments.csv")
ucmerced = read.csv("UCMercedRawSentiments.csv")
ucb = read.csv("UCB Month Sentiment Data")
ucla = read.csv("UCLA Month Sentiment Data")
ucr = read.csv("UCR Month Sentiment")
ucsb = read.csv("UCSB Month Sentiment Data")
ucsc = read.csv("UCSC Month Sentiment Data")
ucsd = read.csv("UCSD Month Sentiment Data")


ucifiltered <- select(uci, author, body, created_utc, sentiment_score)
ucmercedfiltered <- select(ucmerced, author, body, created_utc, sentiment_score)
head(ucb, n=10)

qqnorm(ucifiltered$sentiment_score, col="red")

result = t.test(ucifiltered$sentiment_score, ucmercedfiltered$sentiment_score, var.equal = FALSE)
print(result)

varCheck = var.test(ucifiltered$sentiment_score, ucla$monthly_sentiment)
print(varCheck)

l = list(ucb$monthly_sentiment, ucla$monthly_sentiment, ucr$monthly_sentiment, ucsc$monthly_sentiment, ucsd$monthly_sentiment, ucifiltered$sentiment_score, ucmercedfiltered$sentiment_score)
result <- kruskal.test(l)

print(result)
