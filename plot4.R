
## Files Required:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-----------------------------------#
##Question 4: emissions from coal combustion-related sources changed from 1999-2008 in USA

##Find "Coal" on SCC file and subset
sub <- grep('Coal',SCC$Short.Name, ignore.case = FALSE) 

CoalCodes <- SCC[sub,1]
CoalData <- subset(NEI, NEI$SCC %in% CoalCodes)
CoalEmission <- data.frame()
CoalEmission <- aggregate(CoalData$Emissions, by=list(CoalData$year), FUN=sum)
names(CoalEmission) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(CoalEmission, type = "o", pch = 18, cex=2, col = "darkgreen", main="Coal Combustion  Emissions in USA", lwd=3)

dev.copy(png,file="plot4.png",width = 480, height = 480)
dev.off()