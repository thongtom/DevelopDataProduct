# Shiny web application UI.
library(shiny)
library(ggplot2)
library(lubridate)
library(markdown)

shinyUI <- fluidPage(
  navbarPage("Air Quality Index at LDG. ULU REMIS area for 2013-2015",

             tabPanel("Data Analyst",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput(inputId = "year", label = "Year:", selected =2015, choices = c(2013,2014,2015)),
                          sliderInput(inputId = "month", label = "Month Range:", min = 1, max = 12, value = c(1, 3)),
                          checkboxInput(inputId="displaySelectionMean", "AQI Mean:", value = TRUE),
                          htmlOutput("mean1") ),
                        mainPanel(
                          tabsetPanel(

                            tabPanel(p("Table"),
                                     dataTableOutput(outputId="dataTable")
                            ), # tab panel

                            tabPanel(p("Plot"),
                                     h4('Air Quality Index for LDG. ULU REMIS area', align = "center"),
                                     plotOutput("plot1"),

                                     checkboxInput(inputId="displayLinePlot", "Line chart")

                            ) # tab panel

                          ) # tabsetPanel
                        ) # mainPanel
                      ) #sidebarLayout
             ), # tabPanel

             tabPanel("Info",
                      mainPanel(
                        includeMarkdown("readme.md")
                      ) # mainPanel
             ) # tabPanel

  ) # navbarPage
)
