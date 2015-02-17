NEI <- readRDS("summarySCC_PM25.rds")


## Applaying sum to Emission grouped by year
res <- aggregate(NEI$Emission, by=list(Year=NEI$year),FUN=sum)

## Throwing a trend line in to show the pattern. Constructing the line. using x/1MM so it's more legible
model<- lm((x/1000000)~Year,res)

## Plotting without Y axis labels so they get formatted to be more legible. x/1000000 means that my Emission will show better
## in MM
with(res,plot(Year,x/1000000,main="Total PM2.5 Emmission From All Sources",ylab="Emission"), yaxt="n")
abline(model, lwd=2, col="red")

## Putting in the Y Axis labels
y.axis <-paste(axTicks(2),"MM",sep="")

axis(2,at=axTicks(2), labels=y.axis)


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()