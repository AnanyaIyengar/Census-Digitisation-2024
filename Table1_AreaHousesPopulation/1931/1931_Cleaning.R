### Cleaning and merging Table 1 for the 1931 Census ###

#Date Updated: 29 February 2024
#Updated By: Ananya Iyengar 

################################################################################

#Setting Working Directory for the project

setwd("C:/Users/LENOVO/Desktop/Ananya/2024 Census Digitisation/Table1_AreaHousesPopulation/1931/Table1_1931")

################################################################################

#Loading Packages

library(readxl) #to read excel files into R
library(dplyr) #for all kinds of data manipulation
library(tidyr) #for the bindrows command 

################################################################################

#Loading the Province-Level data sets. We will bring in the all-India data set later,
# since the India file has fewer variables that the province-level files. More details in the documentation sheet for Table 1.

baluchistan31 <- read_excel("1931_baluchistan_v4_p2__pg_1-2_t1.xlsx")
baroda31 <- read_excel("1931_baroda_v19_p2_pg_1-2_t1.xlsx")
bengalsikkim31 <- read_excel("1931_bengal_and_sikkim_v2_p5_pg_2_t1.xlsx")
biharorissa31 <-  read_excel("1931_bihar_and_orissa_v7_p2_pg_1-2_t1.xlsx")
bompresidency31 <- read_excel("1931_bombay_presidency_v8_p2_pg_1-5_t1.xlsx")
centralindia31 <- read_excel("1931_central_india_agency_v20_p2_pg_1-5_t1.xlsx")
cochin31 <-  read_excel("1931_cochin_v21_p2_pg_3-4_t1.xlsx")
coorg31 <- read_excel("1931_coorg_v13_p2_pg_44_t1.xlsx")
cpberar31 <- read_excel("1931_cp_and_berar_v12_p2_pg_1-4_t1.xlsx")
gwalior31 <- read_excel("1931_gwalior_v22_p2_pg_1-2_t1.xlsx")
hyderabad31 <- read_excel("1931_hyderabad_v23_p2_pg_1-2_t1.xlsx")
jammukashmir31 <- read_excel("1931_jammu&kashmir_v24-p2_pg_1-2_t1.xlsx")
madras31 <-  read_excel("1931_madras_v14_p2_pg_1-2_t1.xlsx")
mysore31 <- read_excel("1931_mysore_v25_p2_pg_1-2_t1.xlsx")
nwfp31 <- read_excel("1931_nwfp_v25_p2_pg_2-3_t1.xlsx")
punjab31 <- read_excel("1931_punjab_v17_p2_pg_1-3_t1.xlsx")
rajputana31 <-  read_excel("1931_rajputana_v27_p2_pg_1-2_t1.xlsx")
travancore31 <-  read_excel("1931_travancore_v28_p2_pg_1-2_t1.xlsx")
agraoudh31 <- read_excel("1931_up_of_agra_and_oudh_v28_p2_pg_1-3_t1.xlsx")
westernstates31 <- read_excel("1931_western_india_state_agency_v10_p2_pg_1-3_t1.xlsx")
ajmermerwara31 <-  read_excel("1931_ajmermerwara_v26_p2_pg_1-2_t1.xlsx")
andamannicobar31 <- read_excel("1931_andamans&nicobars_v2_p2_pg_103_t1.xlsx")
assam31 <- read_excel("1931_assam_v3_p2_pg_1-2_t1.xlsx")

################################################################################

#We need to bring all files into the same format, in terms of the column names. 
#Using information from the documentation file, we will rename columns in all the sheets first. 
#Then, if any file has fewer/missing columns, we will append blank columns with the corresponding names to those files. 
#We use the dplyr package for this. 

#United Provinces of Agra and Oudh ###########

#This file does not have a column for province name, something that is required when we eventually merge to make a panel. 

agraoudh31 <- agraoudh31 %>% dplyr::mutate(province = "United Provinces of Agra and Oudh")

#Now, we set the column names in a way that will be standarised across these files 

