#--------------------------------------------#
#------ Understanding Variable Types --------#
#--------------------------------------------#

#### Step 1 : Preliminaries ####

#Packages
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(foreign)) install.packages("foreign")
if(!require(ggplot2)) install.packages("ggplot2")


library(rstudioapi)
library(foreign)
library(ggplot2)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))


####Step 2: Loading data into R ####

politics_data <- read.dta("Data/qog_basic_cs.dta")


#### Step 3: Exploring different types of variables ####

#Continuous

head(politics_data[,c("cname", "gle_cgdpc")], 10)

politics_data$gle_cgdpc_2 <- as.numeric(politics_data$gle_cgdpc/1000)

hist(politics_data$gle_cgdpc_2, main="Frequency distribution of GDP Per Capita", 
     xlab="GDP Per Capita", border="blue", 
     col="green", las=1, breaks=50)

politics_data$gle_cgdpc_log <- log(politics_data$gle_cgdpc)

hist(politics_data$gle_cgdpc_log, main="Frequency distribution of GDP Per Capita", 
     xlab="GDP Per Capita", border="blue", 
     col="green", las=1, breaks=50)


#Categorical

head(politics_data[,c("cname", "lp_legor")], 10)

ggplot(politics_data, aes(x=lp_legor)) +
  geom_bar()


#Ordinal

head(politics_data[,c("cname", "fh_fog")], 10)

ggplot(politics_data, aes(x= fh_fog)) +
  geom_bar()


#Discrete

head(politics_data[, c("atop_number")], 10)




