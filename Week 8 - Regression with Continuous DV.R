#---------------------------------------------#
#----- Linear Regression - Continuous DV -----#
#---------------------------------------------#

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

# Military spending and political stability
cov(politics_data$wdi_expmil, politics_data$wbgi_pve, use = "complete.obs")

cor(politics_data$wdi_expmil, politics_data$wbgi_pve, use = "complete.obs")

ggplot(politics_data, aes(x = wdi_expmil, y = wbgi_pve)) +
  geom_point(size=1) + 
  geom_smooth(method=lm)

# State legitimacy and voter turnout

cov(politics_data$ffp_sl, politics_data$cpds_vt, use = "complete.obs")

cor(politics_data$ffp_sl, politics_data$cpds_vt, use = "complete.obs")

ggplot(politics_data, aes(x = ffp_sl, y = cpds_vt)) +
  geom_point(size=1) + 
geom_smooth(method=lm)


#### Step 4 : Running an OLS regression with a continuous DV ####

# Military spending and political stability

m1_ps <- lm(wbgi_pve ~ wdi_expmil, data = politics_data)
summary(m1_ps)

m1_me <- lm(wdi_expmil ~ wbgi_pve, data = politics_data)
summary(m1_me)

m2_ps <- lm(wbgi_pve ~ wdi_expmil + gle_cgdpc , data = politics_data)
summary(m2_ps)

m3_ps <- lm(wbgi_pve ~ wdi_expmil + gle_cgdpc + fh_ipolity2 , data = politics_data)
summary(m3_ps)
coef(summary(m3_ps))

# State legitimacy and voter turnout

m1_vt <- lm(cpds_vt ~ ffp_sl, data = politics_data)
summary(m1_vt)

m1_sl <- lm(ffp_sl ~ cpds_vt, data = politics_data)
summary(m1_sl)

m2_vt <- lm(cpds_vt ~ ffp_sl + gle_cgdpc , data = politics_data)
summary(m2_vt)

m3_vt <- lm(cpds_vt ~ ffp_sl + gle_cgdpc + fh_ipolity2 , data = politics_data)
summary(m3_vt)
coef(summary(m3_vt))


#### Step 5 : Calculating predicted values ####

#the hard way

-1.143354e+00 + -2.546870e-02*2 + 3.225602e-05*5000 + 9.086966e-02*7

-1.143354e+00 + -2.546870e-02*2 + 3.225602e-05*50000 + 9.086966e-02*7


#the easier way
newdata = data.frame(wdi_expmil=2, gle_cgdpc = c(5000, 10000, 20000, 50000), fh_ipolity2 = 7)
newdata$gle_cgdpc_predict <- predict(m3_ps, newdata = newdata, type= "response")
kable(newdata)

#### Step 6 : Exporting Regression Results ####

stargazer(m3_ps, type = "text")
stargazer(m3_vt, type = "text")

#Exporting multiple models in a single table
stargazer(m3_ps, m3_vt, type = "text")


