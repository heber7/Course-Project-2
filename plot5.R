
# Files Required:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-----------------------------------#
##Question 5: Motor Vehicles Emissions in Baltimore (1999-2008)

Baltimore <- NEI[NEI$fips == "24510", ]

##Find "Coal" on SCC file and subset
sub1 <- grep("Vehicles",SCC$Short.Name, ignore.case = FALSE)


VehiclesCodes <- SCC[sub1,1]
VehiclesData <- subset(Baltimore, Baltimore$SCC %in% VehiclesCodes)
VehiclesEmission <- data.frame()
VehiclesEmission <- aggregate(VehiclesData$Emissions, by=list(VehiclesData$year), FUN=sum)
names(VehiclesEmission) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(VehiclesEmission, type = "o",pch = 20, cex=2, col = "darkblue", main="MV  Emissions in Baltimore (1999-2008)", lwd=3)

dev.copy(png,file="plot5.png",width = 480, height = 480)
dev.off()