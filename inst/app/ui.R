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
    tabPanel("upset", 
       numericInput("nsets", "nsets", min=1, max=15, step=1, value=7, width="12%"),
       numericInput("labwid", "labwidth", min=22, max=55, step=1, value=22, width="12%"),
                       plotOutput("upset")),
    tabPanel("about",
     helpText("App under development.  'Patients' are just fictitious random collections of actual drugs with
classes derived from RxClass API."),
     helpText("  "),
     helpText("There is a disconnect between how REDCap prompts for drug identities and what the
rxclass API will process.  Note below that the rxcui submitted as 'input' does not agree with
any rxcui in the 'classinfo' component.  However, there is only one ATC1-4 class assigned, and
that is what is used in the app."),
     helpText("  "),
     verbatimTextOutput("probtxt")
     )
    )
   )
  )
 )


