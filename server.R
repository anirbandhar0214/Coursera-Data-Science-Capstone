# Load Basic Libraries
suppressPackageStartupMessages(
c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
	library(rsconnect),
        library(stylo)
	)
)

# Load Plotting Libraries
library(ggplot2)
library(rCharts)
library(ggvis)

# Load Data Processing Libraries
library(data.table)
library(reshape2)
library(dplyr)

# Load Markdown Library
library(markdown)

# Load Maps Libraries
library(mapproj)
library(maps)

# Load helper.R
source("helpers.R", local = TRUE)

sourceFinal4Data <- readRDS(file="final4Data.RData")
sourceFinal3Data <- readRDS(file="final3Data.RData")
sourceFinal2Data <- readRDS(file="final2Data.RData")


shinyServer(function(input, output) {
        
        wordPrediction <- reactive({
                text <- input$text
                textInput <- cleanInput(text)
                wordCount <- length(textInput)
                wordPrediction <- nextWordPrediction(wordCount,textInput)})
        
        output$predictedWord <- renderPrint(wordPrediction())
        output$enteredWords <- renderText({ input$text }, quoted = FALSE)
})



