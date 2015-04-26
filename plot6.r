library(dplyr)
library(ggplot2)
library(gridExtra)

# Read in the PM2.5 pollution data
source("..\\2. Code\\ReadData.r")

# Plot 6
motorVehicleComp = polData %>% filter(grepl("Mobile - On-Road",EI.Sector), grepl("Vehicles",EI.Sector), fips=="24510" | fips == "06037") %>% 
  group_by(year, fips) %>% 
  summarise(Emissions = sum(Emissions)) %>% 
  mutate(county = ifelse(fips=="24510","Baltimore City","California")) %>% 
  arrange(year, county)
# compute differences
minYear = min(motorVehicleComp$year)
maxYear = max(motorVehicleComp$year)
startVals = arrange(motorVehicleComp[motorVehicleComp$year==minYear,c("Emissions","county")], county)
endVals = arrange(motorVehicleComp[motorVehicleComp$year==maxYear,c("Emissions","county")],county)
# absolute diffs
absDiffs = startVals$Emissions - endVals$Emissions
# percent diffs
pctDiffs = 100 * absDiffs/startVals$Emissions
diffs = data.frame(county=startVals$county, absDiffs, pctDiffs)
# construct plots
png("plot6.png")
absolutes = qplot(x=county, y=absDiffs, data=diffs, stat="identity", geom="bar", xlab="County",ylab="Change in PM2.5 Emissions (tons)", main="Motor Vehicle PM2.5 Emission change (1999 to 2008)") + 
  geom_text(aes(label=round(absDiffs,0)), size=5, colour="red")
percentages = qplot(x=county, y=pctDiffs, data=diffs, stat="identity", geom="bar", xlab="County",ylab="% Change in PM2.5 Emissions", main="Motor Vehicle PM2.5 Emission % change (1999 to 2008)") + 
  geom_text(aes(label=round(pctDiffs,0)), size=5, colour="red")
grid.arrange(absolutes, percentages)
dev.off()


