
#File Required:
NEI <- readRDS("summarySCC_PM25.rds")


#-----------------------------------#
## Question 2 - total emmision from PM2.5 Decrrease in Baltimore City from 1999 to 2008


Baltimore <- NEI[NEI$fips == "24510", ]
BaltimoreCity <- tapply(Baltimore$Emissions, Baltimore$year, sum)


plot(BaltimoreCity, type = "o", pch = 18, cex=2, col = "purple", ylab = "Emissions", 
     xlab = "Year", main = "Emissions: Baltimore City")


dev.copy(png,file="plot2.png",width = 480, height = 480)
dev.off()