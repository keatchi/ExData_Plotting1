electricity <-read.table("household_power_consumption.txt",na.strings="?",stringsAsFactors=FALSE,header=T, sep=";");
electricity$Date<-as.Date(electricity$Date,"%d/%m/%Y");
electricity$DateTime <- paste(electricity$Date,electricity$Time);
electricity$OldTime <- electricity$Time;
electricity$Time <- strptime(electricity$DateTime,"%Y-%m-%d %H:%M:%S");
subelec<- electricity[(electricity$Date=="2007-02-01"|electricity$Date=="2007-02-02"),];
rm(electricity);
subelec$Global_active_power<-as.numeric(subelec$Global_active_power);
subelec$Global_reactive_power<-as.numeric(subelec$Global_reactive_power);
subelec$Global_intensity<-as.numeric(subelec$Global_intensity);
subelec$Voltage<-as.numeric(subelec$Voltage);
subelec$Sub_metering_1<-as.numeric(subelec$Sub_metering_1);
subelec$Sub_metering_2<-as.numeric(subelec$Sub_metering_2);
subelec$Sub_metering_3<-as.numeric(subelec$Sub_metering_3);
png("plot4.png");
par(mfcol=c(2,2));
plot(subelec$Time , subelec$Global_active_power,type="l", xlab="",ylab="Global Active Power");
plot(subelec$Time , subelec$Sub_metering_1,type="l", xlab="",ylab="Energy sub metering");
lines(subelec$Time, subelec$Sub_metering_2,col="red");
lines(subelec$Time, subelec$Sub_metering_3,col="blue");
legend("topright",lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"));
plot(subelec$Time , subelec$Voltage,type="l", xlab="datetime",ylab="Voltage");
plot(subelec$Time , subelec$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power");
dev.off();



