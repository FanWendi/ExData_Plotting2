Baltimore <-summarise(group_by(filter(NEI, fips == "24510"), year), 
                      Emissions=sum(Emissions))

png(filename = "plot2.png")
x2<-barplot(Baltimore$Emissions, names=Baltimore$year,
            xlab="Year", ylab=expression('Total PM'[2.5]*' Emissions'),
            main=expression('Total PM'[2.5]*' Emissions in Baltimore City, Maryland Over Years'))
dev.off()