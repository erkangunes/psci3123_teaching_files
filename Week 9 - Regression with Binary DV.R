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


library(rstudioapi)
library(foreign)
library(ggplot2)
library(stargazer)
library(knitr)

#Set working directory
this_files_path <- getActiveDocumentContext()$path
setwd(dirname(this_files_path))


#### Step 2: Loading data into R ####

politics_data <- read.dta("Data/qog_basic_cs.dta")


#### Step 3: Visualization of association ####

# Is Chief executive a military officer? 

ggplot(politics_data, aes(x = fh_ipolity2, y = dpi_cemo)) +
  geom_point(size=1) + 
  geom_smooth(method=lm)


#### Step 4: Running Logit Regression with a binary DV ####

#Bivariate regression
m1_logit <- glm(dpi_cemo ~ fh_ipolity2, data = politics_data, family = "binomial")
summary(m1_logit)
coef(summary(m1_logit))

#Multivariate regression 1
m2_logit <- glm(dpi_cemo ~ fh_ipolity2 + wdi_afp, data = politics_data, family = "binomial")
summary(m2_logit)

#Multivariate regression 2
m3_logit <- glm(dpi_cemo ~ fh_ipolity2 + wdi_afp + bti_ci, data = politics_data, family = "binomial")
summary(m3_logit)


#### Step 5 : Calculating predicted values ####

newdata1 <- data.frame(fh_ipolity2 = c(1:10), wdi_afp = 1.25, bti_ci = 5)
kable(newdata1)

newdata1$fh_ipolity_predict <- predict(m3_logit, newdata1, type = "response")
kable(newdata1)


#### Step 6 : Exporting results ####

stargazer(m3_logit, type = "text")

