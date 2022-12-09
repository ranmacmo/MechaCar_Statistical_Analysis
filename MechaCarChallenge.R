# LOAD LIBRARIES 
library(dplyr)
library(readr)
library(tidyverse)


# READ CSV FILE IN 
MechaCar_mpg <- read_csv("Resources/MechaCar_mpg.csv")
View(MechaCar_mpg)

# CHECK SUMMARY DATA OF FILE 
summary(MechaCar_mpg) 

# PERFORM MPG LINEAR ANALYSIS 
model <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = MechaCar_mpg)
summary(model)


# PERFORM SUSPENSION COIL SUMMARY 

Suspension_Coil <-read_csv("Resources/Suspension_Coil.csv")

Suspension_Summary <- Suspension_Coil |>summarize(PSI_mean = mean(PSI), 
                            PSI_median = median(PSI), 
                            PSI_variance = var(PSI), 
                            PSI_sd = sd(PSI))
view(Suspension_Summary)


Suspension_Lot_Summary <- Suspension_Coil |>
                          group_by(Manufacturing_Lot) |> 
                          summarize(PSI_mean = mean(PSI), 
                                    PSI_median = median(PSI), 
                                    PSI_variance = var(PSI), 
                                    PSI_sd = sd(PSI))
view(Suspension_Lot_Summary)

  
