library(rxclassR)
data(allcls)
server = function(input, output) {
  output$basic = DT::renderDT({
   tab = allcls[[input$ind]]
   dat = summ(tab, as.numeric(input$height))
   dat
   })
   output$freq = renderPrint({
    allt = do.call(rbind, lapply(allcls, function(x) summ(x, as.numeric(input$height))))
    tab = sort(table(allt$rxclass), decreasing=TRUE)
    tab
   })
  }
