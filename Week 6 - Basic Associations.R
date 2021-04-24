#---------------------------------------#
#------ Basic Associations -------------#
#---------------------------------------#

#### Step 1 : Preliminaries ####

#Packages
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(foreign)) install.packages("foreign")
if(!require(corrplot)) install.packages("corrplot")


library(rstudioapi)
library(foreign)
library(corrplot)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))

####Step 2: Loading data into R ####

politics_data <- read.dta("Data/qog_basic_cs.dta")

##### Step 3: Covariance of two variables ####

cov(pf_data$rsf_pfi, pf_data$fh_ipolity2, use= "complete.obs")


#### Step 4: Correlation of two variables ####

cor(pf_data$rsf_pfi, pf_data$fh_ipolity2, use= "complete.obs")


#### Correlation visualization for many variables ####

cor.matrix <- cor(politics_data[,c(10:25)], use = "complete.obs")
corrplot(cor.matrix, method = "ellipse")

