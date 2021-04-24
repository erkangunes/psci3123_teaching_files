#-----------------------------------------------#
#----- Linear Regression - Binary/Dummy DV -----#
#-----------------------------------------------#

#### Step 1 : Preliminaries ####

#Packages
if(!require(rstudioapi)) install.packages("rstudioapi")
if(!require(foreign)) install.packages("foreign")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(stargazer)) install.packages("stargazer")
if(!require(knitr)) install.packages("knitr")
if(!require(nnet)) install.packages("nnet")
if(!require(MASS)) install.packages("MASS")



library(rstudioapi)
library(foreign)
library(ggplot2)
library(stargazer)
library(knitr)
library(nnet)
library(MASS)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))


#### Step 2: Loading data into R ####

politics_data <- read.dta("Data/qog_basic_cs.dta")


#### Step 3: Exploring Data (Nominal DV) ####

#Electoral system and type of government

kable(table(politics_data$cpds_tg, politics_data$gol_est))


#### Step 4: Running regression with a nonbinary nominal variable ####

#Preparing data for multinomial regression analysis

politics_data$cpds_tg_r = relevel(politics_data$cpds_tg, ref = "Single-party majority government")

#Running multinomial regression and generating results

m1_mnom <- multinom(cpds_tg ~ gol_est + fh_ipolity2, data = politics_data)
summary(m1_mnom)
stargazer(m1_mnom, type = "text")

#Calculating predicted probabilities 
newdata_nom <- data.frame(fh_ipolity2 = 7, gol_est = c("Majoritarian", "Proportional", "Mixed"))
kable(newdata_nom)
newdata_nom$cpds_tg_predict <- predict(m1_mnom, newdata_nom, type="probs")
kable(newdata_nom)


#### Step 5: Exploring Data (Ordinal DV) ####

# Socio-economic barriers and commitment to democratic institutions
table(politics_data$bti_cdi, politics_data$bti_seb)


#### Step 6 : Running regression with Ordinal DV ####

#Preparing data for multinomial regression analysis
politics_data$bti_cdi <- as.factor(politics_data$bti_cdi)

#Running ordinal logit regression and generating results
m1_ord <- polr(bti_cdi ~ bti_seb + al_ethnic + wdi_gert, data=politics_data, Hess = TRUE)
summary(m1_ord)
stargazer(m1_ord, type = "text")


#Calculating predicted probabilities and outcomes
newdata_ord <- data.frame(bti_seb = c(1:10), al_ethnic = 0.45, wdi_gert = 38)
kable(newdata_ord)
newdata_ord$bti_seb_predict <- predict(m1_ord, newdata_ord, type="probs")
kable(newdata_ord)
newdata_ord$bti_seb_predict <- predict(m1_ord, newdata_ord, type="class")
kable(newdata_ord)
