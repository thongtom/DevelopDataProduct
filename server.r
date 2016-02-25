# Shiny server
library(shiny)
library(lubridate)
library(ggplot2)

shinyServer <- function (input, output) {
  dataAQI <-read.csv("aqi.csv", skip=1)

  dataSelect <- reactive({
    data <- dataAQI[(year(dataAQI$Date)==input$year & (month(dataAQI$Date)>=input$month[1] & month(dataAQI$Date)<=input$month[2])), ]
  })

  output$mean1 <- renderUI({
    dataSel <- dataSelect()
    m1 <- paste("AQI Mean: ", round(mean(dataSel[, "AQI"]), digits = 2))
    if (input$displaySelectionMean==TRUE) {
      HTML(m1)
    } else {
      HTML("")
    }
  })

  output$plot1 <- renderPlot({
    dataSel <- dataSelect()
    if (input$displayLinePlot==TRUE) {
      ggplot(data=dataSel, aes(x=dataSel$Hour, y =dataSel$AQI))+geom_smooth(color="green")+labs(x="Hour", y="AQI")
    } else {
      ggplot(data=dataSel, aes(x=dataSel$Hour, y =dataSel$AQI))+geom_point(color="green")+labs(x="Hour", y="AQI")
    }
})

  output$dataTable <- renderDataTable({
    dataSelect()
  })

}
