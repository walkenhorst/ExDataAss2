library(dplyr)
library(ggplot2)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 4
coalPolution = polData %>% filter(grepl("Fuel Comb",EI.Sector), grepl("Coal",EI.Sector) | grepl("Coal",SCC.Level.Three) | grepl("Coal",SCC.Level.Four)) %>% group_by(year) %>% summarise(Emissions = sum(Emissions)) %>% arrange(year)
#temp = distinct(select(polData,EI.Sector,SCC.Level.Three,SCC.Level.Four))
png("plot4.png")
qplot(year, Emissions, data=coalPolution, geom="line",xlab="Year",ylab="PM2.5 Emissions (tons)", main="Total Coal Combustion PM2.5 Emissions in USA") + 
  geom_text(aes(label=round(Emissions,0)), size=4, hjust=0, vjust=0)
dev.off()
