# ============================================================================
# File        : supeRstition_function.R
# File Author : Jason D. Miller
# Copyright   : 2015 
# Description : Functions to generate astrological/horoscope signs from birth dates
# Repo URL    : https://github.com/hack-r/supeRstition.git
# ============================================================================
cat("Welcome to supeRstition!")
cat(" ")
cat("Please make sure that Gregorian birthday inputs are in POSIXlt YYYY-MM-DD format")
if (!require("pacman")) install.packages("pacman") 
install_github("chainsawriot/sinodate")
require(sinodate)
chineseAnimals       <- readRDS("data/chineseAnimals.RDS")
chineseAnimals.hours <- readRDS("data/chineseAnimals_hours.RDS")
lunarCal             <- readRDS("data/lunarCal.RDS")

supeRstition_function <- function(birthday){
    good                 <- is.na.POSIXlt(birthday)
    if(!(good)){birthday <- as.Date(birthday, tz = "Asia/Chongqing")}
    birthday.lunisolar   <- as.sinodate(birthday, gregorian = TRUE)
    
}



