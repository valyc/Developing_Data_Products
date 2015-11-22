library(shiny)

dt.raw <- read.table("data_valyc_DDP.csv", sep = ",", header = TRUE)

shinyServer(function(input, output) {
  
  dt <- reactive({
    yo <- subset(dt.raw, Year >= input$range[1] & Year <= input$range[2])
    yo <- aggregate(cbind(AirTemperture, Precipitations, WindSpeed) ~ Year + City, data=yo, mean, na.action=na.omit)
    })
  
  
  output$myChart <- renderChart({
    m1 <- rPlot(input$Parameter, input$Indicator, data = dt(), color = 'City', type = 'line')
    m1$addParams(dom = 'myChart')
    return(m1)
  })

 output$table <- renderDataTable(dt(), options = list(bFilter = FALSE, iDisplayLength = 50))
 
 output$downloadData <- downloadHandler(filename = 'data.csv',
                                        content = function(file) 
                                        {
                                          write.csv(dt(), file, row.names=FALSE)
                                        }
 )
 
})