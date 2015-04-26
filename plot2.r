library(dplyr)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 2
# summarise by year and filter to select Maryland
Emsn_yr_Mary = PM25Data %>% filter(fips=="24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions)) %>% arrange(year)
png("plot2.png")
with(Emsn_yr_Mary,{
     plot(year,Emissions, type="l", xlab="Year", ylab="PM2.5 Emissions (tons)", 
          main="Total PM2.5 Emissions in Baltimore City, Maryland, US")
     text(year,Emissions, round(Emissions, 0), cex=0.8, col="red")
})
dev.off()
