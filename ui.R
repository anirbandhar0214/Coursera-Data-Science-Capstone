# Load basic packages
suppressPackageStartupMessages(
  c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
	      library(rCharts),
        library(stylo)
	)
  )

shinyUI(navbarPage("Coursera Data Science Capstone project", 
                   theme = shinytheme("flatly"),
############################### ~~~~~~~~1~~~~~~~~ ##############################  
## Tab 1 - Prediction

tabPanel("Next Word Prediction Algorithm",
         
         tags$head(includeScript("shinyappsio.js")),
         
         fluidRow(
                 
                 column(3),
                 column(6,
                        tags$div(textInput("text", 
                                  label = h3("Please enter your text:"),
                                  value = ),
                        tags$span(style="color:grey",("Only English words are supported.")),
                        br(),
                        tags$hr(),
                        h4("Predicted next word is:"),
                        tags$span(style="color:darkred",
                                  tags$strong(tags$h3(textOutput("predictedWord")))),
                        br(),
                        tags$hr(),
                        h4("What you have entered:"),
                        tags$em(tags$h4(textOutput("enteredWords"))),
                        align="center")
                        ),
                 column(3)
         )
),

############################### ~~~~~~~~2~~~~~~~~ ##############################
## Tab 2 - About 

tabPanel("Infomation About This Application",
         fluidRow(
                 column(2,
                        p("")),
                 column(8,
                        includeMarkdown("about.md")),
                 column(2,
                        p(""))
         )
),

############################### ~~~~~~~~F~~~~~~~~ ##############################

## Information

tags$hr(),

tags$br(),

tags$span(style="color:grey", 
          tags$footer(("Word Predictor Application"), 
                      tags$br(),
                      ("Built with"), tags$a(
                              href="http://www.r-project.org/",
                              target="_blank",
                              "R"),
                      ("&"), tags$a(
                              href="http://shiny.rstudio.com",
                              target="_blank",
                              "Shiny."),

                      align = "center"),
          tags$br()
)
)
)
