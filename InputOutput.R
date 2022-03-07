require(pryr)
require(ISLR)
require(boot)
library(data.table)
library(plyr)

#import dataset
student <- read.table("Assignment6Dataset.txt", header = TRUE, sep = ",")
head(student)


#ran ddply function to segment data by gender and then calculate the mean grade by gender
grade_by_sex = ddply(student,"Sex",transform,Grade.Average=mean(Grade))
sex = student$Sex
grade_by_sex

#filtered data set to only show students with "i" in their name
write.table(grade_by_sex, "gender_by_sex")
i_data <- subset(student,grepl("i",student$Name,ignore.case=T))
i_data

#write the data to a CSV file
write.table(i_data,"DataSubset_i_Students.csv", sep =",", row.names = F)
