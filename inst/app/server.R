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
   output$upset = renderPlot({
    ll = lapply(allcls, function(x) summ(x, as.numeric(input$height)))
    for (i in 1:length(ll)) ll[[i]]$id = i
    allt = do.call(rbind, ll)
    make_upset(allt, nsets_in=input$nsets, maxlablength=input$labwid)
   })
   output$probtxt = renderText({
'
# output of getclass(1364446)
[[1]]
[[1]]$input
[1] 1364446

[[1]]$name
[1] "apixaban 5 MG [Eliquis]"

[[1]]$classinfo
     rxcui classtype                   classname classid
3  1364430    ATC1-4 Direct factor Xa inhibitors   B01AF
20 1364445    ATC1-4 Direct factor Xa inhibitors   B01AF
22 1364447    ATC1-4 Direct factor Xa inhibitors   B01AF
24 1992427    ATC1-4 Direct factor Xa inhibitors   B01AF
26 1992428    ATC1-4 Direct factor Xa inhibitors   B01AF

[[1]]$paths
[[1]]$paths[[1]]
  classId                       className classType
1   B01AF     Direct factor Xa inhibitors    ATC1-4
2    B01A           ANTITHROMBOTIC AGENTS    ATC1-4
3     B01           ANTITHROMBOTIC AGENTS    ATC1-4
4       B  BLOOD AND BLOOD FORMING ORGANS    ATC1-4
5       0 Anatomical Therapeutic Chemical    ATC1-4
</pre>'
})
  }
