
setwd("C:/Users/Edward/Documents/9Week3")

library(ggplot2)
library(plotly)

WeatherTable <- read.csv("TP.WeatherData.csv", stringsAsFactors=FALSE) # Sources the file 'TP.WeatherData.csv'
WeatherTable$Month <- factor(WeatherTable$Month,levels=WeatherTable[["Month"]]) # Recognises months in sequence
x <- WeatherTable$Month
y <- WeatherTable$RainyDays

p <- plot_ly(x=~x,y=~y,type='bar',name='Rainy Days',marker=list(color='purple')) %>%
        layout(title='Taipei Weather (by month)',
               xaxis = list(title=""),
               yaxis = list(title="Temperature (Celsius)")) %>%
        add_trace(y=WeatherTable$DailyMean,type='scatter',mode='lines+markers',line=list(color='green'),marker=list(color='green'),name='Mean Temp') %>%
        add_trace(y=WeatherTable$AverageMax,type='scatter',mode='lines+markers',line=list(color='red'),marker=list(color='red'),name='Average Max Temp') %>%
        add_trace(y=WeatherTable$AverageMin,type='scatter',mode='lines+markers',line=list(color='blue'),marker=list(color='blue'),name='Average Min Temp') %>%
print(p)

