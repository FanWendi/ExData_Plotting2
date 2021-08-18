totalNEI <- summarise(group_by(NEI, year), Emissions=sum(Emissions))

png(filename = "plot1.png")
barplot(totalNEI$Emissions, names = totalNEI$year, xlab = "Year",
        ylab = expression('Total PM' [2.5]* ' Emissions'),
        main = expression('Total PM'[2.5]* ' Emissions Over Years'))
dev.off()