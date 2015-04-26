library(dplyr)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 1
# summarise by year
Emsn_year = PM25Data %>% group_by(year) %>% summarise(Emissions = sum(Emissions)) %>% arrange(year)
png("plot1.png")
with(Emsn_year,{
  plot(year,Emissions, type="l", xlab="Year", ylab="PM2.5 Emissions (tons)", main="Total PM2.5 Emissions in the US")
})
dev.off()
