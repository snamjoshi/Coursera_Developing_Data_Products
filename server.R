library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
	
	output$plot <- renderPlot({
		
		dat <- data.frame(mpg = mtcars$mpg, selection = factor(mtcars[[input$x]]))
		
		if(input$labels == TRUE) {
		
		ggplot(dat, aes(selection, mpg)) +
			geom_point() +
			stat_smooth(method = "lm", level = input$conf, aes(group = 1)) +
			xlab(input$x) +
			geom_text(aes(label = row.names(mtcars)), size = 3) + 
			theme_bw()
		} else {
			
		ggplot(dat, aes(selection, mpg)) +
			geom_point() +
			stat_smooth(method = "lm", level = input$conf, aes(group = 1)) +
			xlab(input$x) +
			theme_bw()
		}
		
		
	})
	
	output$fit <- renderPrint({
	
		dat <- data.frame(mpg = mtcars$mpg, selection = factor(mtcars[[input$x]]))
		fit <- lm(mpg ~ selection, dat)
		round(summary(fit)$r.squared,2)
	})
	
})