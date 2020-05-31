setwd("/Users/hannah/Desktop/SpaceApps2020/")

#NDVI Data
#read in data from 2020 - obtained from Giovanni
f2020 <- as.data.frame(read.csv("ndvi_2020.csv", header=TRUE, skip = 8))
f2020 <- f2020[,-1]

#read in data from 2019 - obtained from Giovanni
f2019 <- as.data.frame(read.csv("ndvi_2019.csv", header=TRUE, skip = 8))
f2019 <- f2019[,-1]

bar_data <- rbind(t(f2019), t(f2020))
colnames(bar_data) <- c("Jan", "Feb", "Mar", "Apr")
rownames(bar_data) <- c("2019", "2020")

barplot(as.matrix(bar_data), names.arg=colnames(bar_data), beside=T, main="Monthly Vegetation in Great Smoky Park", xlab="Month", ylab="Vegetation (unitless)", col=c("#566456", "#798878"))
legend("topleft", inset=0.05,legend=c("2019", "2020"), col=c("#566456", "#798878"), pch=15, cex=0.8, bty="n", pt.cex=1.8)

#Transpiration Data
f2020 <- as.data.frame(read.csv("transpiration_2020.csv", header=TRUE, skip = 8))
f2020 <- f2020[-which(grepl("02-29", f2020[,1], fixed = TRUE)),] #ignores leap day

f2019 <- as.data.frame(read.csv("transpiration_2019.csv", header=TRUE, skip = 8))[1:3493,]

month <- data.frame(f2020$time)
month <- lapply(month, function(y) gsub(".*-(.*)-.*", "\\1", y))
f2019 <- cbind(f2019, month)
f2020 <- cbind(f2020, month)

colnames(f2019) <- c("Date", "Transp", "month")
colnames(f2020) <- c("Date", "Transp", "month")

bar_data <- data.frame(matrix(ncol=5, nrow=2))
colnames(bar_data) <- c("Jan", "Feb", "Mar", "Apr", "May")
rownames(bar_data) <- c("2019", "2020")

for (i in c(1:5)){
  temp19 <- f2019[which(f2019$month==paste("0",i,sep="")),]
  temp20 <- f2020[which(f2020$month==paste("0",i,sep="")),]
  bar_data[1,i] <- sum(temp19[,2], na.rm=TRUE)/nrow(temp19)
  bar_data[2,i] <- sum(temp20[,2], na.rm=TRUE)/nrow(temp20)
}

barplot(as.matrix(bar_data), names.arg=colnames(bar_data), beside=T, main="Avg Monthly Transpiration in Great Smoky Park", xlab="Month", ylab="Transpiration (W/square meter)", col=c("#566456", "#798878"))
legend("bottomleft", inset=0.05,legend=c("2019", "2020"), col=c("#566456", "#798878"), pch=15, cex=0.8, bty="n", pt.cex=1.8)
