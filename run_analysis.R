#Step 0  -  Load necessary packages
	require("R.utils")
	require("stringr")
	require("dplyr")
	require("sqldf")

#Step 1 (optional) -  Download and unzip
#Download the zip file  and store in the "file" object. Unzip the file and store in the working directory

	#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	#file <- "downloaded_data.zip"
	#download.file(url, file)
	#unzip(file, exdir = ".")

#Step 2 - Read and subset features
#Read features from file "./UCI HAR Dataset/features.txt" into data.frame and subset all rows which in 
#the second column contains string "std()" or "mean()" (measurements on the mean and standard deviation
# for each measurement)

	featured_data<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE,sep = "")
	featured_out<-featured_data[str_detect(featured_data[,2],fixed("std()", ignore_case = FALSE))|str_detect(featured_data[,2],fixed("mean()", ignore_case = FALSE)),]
	featured_out[,1]<-as.numeric(featured_out[,1])
	colums_nr<-as.vector(as.numeric(featured_out[,1]))
	names_feat<-as.vector(featured_out[,2])

#Step 3 – Load, subset and Merge train and test data
#Load train ( file "./UCI HAR Dataset/train/X_train.txt") and test (file "./UCI HAR Dataset/test/X_test.txt") 
# data with measurements into data.frames. Subset only columns extracted in STEP 2 and merge this two data.frames into one (by rows)
#Load train ( file "./UCI HAR Dataset/train/Y_train.txt"and test (file "./UCI HAR Dataset/test/Y_test.txt") 
# data with activity into data.frames. Merge this two data.frames into one (by rows)
#Load train ( file "./UCI HAR Dataset/train/subject_train.txt" and test (file "./UCI HAR Dataset/test/subject_test.txt") 
# data with subjects into data.frames. Merge this two data.frames into one (by rows)

	dane_Tr_X_tmp <- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE,sep = "")
	dane_Tr_Y <- read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE,sep = "")
	dane_Tr_X<-dane_Tr_X_tmp[,colums_nr]
	subject_Tr<- read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE,sep = "")
	
	dane_Te_X_tmp <- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE,sep = "")
	dane_Te_Y <- read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE,sep = "")
	dane_Te_X<-dane_Te_X_tmp[,colums_nr]
	subject_Te<- read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE,sep = "")
	
	dane_T_X<-rbind(dane_Te_X,dane_Tr_X)
	dane_T_Y<-rbind(dane_Te_Y,dane_Tr_Y)
	subject_T<-rbind(subject_Te,subject_Tr)
	
#Step 4 – Replace activity represented in data.frame by numbers with names.
#Load file with activity names and related numbers (file "./UCI HAR Dataset/activity_labels.txt”). Using 
# it replace activity numbers with names in the data.frame with activity data.

	dict_activity<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE,sep = "")
	dane_T_Y$V1<-as.numeric(dane_T_Y$V1)
	dict_activity$V1<-as.numeric(dict_activity$V1)
	dane_activity<-sqldf("
	      select 
	      b.V2
	      from 
	      dane_T_Y a,dict_activity b
	      where a.V1=b.V1
	      ")

#Step 5 – Merge into one data.frame
#Merge (by columns)  data.frames with activity, subjects, measurements into one data.frame. Set proper columns names.

	dane_sub_act<-cbind(dane_activity,subject_T)
	colnames(dane_T_X)<-names_feat
	colnames(dane_sub_act)<-c("activity","Subject_nr")
	dane_T_XY<-cbind(dane_sub_act,dane_T_X)


#Step 6 – Aggregate
#Aggregate data.frame from step 5. Group data by activity, subject. Calculate average of all measurements. 
# Alter names of this measurements into a new ones. 

	grupowanie <- group_by(dane_T_XY,activity,Subject_nr)
	Result<-summarise_each(grupowanie,funs(mean),3:68)
	Result<-Result[order(Result$Subject_nr,Result$activity),]
	xxx<-paste(paste("avg_of(",colnames(Result[3:68]),sep=""),")",sep="")
	new_names<-c("activity","Subject_nr",xxx)
	colnames(Result)<-new_names
	

#Step 7 – Save output
#Write output from Step 6 into text file "project_result.txt"

	write.table(Result,"project_result.txt",row.name=FALSE)   


#Step 8 – Remove all, declared  in script, new objects 
	remove(Result)
	remove(xxx)
	remove(dane_T_XY)
	remove(dane_sub_act)
	remove(dane_T_X)
	remove(dane_activity)
	remove(subject_T)
	remove(dane_T_Y)
	remove(dane_Te_X)
	remove(dane_Te_X_tmp)
	remove(dane_Te_Y)
	remove(dane_Tr_X)
	remove(dane_Tr_X_tmp)
	remove(dane_Tr_Y)
	remove(dict_activity)
	remove(featured_data)
	remove(featured_out)
	remove(grupowanie)
	remove(subject_Te)
	remove(subject_Tr)
