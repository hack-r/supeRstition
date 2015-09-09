# ============================================================================
# File        : supeRstition_data.R
# File Author : Jason D. Miller
# Copyright   : 2015 
# Description : Create some data objects used by supeRstition_function.R
# Repo URL    : https://github.com/hack-r/supeRstition.git
# ============================================================================


# Chinese Zodiac data -----------------------------------------------------
# Sources:
#         http://www.chinahighlights.com/travelguide/chinese-zodiac/
#         http://www.holymtn.com/astrology/year.htm
#         http://www.hko.gov.hk/gts/time/conversionc.htm
#         https://github.com/chainsawriot/sinodate

# 12 Zodiac Animals 
chineseAnimals         <- read.csv("data//chineseAnimals.csv", header = T) 
saveRDS(chineseAnimals, "data//chineseAnimals.RDS")


# It is widely known that each year is associated with a Chinese zodiac animal, 
#  but in Chinese culture the 12 zodiac animals are also associated with hours of a day.
# In ancient times, in order to tell the time, people divided a day into twelve 
#  2-hour periods, and designated an animal to represent each period, according to each animal’s "special time". 
# According to Chinese astrology, though not popularly used, a person’s 
#  personality and life is more decided by his/her birth hour than year. 
# The zodiac hour is widely used for character and destiny analysis. 
chineseAnimals.hours   <- read.csv("data//chineseAnimalsHours.csv", header = T)
chineseAnimals.hours   <- chineseAnimals.hours[1:2, ]  
chineseAnimals.hours   <- as.data.frame(sapply(chineseAnimals.hours, as.character))
chineseAnimals.hours   <- gsub("11pm", "23", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("9pm",  "21", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("7pm",  "19", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("5pm",  "17", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("3pm",  "15", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("1pm",  "13", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("11am", "11", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("9am",  "9", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("7am",  "7", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("5am",  "5", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("3am",  "3", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- gsub("1am",  "1", as.matrix(chineseAnimals.hours))
chineseAnimals.hours   <- as.data.frame(chineseAnimals.hours)
chineseAnimals.hours   <- sapply(chineseAnimals.hours, as.character)
hours.names            <- colnames(chineseAnimals.hours)
chineseAnimals.hours   <- as.data.frame(t(as.data.frame(apply(chineseAnimals.hours, 1, as.numeric))))

colnames(chineseAnimals.hours) <- hours.names
rownames(chineseAnimals.hours) <- c("Begin", "End")

saveRDS(chineseAnimals.hours, "data//chineseAnimals_hours.RDS")

# Lunar Chinese Zodiac calendar
lunarCal <- read.csv("data//lunarCal.csv", header = T, blank.lines.skip = T,
                     stringsAsFactors = F, strip.white = T)
lunarCal$START_DATE <- strptime(lunarCal$START_DATE, format = "%d-%b-%y", tz = "Asia/Chongqing")
lunarCal$END_DATE   <- strptime(lunarCal$END_DATE, format = "%d %b %Y", tz = "Asia/Chongqing")

for(i in 1:nrow(lunarCal)){
  if(lunarCal$ELEMENT[i] == "Metal"){lunarCal$PERSONALITY[i] <- "Fixity, strength of will, fluency of speech"} else if
    (lunarCal$ELEMENT[i] == "Water"){lunarCal$PERSONALITY[i] <- "Powers of reflection, sensitivity, persuasiveness"} else if
    (lunarCal$ELEMENT[i] == "Wood"){lunarCal$PERSONALITY[i]  <- "Imagination, creativity, idealism, compassion"} else if
    (lunarCal$ELEMENT[i] == "Fire"){lunarCal$PERSONALITY[i]  <- "Dynamism, passion, energy, aggression, leadership"} else if
    (lunarCal$ELEMENT[i] == "Fire"){lunarCal$PERSONALITY[i]  <- "Stability, reliability, practicality, industry, prudence"} 
}

saveRDS(lunarCal, "data//lunarCal.RDS")

# Solar Chinese Zodiac calendar
source("https://github.com/chainsawriot/hongkong/blob/master/R/lunarCal.R")
