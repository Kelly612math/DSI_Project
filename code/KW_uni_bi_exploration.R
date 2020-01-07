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


# set up -------------------------------------------------------------------

# import packages
library(tidyverse)

# set working directory
setwd("C:/Users/willka06/Desktop/AU_DSci_Institute/classrepo/class-final-proj/data")

# load data
gss_cat <- read.csv("GSS_categoricals.csv")

# create vector containing variables of interest
kw_vars <- c("Respondent.id.number", "Hours.per.day.watching.tv", "Happiness.of.marriage", 
             "General.happiness", "Marital.status", "Number.of.children")

# subset to varibles of interest
gss <- gss_cat[kw_vars]

# rename to shorter column names
short_names <- c("id_", "tvhours", "hapmar", "happy", "marital", "childs")
names(gss) <- short_names

# convert id_ to character
gss$id_ <- as.character()

# convert tvhours to numerical
gss$tvhours <- as.numeric(as.character(gss$tvhours))

# size of data
dim(gss)


# brief univariate familiarity --------------------------------------------

# is there missing data, if so how much?
sum(is.na(gss$i))

# counts of all values of variable
table(gss$i, useNA = "always")

# descriptive stats
min(gss$i, na.rm = TRUE)
max(gss$i, na.rm = TRUE)
mean(gss$i, na.rm = TRUE)
median(gss$i, na.rm = TRUE)
sd(gss$i, na.rm = TRUE)



# loop attempt ------------------------------------------------------------





for (i in short_names){
  # uat
  print(i)
  
  # is there missing data, if so how much?
  sum(is.na(gss$i))

  # counts of all values of variable
  table(gss$i, useNA = "always")

  # descriptive stats
  min(gss$i, na.rm = TRUE)
  max(gss$i, na.rm = TRUE)
  mean(gss$i, na.rm = TRUE)
  median(gss$i, na.rm = TRUE)
  sd(gss$i, na.rm = TRUE)
}

  # bar graph
  b <- ggplot(gss, aes(gss$i))
  print(b + geom_bar())
}