colnames(agraoudh31) <- c("district", "territory_type", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                          "occupied_houses_other", "totalp", "urbanp", "ruralp", "totalmale", "urbanmale", "ruralmale", "totalfemale",
                          "urbanfemale", "ruralfemale", "state_province")


#Ajmere-Merwara #################

colnames(ajmermerwara31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                              "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                              "urbanfemale", "ruralfemale" )

#Andaman-Nicobars ##############

colnames(andamannicobar31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                                "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                                "urbanfemale", "ruralfemale")

#Assam ###################

colnames(assam31) <- c("state_province", "substate", "division", "district", "area_sqmile", "towns", "villages", "occupied_houses_towns",
                       "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                       "urbanfemale", "ruralfemale")

#Baluchistan #################

colnames(baluchistan31) <- c("state_province", "substate", "district", "subdistrict", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                             "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                             "urbanfemale", "ruralfemale")

#Baroda ###############

colnames(baroda31) <- c("state_province", "division", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                        "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                        "urbanfemale", "ruralfemale")

#Bengal and Sikkim #############

#Note that in this file, what we are labelling as villages were originally labelled as "rural mauzas". 
#The renaming is being done in order to facilitate merging of 

colnames(bengalsikkim31) <- c("state_province", "territory_type", "division", "district", "subdistrict", "area_sqmile", 
                              "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                              "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                              "urbanfemale", "ruralfemale")

#Bihar and Orissa ##############

biharorissa31$territory_type <- paste0(biharorissa31$territory, biharorissa31$`feudatory states`)

biharorissa31 <- biharorissa31 %>% select(-c(territory, `feudatory states`))

colnames(biharorissa31) <- c("state_province", "division", "district", "state", "substate",  "area_sqmile", 
                             "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                             "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                             "urbanfemale", "ruralfemale", "territory_type")

#Bombay Presidency ################

colnames(bompresidency31) <- c("state_province", "agency", "subagency", "district", "city", "division", "subdistrict", 
                               "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                               "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                               "urbanfemale", "ruralfemale")

#Central India #####################

colnames(centralindia31) <- c("state_province", "agency", "state", "subagency", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                              "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                              "urbanfemale", "ruralfemale")

#Cochin #########################

colnames(cochin31) <- c("state_province", "taluk", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                      "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                      "urbanfemale", "ruralfemale")

#Coorg ###########################

colnames(coorg31) <- c("state_province", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                       "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                       "urbanfemale", "ruralfemale")

#Central Provinces and Cooch Behar #####################

colnames(cpberar31) <- c("state_province", "territory_type", "division", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                         "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                         "urbanfemale", "ruralfemale")

#Gwalior ###########################

colnames(gwalior31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                         "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                         "urbanfemale", "ruralfemale")

#Hyderabad #######################

colnames(hyderabad31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                          "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                          "urbanfemale", "ruralfemale")

#Jammu and Kashmir ##########################

colnames(jammukashmir31) <- c("state_province", "territory_type", "district", "subdistrict", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                             "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                             "urbanfemale", "ruralfemale")

#Madras #################################

colnames(madras31) <- c("state_province", "territory_type", "district", "subdistrict", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                        "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                        "urbanfemale", "ruralfemale" )


#Mysore ############################

colnames(mysore31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                        "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                        "urbanfemale", "ruralfemale")

#North-West Frontier Provinces ######################

colnames(nwfp31) <- c("territory_type", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                      "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                      "urbanfemale", "ruralfemale")
nwfp31 <- nwfp31 %>% dplyr::mutate(state_province = "North West Frontier Provinces")

#Punjab ##########################################

colnames(punjab31) <- c("state_province", "territory_type", "state", "political_relations", "division", "district", "subdistrict", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                        "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                        "urbanfemale", "ruralfemale")

#Rajputana ########################################

#Here the district variable includes information on states or districts in the Rajputana agency

colnames(rajputana31) <- c("state_province", "district", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                           "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                           "urbanfemale", "ruralfemale")

#Travancore ############################################

colnames(travancore31) <- c("state_province", "division", "subdivision", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                            "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                            "urbanfemale", "ruralfemale")

#Western States ######################################

colnames(westernstates31) <- c("srno", "state_province", "territory_type", "state", "area_sqmile", "towns", "villages", "total_occupied_houses", "occupied_houses_towns",
                               "occupied_houses_villages", "totalp", "urbanp", "ruralp","totalmale", "urbanmale", "ruralmale", "totalfemale",
                               "urbanfemale", "ruralfemale")

westernstates31 <- westernstates31 %>% dplyr::select(-c(srno))

############################################################################################

#Checking Character Types for the variables before merging

#We will convert all the numbers in all data frames to numeric. 

sapply(agraoudh31, class) #this command gives us the class of all the variables in the data frame 
agraoudh31$occupied_houses_towns <- as.numeric(agraoudh31$occupied_houses_towns) #we use as.numeric to change the class of values from character to numeric
agraoudh31$urbanp <- as.numeric(agraoudh31$urbanp)
sapply(agraoudh31, class)

sapply(ajmermerwara31, class)

sapply(andamannicobar31, class)
andamannicobar31$occupied_houses_towns <- as.numeric(andamannicobar31$occupied_houses_towns)
andamannicobar31$urbanp <- as.numeric(andamannicobar31$urbanp)
andamannicobar31$towns <- as.numeric(andamannicobar31$towns)
andamannicobar31$urbanmale <- as.numeric(andamannicobar31$urbanmale)
andamannicobar31$urbanfemale <- as.numeric(andamannicobar31$urbanfemale)
sapply(andamannicobar31, class)

sapply(assam31, class)
sapply(baluchistan31, class)
sapply(baroda31, class)
sapply(bengalsikkim31, class)
sapply(biharorissa31, class)
sapply(bompresidency31, class)
sapply(centralindia31, class)
sapply(cochin31, class)
sapply(coorg31, class)
sapply(cpberar31, class)
sapply(gwalior31, class)
sapply(hyderabad31, class)
sapply(jammukashmir31, class)
sapply(madras31, class)
sapply(mysore31, class)

sapply(nwfp31, class)
nwfp31$area_sqmile <- as.numeric(nwfp31$area_sqmile)
nwfp31$occupied_houses_villages <- as.numeric(nwfp31$occupied_houses_villages)

sapply(punjab31, class)
sapply(rajputana31, class)
sapply(travancore31, class)
sapply(westernstates31, class)


##############################################################################################

#Vertically stacking the files above one another to create a combined file for 1931

table1_1931 <- bind_rows(agraoudh31, ajmermerwara31, andamannicobar31, assam31, baluchistan31, baroda31, bengalsikkim31,
                         biharorissa31, bompresidency31, centralindia31, cochin31, coorg31, cpberar31, gwalior31,
                         hyderabad31, jammukashmir31, madras31, mysore31, nwfp31, punjab31, rajputana31,
                         travancore31, westernstates31)

#Creating a Year Variable for all the entries in the data frame 

table1_1931 <- table1_1931 %>% dplyr::mutate(year = 1931)

##################################################################################################

#Re-ordering the columns in the data frame 

colnames(table1_1931) #displays the names of all columns in the data frame 

table1_1931 <- table1_1931[ ,c("year","state_province","state", "substate", "territory_type", "division" , "subdivision", "agency",  "subagency",
                               "district" , "subdistrict", "city" , "taluk" , "political_relations",
                               "area_sqmile","towns", "villages" , "total_occupied_houses" ,  "occupied_houses_towns", "occupied_houses_villages",
                               "occupied_houses_other", "totalp",  "urbanp",  "ruralp" ,  "totalmale" , "urbanmale",
                               "ruralmale", "totalfemale", "urbanfemale" ,"ruralfemale" )] #ordering all the columns by name, and maintaing all rows

####################################################################################################

#Downloading as a .CSV file into the working directory

write.csv(table1_1931, "C:/Users/LENOVO/Desktop/Ananya/2024 Census Digitisation/Table1_AreaHousesPopulation/1931/Table1_1931\\Table1_1931.csv")

