#------------------------------------------#
#-------- Understanding variables ---------#
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


#### Step 2: Loading Quality of Government basic data ####

politics_data <- read.dta("Data/qog_basic_cs.dta")


##### Step 3: Finding dependent variable within the dataset and visualizing its distribution ####

politics_data[1:100,c("cname", "rsf_pfi")]

hist(politics_data$rsf_pfi)


##### Step 4: Finding independent variable(s) within the dataset and visualizing its distribution #######

politics_data[1:100,c("cname", "fh_ipolity2")]

hist(politics_data$fh_ipolity2)


#### Step 5 : Create a subset of the dataset that only includes DV and IV ####

#Political freedoms (pf) data
pf_data <- politics_data[ , c("cname", "rsf_pfi", "fh_ipolity2")]


