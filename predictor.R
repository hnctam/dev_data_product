#' Predict based on the stock symbol
#'
#' @param symbol the stock symbol which is used to perform analysis
#' @param environment the environment which aims to cache the loaded value
#' @param output the out put object, which used to render
predictSymbol <- function(environment, input, output) {
    library(quantmod)

    symbol <- input$cboSymbol
    symbol_data <- downloadSymbol(environment, symbol)
    
    output$tableData <- renderDataTable(
      {symbol_data}, options = list(bFilter = FALSE, iDisplayLength = 50)
    )
    
    in_duration_data <- last(symbol_data, paste(input$range, "months", sep = " "))
    
    
    output$stock_statistics_bar <- displayChart(input, paste(symbol, "Historical", sep = "-"), symbol_data)

    output$stock_in_duration <- displayChart(input, paste(symbol, "In duration", sep = "-"), in_duration_data)
    
    one_year_data <- last(symbol_data, "12 months")
    output$stock_statistics_1year <- displayChart(input, paste(symbol, "1 year", sep = "-"), one_year_data)
    
    six_month_data <- last(symbol_data, "6 months")
    output$stock_statistics_6months <- displayChart(input, paste(symbol, "6 months", sep = "-"), six_month_data)
    
    three_month_data <- last(symbol_data, "3 months")
    output$stock_statistics_3months <- displayChart(input, paste(symbol, "3 months", sep = "-"), three_month_data)
    
    one_month_data <- last(symbol_data, "1 month")
    output$stock_statistics_1month <- renderPlot({
      print(candleChart(one_month_data, name = symbol, multi.col=TRUE, theme = "white"))
    })
    
}

displayChart <- function(input, symbolName, symbolData) {
  plot <- renderPlot({
    print(candleChart(symbolData, name = symbolName, multi.col=TRUE, theme = "white"))
    if (input$chkAddMACD == TRUE) {
      print(addMACD())  
    }
    
    if (input$chkAddBBands == TRUE) {
      print(addBBands())
    }
    
    if (input$chkAddCCI == TRUE) {
      print(addCCI())
    }
    
    if (input$chkAddEnvelope == TRUE) {
      print(addEnvelope())
    }
    
    if (input$chkAddEVWMA == TRUE) {
      print(addEVWMA())
    }
    
    if (input$chkAddSAR == TRUE) {
      print(addSAR())
    }
    
    if (input$chkAddDPO == TRUE) {
      print(addDPO())
    }
    
    if (input$chkAddZLEMA == TRUE) {
      print(addZLEMA())
    }
    
    ###############################################3
    if (input$chkAddADX == TRUE) {
      print(addADX())
    }
    
    if (input$chkAddATR == TRUE) {
      print(addATR())
    }
    
    if (input$chkAddCMF == TRUE) {
      print(addCMF())
    }
    
    if (input$chkAddCMO == TRUE) {
      print(addCMO())
    }
    
    if (input$chkAddDEMA == TRUE) {
      print(addDEMA())
    }
    
    if (input$chkAddEMA == TRUE) {
      print(addEMA())
    }
    
    if (input$chkAddMomentum == TRUE) {
      print(addMomentum())
    }
    
    if (input$chkAddROC == TRUE) {
      print(addROC())
    }
    
    if (input$chkAddRSI == TRUE) {
      print(addRSI())
    }
    
    if (input$chkAddSMA == TRUE) {
      print(addSMA())
    }
    
    if (input$chkAddSMI == TRUE) {
      print(addSMI())
    }
    
    if (input$chkAddTRIX == TRUE) {
      print(addTRIX())
    }
    
    if (input$chkAddVolume == TRUE) {
      print(addVo())
    }
    
    if (input$chkAddWMA == TRUE) {
      print(addWMA())
    }
    
    if (input$chkWilliams == TRUE) {
      print(addWPR())
    }
  })
  return (plot)
}

# Download data for a stock if needed, and return the data
downloadSymbol <- function(environment, symbol) {
  if (is.null(environment[[symbol]])) {
    environment[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }
  
  environment[[symbol]]
}


test <- function() {
  par(ask=TRUE)
  require(quantmod)
  getSymbols("AAPL",src="yahoo")
  barChart(AAPL)
  candleChart(AAPL,multi.col=TRUE,theme="white")
  getSymbols("XPT/USD",src="oanda") 
  chartSeries(XPTUSD,name="Platinum (.oz) in $USD")
  chartSeries(to.weekly(XPTUSD),name="Platinum (.oz) in $USD",up.col="white",dn.col="blue")
  par(ask=FALSE)
}

predictTestSymbol <- function(environment, input, output) {
  print(input$btnPredict)
}