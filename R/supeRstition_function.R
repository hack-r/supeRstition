# ============================================================================
# File        : supeRstition_function.R
# File Author : Jason D. Miller
# Copyright   : 2015 
# Description : Function to generate astrological/horoscope data from birth date
# Repo URL    : https://github.com/hack-r/supeRstition.git
# ============================================================================
cat("Welcome to supeRstition!")
cat(" ")
cat("Please make sure that Gregorian birthday inputs are in POSIXlt YYYY-MM-DD format")
if (!require("pacman")) install.packages("pacman") 
#pacman::p_load("Matching")
install_github("chainsawriot/sinodate")
require(sinodate)
chineseAnimals       <- readRDS("data/chineseAnimals.RDS")
chineseAnimals.hours <- readRDS("data/chineseAnimals_hours.RDS")
lunarCal             <- readRDS("data/lunarCal.RDS")

supeRstition_function <- function(birthday){
    good                 <- is.na.POSIXlt(birthday)
    if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
    #birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
    #birthday.lunisolar2  <- as.Date(birthday.lunisolar)
    ind  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
    temp <- subset(lunarCal, ind)
    return(temp)
}

supeRstition_personality <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  #birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
  #birthday.lunisolar2  <- as.Date(birthday.lunisolar)
  ind  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  personality <- subset(lunarCal$PERSONALITY, ind)
  return(personality)
}

supeRstition_aspect <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  #birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
  #birthday.lunisolar2  <- as.Date(birthday.lunisolar)
  ind  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  aspect <- subset(lunarCal$ASPECT, ind)
  return(aspect)
}

supeRstition_animal <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  #birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
  #birthday.lunisolar2  <- as.Date(birthday.lunisolar)
  ind  <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  animal <- subset(lunarCal$ANIMAL, ind)
  return(animal)
}

supeRstition_element <- function(birthday){
  good                 <- is.na.POSIXlt(birthday)
  if(!(good)){birthday <- strptime(birthday, format = "%Y-%m-%d", tz = "Asia/Chongqing")}
  #birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
  #birthday.lunisolar2  <- as.Date(birthday.lunisolar)
  ind     <- (lunarCal$START_DATE <= birthday) & (lunarCal$END_DATE >= birthday)
  element <- subset(lunarCal$ELEMENT, ind)
  return(element)
}
