#install.packages(c("ggplot2", "maps", "mapdata", "ggmap"))
library("maps")
library("ggplot2")
library("mapdata")
library("ggmap")

map(database="USAMapEvn")

#-84.9463,34.0137,-81.123,36.6504
smoky <- data.frame(matrix(ncol = 2))
smoky <- rbind(smoky, c(35.612, -83.49))#Smoky Park
smoky <- rbind(smoky, c(35.66, -82.623))#FBR
smoky <- rbind(smoky, c(35.248, -81.003)) #Catawba River
smoky <- rbind(smoky, c(35.23, -80.84))#Charlotte
smoky <- rbind(smoky, c(36.172, -86.778))#Nashville
smoky <- smoky[-1,]
rownames(smoky) <- c("Smoky Park", "French Broad River", "Catawba River", "Charlotte", "Nashville")

usa <- map_data("state")
usa_map <- ggplot() + geom_polygon(data=usa, aes(x=long, y=lat, group=group),
                        fill = "#9CAEA9", color = "#3F5e5A") +
                          coord_fixed(1.3) 

usa_map + theme_nothing() +
  coord_fixed(xlim = c(-90, -77), ylim = c(32, 39), ratio = 1.3) + 
  geom_point(data=smoky, aes(x=X2,y=X1), color="black", size=2.5) +
  geom_point(data=smoky[1,], aes(x=X2,y=X1), color="#657352", size=2) + 
  geom_text(data=smoky[1,], aes(x=X2,y=X1,label=rownames(smoky)[1]),
            nudge_x=-0.25, nudge_y = 0.3, size = 3)+
  geom_point(data=smoky[2:3,], aes(x=X2,y=X1), color="#3C7B74", size=2) + 
  geom_text(data=smoky[2:3,], aes(x=X2,y=X1,label=rownames(smoky)[2:3]),
            nudge_x=0, nudge_y = -0.3, size = 3) +
  geom_point(data=smoky[4:5,], aes(x=X2,y=X1), color="#343434", size=2) +
  geom_text(data=smoky[4:5,], aes(x=X2,y=X1,label=rownames(smoky)[4:5]),
            nudge_x=1, nudge_y = 0, size = 3)+
  theme(legend.title=element_blank(), legend.position="bottom")+
  scale_fill_manual(values=c("#657352", "#3C7B74","#343434"),
                    labels=c("Great Smoky Park", "Rivers", "Cities"))


#to cite:
# D. Kahle and H. Wickham. ggmap: Spatial Visualization with ggplot2.
# The R Journal, 5(1), 144-161. URL
# http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf