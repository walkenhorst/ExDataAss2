# import the data
codeDefn = readRDS("Source_Classification_Code.rds")
PM25Data = readRDS("summarySCC_PM25.rds")
# combine the data
polData = merge(PM25Data, codeDefn, by.x="SCC",by.y="SCC")
