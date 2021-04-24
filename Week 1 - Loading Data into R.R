#------------------------------------------#
#------ Week 1 - Loading Data into R ------#
#------------------------------------------#


#### Step 1 : Preliminaries ####

#Packages
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(foreign)) install.packages("foreign")

library(rstudioapi)
library(foreign)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))


#### Step 2: Loading data into R ####

politics_data <- read.dta("Data/qog_basic_cs.dta")


#### Step 3: Viewing the first 100 values of select variables from the politics dataset ####

politics_data$cname[1:100]

politics_data[1:100,c("cname","imf_inv", "imf_rev")]

head(politics_data[,c("cname","imf_inv", "imf_rev")], 100)



#### Step 4: Adding a new variable to the politics dataset ####

politics_data$imf_inv_rev <- politics_data$imf_inv + politics_data$imf_rev



#### Step 5: Saving the dataset to the working directory #### 

write.dta(politics_data, file = "politics_data.dta")
