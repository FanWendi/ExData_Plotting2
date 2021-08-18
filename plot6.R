library(ggplot)
library(dplyr)
Baltimore <-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), 
                               Emissions=sum(Emissions))
LA <-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), 
                        Emissions=sum(Emissions))

Baltimore$County <- "Baltimore City, MD"
LA$County <- "Los Angeles County, CA"
Both <- rbind(Baltimore, LA)

png(filename = "plot6.png")
ggplot(Both, aes(x=factor(year), y=Emissions, fill=County)) +
    geom_bar(stat="identity") + 
    facet_grid(.~County) +
    ylab(expression("Total PM"[2.5]*" Emissions")) + 
    xlab("Year") +
    ggtitle(expression("Motor Vehicle Emission in Baltimore and Los Angeles"))
dev.off()