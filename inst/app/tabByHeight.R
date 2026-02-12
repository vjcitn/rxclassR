tabByHeight = function(hgt=3) {
 data(allcls)
 sl = lapply(allcls, summ, hgt)
 for (i in 1:length(sl)) sl[[i]] = data.frame(sl[[i]], id=i)  
 do.call(rbind, sl)
}
