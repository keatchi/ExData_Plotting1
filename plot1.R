electricity <-read.table("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,header=T, sep=";");
electricity$Date<-as.Date(electricity$Date,"%d/%m/%Y");
electricity$Time <- strptime(electricity$DateTime,"%Y-%m-%d %H:%M:%S");
subelec<- electricity[(electricity$Date=="2007-02-01"|electricity$Date=="2007-02-02"),];
rm(electricity);
png("plot1.png");
hist(as.numeric(subelec$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red");
dev.off();