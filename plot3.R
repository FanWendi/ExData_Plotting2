library(ggplot2)
BaltimoreCity <- summarise(group_by(filter(NEI, fips == "24510"), year,type), 
                           Emissions=sum(Emissions))

png(filename="plot3.png")
ggplot(BaltimoreCity, aes(factor(year), Emissions, fill=type)) +
    facet_grid(.~type) +
    geom_bar(stat="identity") + 
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) +
    labs(main = expression("PM"[2.5]*" Emissions, Baltimore City, Maryland"))
dev.off()