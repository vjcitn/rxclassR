library(rxclassR)
library(DT)
library(shiny)
data(allcls)

ui = fluidPage(
 sidebarLayout(
  sidebarPanel(
   helpText("rxclassR illustrations with random collections of drug codes"),
   numericInput("ind", "patient", min=1, step=1, max=24, value=1),
   radioButtons("height", "height in rxClass hierarchy", choices=c(1,2,3,4), selected=3),
   width=2),
  mainPanel(
   tabsetPanel(
    tabPanel("main",
     DT::dataTableOutput("basic")
    ),
    tabPanel("freq",
     helpText("categories depend on selection of 'height'"),
     verbatimTextOutput("freq")
    ),
    tabPanel("about",
     helpText("App under development.  'Patients' are just fictitious random collections of actual drugs with
classes derived from RxClass API.")
    )
   )
  )
 )
)

#server = function(input, output) {
#  output$basic = DT::renderDataTable({
#   tab = allcls[[input$ind]]
#   summ(tab, input$depth)
#   })
#  }

  
