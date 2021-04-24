#------------------------------------------#
#---- Understanding dataset structure -----#
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


#### Step 2: Load Quality of government basic data ####

politics_data <- read.dta("Data/qog_basic_cs.dta")

# View the list of variables

colnames(politics_data)

# View a subset of variables and rows

head(politics_data[,c(1:10)], 10)

#### Step 3: Load Quality of government basic time series data ####

politics_ts_data <- read.dta("Data/qog_basic_ts.dta")

# View the list of variables

colnames(politics_ts_data)

# View a subset of variables and rows

head(politics_ts_data[,c(1:10)], 10)

#### Step 4: Load European Social Survey UK data ####

ess_uk <- read.dta("Data/ess_uk.dta")

# View the list of variables

colnames(ess_uk)

# View a subset of variables and rows

head(ess_uk[,c(1:4)], 10)

