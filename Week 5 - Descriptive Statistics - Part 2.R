#-----------------------------------------#
#---- Descriptive Statistics - Part 2 ----#
#-----------------------------------------#

#### Step 1 : Preliminaries ####

#Packages
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(foreign)) install.packages("foreign")
if(!require(pastecs)) install.packages("pastecs")


library(rstudioapi)
library(foreign)
library(pastecs)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))


#### Step 2: Loading Quality of Government basic data ####

politics_data <- read.dta("Data/qog_basic_cs.dta")

#### Step 3 : Generating descriptive statistics of a set of ten random integers ####

set.seed(100)
s <- rpois(11,5)

#### Step 4 : Calculating sample variance #####

#the hard way

sum((s-mean(s))^2)/(length(s)-1)

#the easy way

var(s)


#### Step 5: Calculating Standard Deviation ####

#the hard way

sqrt(sum((s-mean(s))^2)/(length(s)-1))

# the easy way 

sd(s)


#### Step 6: Descriptive statistics using the pastecs package ####

stat.desc(s)



