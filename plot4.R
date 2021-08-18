combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
Combine <- (combustionRelated & coalRelated)
combustionSCC <- SCC[Combine,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC, ]

png(filename = "plot4.png")
ggplot(combustionNEI,aes(x = factor(year), y = Emissions, fill = year)) +
    geom_bar(stat="identity") +
    labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + 
    ggtitle(expression("PM"[2.5]*" from Coal Combustion-Related Sources Across US"))
dev.off()