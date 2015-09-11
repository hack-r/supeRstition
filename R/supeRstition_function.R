# ============================================================================
# File        : supeRstition_function.R
# File Author : Jason D. Miller
# Copyright   : 2015 
# Description : Function to generate astrological/horoscope data from birth date
# Repo URL    : https://github.com/hack-r/supeRstition.git
# ============================================================================
cat("Welcome to supeRstition!")
cat(" ")
cat("Please make sure that birthday inputs are in YYYY-MM-DD format")
cat(" ")
install.packages("lubridate")
require(lubridate)

chineseAnimals       <- readRDS("data/chineseAnimals.RDS")
chineseAnimals.hours <- readRDS("data/chineseAnimals_hours.RDS")
lunarCal             <- readRDS("data/lunarCal.RDS")
western.data         <- readRDS("data/western_data.RDS")

eastern.profile <- function(birthday){
    good                 <- is.na.POSIXlt(birthday)
    if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
    ind                  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
    temp                 <- subset(lunarCal, ind)
    return(temp)
}

eastern.personality <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  ind                  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  personality          <- subset(lunarCal$PERSONALITY, ind)
  return(personality)
}

eastern.aspect <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  ind                  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  aspect               <- subset(lunarCal$ASPECT, ind)
  return(aspect)
}

eastern.animal <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  ind                  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  animal               <- subset(lunarCal$ANIMAL, ind)
  return(animal)
}

eastern.element <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  ind                  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  element              <- subset(lunarCal$ELEMENT, ind)
  return(element)
}

western.sign <- function(birthday){
  good                 <- is.Date(birthday)
  if(!(good)){birthday <- as.Date(birthday, format = "%Y-%m-%d")}
  year(birthday)       <- 2015
  ind                  <- (western.data$start_date <= birthday) & (western.data$end_date >= birthday)
  element              <- subset(western.data$sign, ind)
  return(element)
}

western.personality <- function(birthday){
    good                 <- is.Date(birthday)
    if(!(good)){birthday <- as.Date(birthday, format = "%Y-%m-%d")}
    year(birthday)       <- 2015
    ind                  <- (western.data$start_date <= birthday) & (western.data$end_date >= birthday)
    element              <- subset(western.data$strength, ind)
    return(element)
}

western.symbol <- function(birthday){
  good                 <- is.Date(birthday)
  if(!(good)){birthday <- as.Date(birthday, format = "%Y-%m-%d")}
  year(birthday)       <- 2015
  ind                  <- (western.data$start_date <= birthday) & (western.data$end_date >= birthday)
  element              <- subset(western.data$symbol, ind)
  return(element)
}