library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)

# pull data
gss = read_csv("GSS_categoricals.csv")

# Data manipulation------------------------------------------------------

# isolate variables of choice
gss_jg = gss[,c("Identifier", "Hours per day watching tv", "Highest year of school completed", "Diploma, ged, or other", "Labor force status", "Respondents income")]

# rename columns
names(gss_jg) = c("id", "tvhours", "highest_yr_school", "diploma", "labor", "inc")

# convert chr variables to numeric
gss_jg$tvhours = as.numeric(gss_jg$tvhours)
gss_jg$highest_yr_school= as.numeric(gss_jg$highest_yr_school)

# change order of levels in factor variable
gss_jg$diploma = factor(gss_jg$diploma, levels = c("Don't know", "Not applicable", "Hs diploma after post hs classes",
                                                   "Ged", "High school diploma", "Other"))

# frequency table with NA values
table(gss_jg$inc, useNA = "always")

# aggregated table with group calculation (number var, group var, function)
aggregate(gss_jg$highest_yr_school, list(gss_jg$diploma), FUN=mean, na.rm = TRUE)


# Visualizations------------------------------------------------------

# histogram for numeric values
ggplot(gss_jg, aes(highest_yr_school))+
  geom_histogram()

# change bins of histogram
ggplot(gss_jg, aes(highest_yr_school))+
  geom_histogram(breaks=seq(0, 20, by=2))

# bar chart for categorical values
ggplot(gss_jg, aes(labor))+
  geom_bar()

# rotate x labels 45 degrees and move down by 1 unit
ggplot(gss_jg, aes(labor))+
  geom_bar()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# scatter plot
ggplot(gss_jg, aes(x = tvhours, y = highest_yr_school))+
  geom_point()

# add regression line with confidence interval
ggplot(gss_jg, aes(x = tvhours, y = highest_yr_school))+
  geom_point()+
  geom_smooth(method="lm", se=TRUE, fullrange=FALSE, level=0.95)

# box and whisker plot
ggplot(gss_jg, aes(x = labor, y = tvhours))+
  geom_boxplot()

# flip coordinates
ggplot(gss_jg, aes(x = labor, y = tvhours))+
  geom_boxplot()+
  coord_flip()


