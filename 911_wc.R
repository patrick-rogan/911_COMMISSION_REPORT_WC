library(tm)
library(wordcloud)
library(SnowballC)
library(RColorBrewer)

# first converted pdf to text using pdftotext in cmd

wordsOld <-scan("911Report.txt", what = "character")

wordsOld <-Corpus(VectorSource(wordsOld))

wordsOld <- tm_map(wordsOld, PlainTextDocument)

wordsOld <- tm_map(wordsOld, removeNumbers)
wordsOld <- tm_map(wordsOld, stripWhitespace)
wordsOld <- tm_map(wordsOld, content_transformer(tolower))
wordsOld <- tm_map(wordsOld, removeWords, stopwords("english"))
wordsOld <- tm_map(wordsOld, removeWords, stopwords("SMART"))
wordsOld <- tm_map(wordsOld, removePunctuation)

speCol = (color = colorRampPalette(brewer.pal(8, "Dark2"))(100))
png("911_WC.png",width=583*2,height=486*2, units = "px", res = 150)
wordcloud(wordsOld, max.words = 500, random.order = FALSE, colors = speCol)
graphics.off()
