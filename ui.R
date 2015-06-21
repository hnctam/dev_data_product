
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#
#setwd("D:/Work/Coursera/Workspace/DevDataProduct")
library(shiny)

library(rCharts)

shinyUI(
    navbarPage("Stock Price",
        tabPanel("Prediction",
                sidebarPanel(
                    sliderInput("range", label = h3("Range:"), min = 1, max = 12, value = 6),
                    selectInput(inputId = "cboSymbol", label = "Symbol", choices = list("AMZN", "AAPL", "IBM", "YHOO")),
                    checkboxInput(inputId = "chkAddMACD", label = "MACD : Moving Average Convergence Divergence", value = FALSE),
                    checkboxInput(inputId = "chkAddBBands", label = "BBands : Bollinger Bands", value = FALSE),
                    checkboxInput(inputId = "chkAddCCI", label = "CCI : Commodity Channel Index", value = FALSE),
                    checkboxInput(inputId = "chkAddEnvelope", label = "Envelope : Price Envelope", value = FALSE),
                    checkboxInput(inputId = "chkAddEVWMA", label = "EVWMA : Exponential Volume Weigthed Moving Average", value = FALSE),
                    checkboxInput(inputId = "chkAddSAR", label = "SAR : Parabolic Stop and Reverse", value = FALSE),
                    checkboxInput(inputId = "chkAddDPO", label = "DPO : Detrended Price Oscillator", value = FALSE),
                    checkboxInput(inputId = "chkAddZLEMA", label = "ZLEMA", value = FALSE),
                    ### New added technical indicators
                    checkboxInput(inputId = "chkAddADX", label = "ADX : Welles Wilder's Directional Movement Indicator", value = FALSE),
                    checkboxInput(inputId = "chkAddATR", label = "ATR : Average True Range", value = FALSE),
                    checkboxInput(inputId = "chkAddCMF", label = "CMF : Chaiken Money Flow", value = FALSE),
                    checkboxInput(inputId = "chkAddCMO", label = "ATR : Chande Momentum Oscillator", value = FALSE),
                    checkboxInput(inputId = "chkAddDEMA", label = "ATR : Double Exponential Moving Average", value = FALSE),
                    checkboxInput(inputId = "chkAddEMA", label = "EMA : Exponential Moving Average", value = FALSE),
                    checkboxInput(inputId = "chkAddMomentum", label = "Momentum", value = FALSE),
                    checkboxInput(inputId = "chkAddROC", label = "ROC : Rate of Change", value = FALSE),
                    checkboxInput(inputId = "chkAddRSI", label = "RSI : Relative Strength Indicator", value = FALSE),
                    checkboxInput(inputId = "chkAddSMA", label = "SMA : Simple Moving Average", value = FALSE),
                    checkboxInput(inputId = "chkAddSMI", label = "SMI : Stocastic Momentum Index", value = FALSE),
                    checkboxInput(inputId = "chkAddTRIX", label = "TRIX : Triple Smoothed Exponential Oscillator", value = FALSE),
                    checkboxInput(inputId = "chkAddVolume", label = "Volume", value = FALSE),
                    checkboxInput(inputId = "chkAddWMA", label = "WMA : Weighted Moving Average", value = FALSE),
                    checkboxInput(inputId = "chkWilliams", label = "WPR : Williams %R", value = FALSE),
                    actionButton(inputId = "btnPredict", label = "Predict...", icon = icon("cogs"))
                ),
                mainPanel(
                    tabsetPanel(
                        tabPanel(p(icon("line-chart"), "Stock Historical"),
                               h3('Stock', align = "center"),
                               plotOutput("stock_in_duration"),
                               h3('Stock Historical', align = "center"),
                               plotOutput("stock_statistics_bar"),
                               h3('Render 1 year', align = "center"),
                               plotOutput("stock_statistics_1year"),
                               h3('Render 6 months', align = "center"),
                               plotOutput("stock_statistics_6months"),
                               h3('Render 3 months', align = "center"),
                               plotOutput("stock_statistics_3months"),
                               h3('Render 1 month', align = "center"),
                               plotOutput("stock_statistics_1month")
                        ),
                        # Data 
                        tabPanel(p(icon("table"), "Data"),
                            downloadButton('downloadData', 'Download'),
                            dataTableOutput(outputId="tableData")
                            
                        )
                    )
                )
            
        ),
        
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            )
        )
    )
)
