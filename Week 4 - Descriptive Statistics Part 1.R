#-----------------------------------------#
#---- Descriptive Statistics - Part 1 ----#
#-----------------------------------------#

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


#### Step 3: Generating basic descriptive statistics for all variables ####

summary(politics_data)


#### Step 4: Create a subset of the dataset that only includes DV and IV and generate descriptive statistics ####

pf_data <- politics_data[ , c("cname", "rsf_pfi", "fh_ipolity2")]

summary(pf_data)

#### Step 5: Generating descriptive statistics for an array of ten random integers ####

set.seed(100)
s <- rpois(11,5)


#### Step 6: Calculating the mean of the integers stored in variable "s"

#the hard way
sum(s)/length(s)


#the easy way
mean(s)


## Finding the median value of "s"

#the hard way
s <- sort(s)
s[length(s)/2 + 1]


#the easy way
median(s)
