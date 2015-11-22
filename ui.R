require(rCharts)

shinyUI(pageWithSidebar(
  headerPanel("Meteorology of Republic of Moldova, 2012-2014 years"),
  
  sidebarPanel(
    selectInput(inputId = "Indicator",
                label = "Choose data to show",
                choices = c('AirTemperture', 'Precipitations', 'WindSpeed'),
                selected = "AirTemperture"),
    sliderInput("range", "Select years range:", min = 2002, max = 2014, sep = "",
                value = c(2002, 2014)),
    selectInput(inputId = "Parameter",
                label = "Show by:",
                choices = c('Year'),
                selected = "Year")
  ),
  
  mainPanel(tabsetPanel(tabPanel('Plots', 
                                 h4('Yearly average data', align = "center"), 
                                 showOutput("myChart", "polycharts")),
                        
                        tabPanel('Data', 
                                 dataTableOutput(outputId="table"), downloadButton('downloadData', 'Download')),
                        
                        tabPanel('Documentation', 
                                 h4('This application allows the user to:', align = "center"),
                                 h5('- Select the input: type of indicators and range of years,', align = "center"),
                                 h5('- Select the output to be displayed: plots, data table or documentation,', align = "center"),
                                 h5('- Also has a option to download the filtered data.', align = "center"),
                                 h4('The data used in application are Meteorology data (*air temperature, quantity of precipitations and wind speed for years 2002-2014*), provided by National Bureau of Statistcis of Moldova.', align = "center"),
                                 h5('Dataset has been obtained and processed for the course project from ', a("here", href="http://statbank.statistica.md/pxweb/Database/EN/01%20GEO/GEO01/GEO01.asp", target="_blank"), align = "center"),
                                 h4('Application source code is available on ', a("GitHub", href="https://github.com/valyc/Developing_Data_Products", target="_blank"), align = "center"))
                                 
                        
                        
                        ))
))