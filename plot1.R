
#File Required:
NEI <- readRDS("summarySCC_PM25.rds")


#-----------------------------------#
## Question 1 - total emmision from PM2.5 Decrrease in USA from 1999 to 2008

total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

plot(total.emissions, type = "o", pch = 18, cex=2, col = "blue", ylab = "Emissions", 
     xlab = "Year", main = "Annual Emissions")


dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()