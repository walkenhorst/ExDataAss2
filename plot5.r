library(dplyr)
library(ggplot2)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 5
motorVehiclePolution = polData %>% filter(grepl("Mobile - On-Road",EI.Sector), grepl("Vehicles",EI.Sector), fips=="24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
#polData %>% filter(grepl("Mobile - On-Road",EI.Sector), grepl("Vehicles",EI.Sector), fips=="24510") %>% select(EI.Sector) %>% distinct() %>% arrange()
png("plot5.png")
qplot(year, Emissions, data=motorVehiclePolution, geom="line",xlab="Year",ylab="PM2.5 Emissions (tons)", main="Total Motor Vehicle PM2.5 Emissions in Baltimore City (USA)") + 
  geom_text(aes(label=round(Emissions,0)), size=4, hjust=0, vjust=0)
dev.off()
