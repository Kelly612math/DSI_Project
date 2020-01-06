# The purpose of this script is to explore variables for the AU DSci Project, 
# and to compare them with the dependent varaiable
# Kate Williams 01/06/2020

'
Variables of interest
Dependent - Hours per day watching tv
Independent - Happiness of marriage 
  General happiness
  Marital status
  Number of children
'

# import packages
library(tidyverse)

# load data
gss_cat <- read.csv("GSS_categoricals.csv")

# create vector containing variables of interest
kw_vars <- c("Respondent.id.number", "Hours.per.day.watching.tv", "Happiness.of.marriage", 
             "General.happiness", "Marital.status", "Number.of.children")

# subset to varibles of interest
gss <- gss_cat[kw_vars]

# rename to shorter column names

