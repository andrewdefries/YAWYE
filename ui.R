################################################################################################
library(shiny)
library(hexbin)
################################################################################################

widget_style <-
  "display: inline-block;
  vertical-align: text-top;
  padding: 7px;
  border: solid;
  border-width: 1px;
  border-radius: 4px;
  border-color: #CCC;"
#################################################################################
shinyUI(bootstrapPage(
headerPanel("ChemicalSpace::YAWYE.sdf"),
  sidebarPanel(
    div(style = widget_style,
	sliderInput("cmp_view","Query Compound", min=1, max=54, value=1)),
    div(style = widget_style,
	sliderInput("hits", "Hits to include", min=1, max = 6, value=1)),
    div(style = widget_style,
	textInput("vote", "Tanimoto cutoff (0.1-0.99):", '0.2')),
    div(style = widget_style,
	sliderInput("choice", "Food Choice:", min=1, max=8159, value=5))

),
#################################################################################
wellPanel(

plotOutput("compound_matrixB", height="800px", width="800px")#,
#plotOutput("pie_chart", height="450px", width="450px")  #,

###  verbatimTextOutput("YAWYE")
###  tableOutput("YAWYE_out")

#verbatimTextOutput("YAWYE_out")

##################################################################################################
  )
))


