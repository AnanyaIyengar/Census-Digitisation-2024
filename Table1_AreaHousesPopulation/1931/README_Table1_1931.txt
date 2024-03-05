Date Created: 5 March 2024
Latest Date Updated: 5 March 2024

1. 1931_ProvinceLevel_Raw.zip contains raw .xlsx files for the United Provinces of Agra and Oudh, Ajmere and Merwara, Andaman and Nicobar Islands, Assam, Baluchistan, Baroda, Bengal and Sikkim, Bihar and Orissa, Bombay Presidency, Central India Agency, Cochin, Coorg, Central Provinces and Berar, Gwalior, Hyderabad, Jammu and Kashmir, Madras, Mysore, North West Frontier Provinces, Punjab, Rajputana, Travancore and the Western States Agency. 

Variable Descriptions:

year: The corresponding Census year, here 1931.
state_province: Name of the Province or State as listed above. 
state: State names, if data for the particular region has states within it.
substate: Substate names, if data for the particular region has sub-states within it 
territory_type: Type of Region, if data for the particular region classifies its sub-regions (say, as british territory vs feudatory states)
division: Division names, if data for the particular region is geographically segregated into divisions. 
subdivision: Sub-division names, if data for the particular region is divided in sub-divisions. 
agency: Agency names, for Central India Agency and Bombay States and Agencies.
district: District names, for regions where divisions are categorised into districts. 
subdistrict: Subdistrict names, for regions where districts are further divided into sub-districts. 
city: regions of Bombay city differentiated, no other region has entries for this variable. 
taluk: Talukas, for Cochin. No other region has entries for this variable, 
political_relations: Only for the region of Punjab, classifying regions as "having political relations with the punjab government" and "having political relations with the government of india".
area_sqmile: Area in Square Miles. 
towns: Number of Inhabited Towns
villages: Number of Inhabited Villages
total_inhabited_houses: Total Inhabited Houses in the region
occupied_houses_towns: Total Inhabited Houses in Towns
occupied_houses_villages: Total Inhabited Houses in Villages
occuped_houses_other: Total Inhabited Houses in neither towns nor villages. Only for the United Provinces of Agra and Oudh. 
totalp : Headcount of total population 
urbanp : Headcount of total urban population
ruralp: Headcount of total rural population
totalmale: Headcount of total number of males in population
urbanmale: Headcount of total number of males in urban population
ruralmale: Headcount of total number of males in rural population
totalfemale: Headcount of total number of females in population
urbanfemale: Headcount of total number of females in urban population
ruralfemale: Headcount of total number of females in rural population

2. 1931_Cleaning.R: R file to clean the above files, rename variables, and vertically merge to make one combined province-level file for 1931.

3.Table1_1931.csv: CSV file for the above mentioned merged data. 