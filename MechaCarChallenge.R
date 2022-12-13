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

view(Suspension_Coil)

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

# SUSPENSION COIL T-TEST 

# Determine if coils psi results are stats different than pop mean 1500 
t.test(Suspension_Coil$PSI, mu=1500 )
  
# Determine if mfg lots are stats different that pop mean 1500 
t.test(subset(Suspension_Coil,Manufacturing_Lot == "Lot1")$PSI, mu = 1500) 
t.test(subset(Suspension_Coil,Manufacturing_Lot == "Lot2")$PSI, mu = 1500) 
t.test(subset(Suspension_Coil,Manufacturing_Lot == "Lot3")$PSI, mu = 1500) 

