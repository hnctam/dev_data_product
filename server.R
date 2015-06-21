library(shiny)

# Plotting 
library(ggplot2)
library(rCharts)
library(ggvis)

# Data processing libraries
library(data.table)
library(reshape2)
library(dplyr)

# Required by includeMarkdown
library(markdown)

# It has to loaded to plot ggplot maps on shinyapps.io
library(mapproj)
library(maps)

# Load helper functions
source("predictor.R", local = TRUE)

# Define and initialize reactive values
system_environment <- new.env()

# Shiny server 
shinyServer(function(input, output, session) {
    
    observe({
        if(input$btnPredict == 0) return()
        predictSymbol(system_environment, input, output)
    })
    
    # Render Plots
    output$downloadData <- downloadHandler(
        filename = paste("data/", input$cboSymbol, '.csv', sep = ""),
        content = function(file) {
            write.csv(dataTable(), file, row.names=TRUE)
        }
    )
})


