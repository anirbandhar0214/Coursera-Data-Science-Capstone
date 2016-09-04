# Load basic packages
suppressPackageStartupMessages(
  c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)
        )
  )

sourceFinal4Data <- readRDS(file="final4Data.RData")
sourceFinal3Data <- readRDS(file="final3Data.RData")
sourceFinal2Data <- readRDS(file="final2Data.RData")

cleanInput <- function(text){
        
        textInput <- dataCleaner(text)
        textInput <- txt.to.words.ext(textInput, 
                                      language="English.all", 
                                      preserve.case = TRUE)
        
        return(textInput)
}

dataCleaner<-function(text){
  
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  
  return(cleanText)
}

nextWordPrediction <- function(wordCount,textInput){
        
        if (wordCount>=3) {
                textInput <- textInput[(wordCount-2):wordCount] 
                
        }
        
        else if(wordCount==2) {
                textInput <- c(NA,textInput)   
        }
        
        else {
                textInput <- c(NA,NA,textInput)
        }
        
        
        ### 1 ###
        wordPrediction <- as.character(sourceFinal4Data[sourceFinal4Data$unigram==textInput[1] & 
                                                          sourceFinal4Data$bigram==textInput[2] & 
                                                          sourceFinal4Data$trigram==textInput[3],][1,]$quadgram)
        
        if(is.na(wordPrediction)) {
                wordPrediction1 <- as.character(sourceFinal3Data[sourceFinal3Data$unigram==textInput[2] & 
                                                                   sourceFinal3Data$bigram==textInput[3],][1,]$trigram)
                
                if(is.na(wordPrediction)) {
                        wordPrediction <- as.character(sourceFinal2Data[sourceFinal2Data$unigram==textInput[3],][1,]$bigram)
                }
        }
        
        
        print(wordPrediction)
        
}
