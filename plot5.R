library(ggplot2)
library(dplyr)
Emissions_motor <-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Emissions_motor_byyear <- summarise(group_by(Emissions_motor, year), 
                                    Emissions=sum(Emissions))

png(filename="plot5.png")
ggplot(Emissions_motor_byyear, aes(x=factor(year), y=Emissions, fill=year)) +
    geom_bar(stat="identity") +
    xlab("Year") +
    ylab(expression("Total PM"[2.5]*" Emissions")) +
    ggtitle("Emissions from Motor Vehicle Sources in Baltimore City Over Years")
dev.off()