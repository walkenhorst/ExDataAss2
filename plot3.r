library(dplyr)
library(ggplot2)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 3
Emsn_yr_tp_Mary = PM25Data %>% filter(fips=="24510") %>% group_by(year, type) %>% summarise(Emissions = sum(Emissions)) %>% arrange(year, type)
png("plot3.png")
qplot(year, Emissions, data=Emsn_yr_tp_Mary, colour=type, geom="line", xlab="Year",ylab="PM2.5 Emissions (tons)", main="Total PM2.5 Emissions in Baltimore City (USA) by Source Type") + 
 geom_text(aes(label=round(Emissions,0)), size=4, hjust=0, vjust=0)
dev.off()
