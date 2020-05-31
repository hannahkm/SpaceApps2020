#French Broad River: located near the Great Smoky National Park
  #Runs along Route 251 (highway)

fbr <- read.csv("fbr_vars.txt", sep="\t", skip=36)
fbr <- fbr[, -which(fbr[2,]=="A")]
fbr <- fbr[-1,c(3,4,9,11)]
colnames(fbr) <- c("Date", "Mean Water Temp", "Median Water pH", "Mean Dissolved O2")

fbr20 <- fbr[which(grepl("2020", fbr[,1], fixed = TRUE)),]

#not enough data for 2019, so just looking at 2020
plot(fbr20[,2], type="l", col="#798878", xaxt="n", xlab="Date", ylab="Water Temperature (C)", main="Water Temperature of the French Broad River in 2020")
axis(side=1, at=c(0,30,60,90,120,150), labels=c("Jan","Feb","Mar","Apr","May","Jun"))

plot(fbr20[,3], type="l", col="#798878", xaxt="n", xlab="Date", ylab="Water pH", main="Water pH of the French Broad River in 2020")
axis(side=1, at=c(0,30,60,90,120,150), labels=c("Jan","Feb","Mar","Apr","May","Jun"))

plot(fbr20[,4], type="l", col="#798878", xaxt="n", xlab="Date", ylab="Dissolved O2 (mg/L)", main="Dissolved O2 in the French Broad River in 2020")
axis(side=1, at=c(0,30,60,90,120,150), labels=c("Jan","Feb","Mar","Apr","May","Jun"))


#Catawba River: Right outside of Charlotte, North Carolina
cata <- read.csv("cat_vars.txt", sep="\t", skip=36)
cata <- cata[, -which(cata[2,]=="A")]
cata <- cata[-1,c(3,6,9)]
colnames(fbr) <- c("Date", "Mean Water Temp", "Mean Dissolved O2")

cat20 <- cata[which(grepl("2020", cata[,1], fixed = TRUE)),]
cat20 <- cat20[95:150,]
cat19 <- cata[which(grepl("2019", cata[,1], fixed = TRUE)),]
cat19 <- cat19[1:56,]

#line/scatter graphs to compare values
plot(cat19[,2], type="l", col="#566456", xaxt = "n", xlab="Date", ylab="Water Temperature (C)", main="Water Temperature of the Catawba River", lwd=2)
lines(cat20[,2], col="#9CAEA9", lwd=2)
axis(side=1, at=c(0,30), labels=c("Apr","May"))
legend("topleft", legend=c("2019", "2020"), col=c("#566456", "#9CAEA9"), lty=1, cex=0.8, lwd=2)

plot(cat19[,3], type="p", pch=16, cex=0.8, col="#566456", xaxt="n", xlab="Date", ylab="Dissolved O2 (mg/L)", main="Dissolved O2 in the Catawba River")
points(cat20[,3], col="#9CAEA9", pch=16, cex=0.8)
axis(side=1, at=c(0,30), labels=c("Apr","May"))
legend("topright", legend=c("2019", "2020"), col=c("#566456", "#9CAEA9"), lty=1, cex=0.8, lwd=2)

month <- data.frame(cat19[,1])
month <- lapply(month, function(y) gsub(".*-(.*)-.*", "\\1", y))
cat19 <- cbind(cat19, month)
cat20 <- cbind(cat20, month)
colnames(cat19) <- c("Date", "Temp", "O2", "month")
colnames(cat20) <- c("Date", "Temp", "O2", "month")

temp <- data.frame(matrix(ncol=2, nrow=2))
colnames(temp) <- c("Apr", "May")
rownames(temp) <- c("2019", "2020")

o2 <- data.frame(matrix(ncol=2, nrow=2))
colnames(o2) <- c("Apr", "May")
rownames(o2) <- c("2019", "2020")

for (i in c(4:5)){
  temp19 <- cat19[which(cat19$month==paste("0",i,sep="")),]
  temp20 <- cat20[which(cat20$month==paste("0",i,sep="")),]
  temp[1,i-3] <- sum(temp19[,2], na.rm=TRUE)/nrow(temp19)
  temp[2,i-3] <- sum(temp20[,2], na.rm=TRUE)/nrow(temp20)
  o2[1,i-3] <- sum(temp19[,3], na.rm=TRUE)/nrow(temp19)
  o2[2,i-3] <- sum(temp20[,3], na.rm=TRUE)/nrow(temp20)
}

barplot(as.matrix(temp), names.arg=colnames(temp), beside=T, main="Avg Water Temp of Catawba River", xlab="Month", ylab="Temperature (C)", col=c("#566456", "#9CAEA9"))
legend("topleft", inset=0.05,legend=c("2019", "2020"), col=c("#566456", "#9CAEA9"), pch=15, cex=0.8, bty="n", pt.cex=1.8)

barplot(as.matrix(o2), names.arg=colnames(o2), beside=T, main="Avg Dissolved O2 Levels of Catawba River", xlab="Month", ylab=" Dissolved O2 (mg/L)", col=c("#566456", "#9CAEA9"))
legend("bottomright",legend=c("2019", "2020"), col=c("#566456", "#9CAEA9"), pch=15, cex=0.8, pt.cex=1.8)






