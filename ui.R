library(shiny)
data(mtcars)

shinyUI(pageWithSidebar(
	headerPanel('Correlation between M.P.G. and Other Car Measurements'),
	
	sidebarPanel(
		selectInput('x', 'Select a variable', names(mtcars)[2:11],
								selected=names(mtcars)[[1]]),
		
		checkboxInput("labels", label = "Show labels", value = FALSE),
		
		tags$hr(),
		sliderInput("conf", "Confidence Interval:", min = 0.9, max = 0.99, value = 0.95, step = 0.01),
		
		tags$hr(),
		
		h4("R-Squared"),
		verbatimTextOutput("fit")
		
	),
	
	mainPanel(
		plotOutput('plot')
	)
))


