
##File Required:
NEI <- readRDS("summarySCC_PM25.rds")


#-----------------------------------#
## Question 3 - four sources have been decreases in emissions from 1999-2008 for Baltimore City

Baltimore <- NEI[NEI$fips == "24510", ]

#call required Library
library(ggplot2)


##Aggregate emission by year 

emi24510 <- aggregate(Emissions ~ type * year, data = Baltimore, 
                      FUN = sum)

## Setup ggplot
df24510 <- qplot(y = Emissions, x = year, data = emi24510, color = type)

## Add layers
df24510 + scale_x_continuous(breaks = seq(1999, 2008, 3)) + theme_grey() + geom_point(size = 3) + 
  geom_line() + labs(y = expression("Total Emission " * PM[2.5])) + 
  labs(x = "Year") + labs(title = expression("Total " * PM[2.5] * " Emissions by Type in Baltimore (1999 - 2008)")) + 
  theme(axis.text = element_text(size = 8), axis.title = element_text(size = 14), 
        plot.title = element_text(vjust = 2), 
        legend.title = element_text(size = 12)) + scale_colour_discrete(name = "Pollutant Type")

dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()