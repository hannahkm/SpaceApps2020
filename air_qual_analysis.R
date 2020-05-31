#code for looking at air quality over parks
#variables:
#AOD (aerosols): no unit
#Methane: ppbv
#Nitrogen Dioxide (NO2): 1/square cm

setwd("/Users/hannah/Desktop/SpaceApps2020/")

#read in data from 2020 - obtained from Giovanni
f2020 <- cbind(data.frame(lapply(list.files(pattern=".*2020\\.csv"), read.csv, header=TRUE, skip = 8)))
f2020 <- f2020[,c(1,2,4,6,8)]
colnames(f2020) <- c("Date", "Aerosols1", "Aerosols2", "Methane", "NO2")
rownames(f2020) <- f2020$Date
f2020 <- f2020[,-1]

#read in data from 2019 - obtained from Giovanni
f2019 <- cbind(data.frame(lapply(list.files(pattern=".*2019\\.csv"), read.csv, header=TRUE, skip = 8)))
f2019 <- f2019[1:147,c(2,4,6,8)]
colnames(f2019) <- c("Aerosols1", "Aerosols2", "Methane", "NO2")
rownames(f2019) <- rownames(f2020)

f2019$Aerosols1[f2019$Aerosols1==-9.999000e+03] <- NA
f2019$Aerosols2[f2019$Aerosols2==-9.999000e+03] <- NA
f2019$Methane[f2019$Methane==-9999.000] <- NA
f2019$NO2[f2019$NO2==-1.267651e+30] <- NA

f2020$Aerosols1[f2020$Aerosols1==-9.999000e+03] <- NA
f2020$Aerosols2[f2020$Aerosols2==-9.999000e+03] <- NA
f2020$Methane[f2020$Methane==-9999.000] <- NA
f2020$NO2[f2020$NO2==-1.27e+30] <- NA
  
#COMPARISON IN SCATTERPLOTS - ugly!!
#compare aerosols
plot(f2019[,1], type="p", col="red", xlab="Date", ylab="Aerosols (no units)", main="Aerosols over Great Smoky Park")
points(f2019[,2], col="red")
points(f2020[,1], col="blue")
legend("topright", legend=c("2019", "2020"), col=c("red", "blue"), lty=1, cex=0.8)
axis(side=1, labels=rownames(f2019))

#compare methane
plot(f2019[,3], type="p", col="red", xlab="Date", ylab="Methane (ppbv)", main="Methane over Great Smoky Park")
points(f2020[,2], col="blue")
legend("topright", legend=c("2019", "2020"), col=c("red", "blue"), lty=1, cex=0.8)

#compare no2
plot(f2019[,4], type="p", col="red", xlab="Date", ylab="NO2 (1/square cm)", main="NO2 over Great Smoky Park")
points(f2020[,3], col="blue")
legend("topright", legend=c("2019", "2020"), col=c("red", "blue"), lty=1, cex=0.8)

###########################################################
##Using bar graphs to compare averages in 2019/2020 by month
###########################################################
month <- data.frame(rownames(f2019))
month <- lapply(temp, function(y) gsub("(.*)/.*/.*", "\\1", y))
f2019 <- cbind(f2019, month)
f2020 <- cbind(f2020, month)
colnames(f2019) <- c("Aerosols1", "Aerosols2", "Methane", "NO2", "month")
colnames(f2020) <- c("Aerosols1", "Aerosols2",  "Methane", "NO2", "month")

aero <- data.frame(matrix(ncol=5, nrow=2))
colnames(aero) <- c("Jan", "Feb", "Mar", "Apr", "May")
rownames(aero) <- c("2019", "2020")

no2 <- data.frame(matrix(ncol=5, nrow=2))
colnames(no2) <- c("Jan", "Feb", "Mar", "Apr", "May")
rownames(no2) <- c("2019", "2020")

for (i in c(1:5)){
  temp19 <- f2019[which(f2019$month==i),]
  temp20 <- f2020[which(f2020$month==i),]
  aero[1,i] <- sum(rbind(temp19[,1], temp19[,2]), na.rm=TRUE)/(nrow(temp19)*2)
  aero[2,i] <- sum(rbind(temp20[,1], temp20[,2]), na.rm=TRUE)/(nrow(temp20)*2)
  no2[1,i] <- sum(temp19[,4], na.rm=TRUE)/nrow(temp19)
  no2[2,i] <- sum(temp20[,4], na.rm=TRUE)/nrow(temp20)
}

barplot(as.matrix(aero), names.arg=colnames(aero), beside=T, main="Average Aerosol Levels in Great Smoky Park", xlab="Month", col=c("#566456", "#798878"))
legend("topleft", inset=0.05,legend=c("2019", "2020"), col=c("#566456", "#798878"), pch=15, cex=0.8, bty="n", pt.cex=1.8)

barplot(as.matrix(no2), names.arg=colnames(no2), beside=T, main="Average NO2 Levels in Great Smoky Park", xlab="Month", col=c("#566456", "#798878"))
legend("topright",legend=c("2019", "2020"), col=c("#566456", "#798878"), pch=15, cex=0.8, pt.cex=1.8)




