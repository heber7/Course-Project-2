
##Files Required:
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#-----------------------------------#
##Question 6: Motor Vehicles Emissions in Baltimore & Los Angeles comparison (1999-2008)

library(ggplot2)

Baltimore <- NEI[NEI$fips == "24510", ]
LAC <- NEI[NEI$fips == "06037", ]

CombCounty<-rbind(Baltimore,LAC)


# yearly totals
YearlyComparison <- aggregate(Emissions ~ fips * year, data = CombCounty, FUN = sum )

# Assign location names to variable
YearlyComparison$county <- ifelse(YearlyComparison$fips == "06037", "Los Angeles", "Baltimore")


# png("plot6.png", width = 800, height = 480)
qplot(year, Emissions, data = YearlyComparison, color = county, size = Emissions)+ geom_line(size = 1) + geom_point( size=4, shape=21, fill="white")+ ggtitle("MV  Emissions: Baltimore/LA (1999-2008)") + xlab("Year") + ylab("PM2.5 Emissions in Tons")


dev.copy(png,file="plot6.png",width = 480, height = 480)
dev.off()