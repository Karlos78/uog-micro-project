### This file contains the code needed to run the analysis for the JISC Micro-project ###	
### "Can survey data be used as an indicator of learning outcomes?"                   ###
### Version 1.0                                                                       ###
### 07/10/2015                                                                        ###
### Karl Molden - Planning & Statistics - University of Greenwich                     ###
 
### Set the working directory - change to reflect local machine

setwd("C:\\Users\\mk77\\jisc_micro_project")

### Packages needed:
### car (for recode)
### dplyr (for data manipultation)

### Select one of the UK mirrors for install

install.packages("dplyr")
install.packages("car")

library(dplyr)
library(car)

### Read in the survey data, using the first row as variable names and 
### skipping the second row
### TO DO: Second row should be written to seperate object

all_rows <- readLines("USS 2014 Main.csv")
sd_2014_desc <- all_rows[2]
skip_second <- all_rows[-2]
sd_2014 <- read.csv(textConnection(skip_second), header = TRUE, stringsAsFactors = FALSE)


### Read in the 2014 student data
stu_d_2014 <- read.csv("2014_stu_data.csv")

### Select the rows within the student data which we're interested in.
stu_gpa_2014 <- stu_d_2014 %>% select(BANNER_ID_NUMHUS, Stage.GPA, Most.recent.progress, ETHNICITY, M.F)


### Join the data together
merged_2014 <- merge(sd_2014,stu_gpa_2014, by.x = "Banner.ID.Numhuns", by.y = "BANNER_ID_NUMHUS", all.x=TRUE)



### Select only the columns and rows needed to analyse the UKES data
merged_2014 %>% select(Banner.ID.Numhuns, Q1, Q2a, Q2b, Q2c, Q2d, Q2e, Q3a, Q4a, Q5a, Q6a, Q6b, Q6c, Q6d, Q7a, Q7b, Q7c, Q7d, Q7e, Stage.GPA, Most.recent.progress, ETHNICITY, M.F) %>% filter(Q1 == "On-campus UG first year") -> UKES_2014


### Recode the answers to numeric values
UKES_2014$Q2a.num <- recode(UKES_2014$Q2a, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")
UKES_2014$Q2b.num <- recode(UKES_2014$Q2b, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")
UKES_2014$Q2c.num <- recode(UKES_2014$Q2c, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")
UKES_2014$Q2d.num <- recode(UKES_2014$Q2d, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")
UKES_2014$Q2e.num <- recode(UKES_2014$Q2e, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")

UKES_2014$Q3a.num <- recode(UKES_2014$Q3a, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q4a.num <- recode(UKES_2014$Q4a, "'Very much' = 5;'Quite a bit' = 4;'Some' = 2;'Very little' = 1; else=0")
UKES_2014$Q5a.num <- recode(UKES_2014$Q5a, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")

UKES_2014$Q6a.num <- recode(UKES_2014$Q6a, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q6b.num <- recode(UKES_2014$Q6b, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q6c.num <- recode(UKES_2014$Q6c, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q6d.num <- recode(UKES_2014$Q6d, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")

UKES_2014$Q7a.num <- recode(UKES_2014$Q7a, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q7b.num <- recode(UKES_2014$Q7b, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q7c.num <- recode(UKES_2014$Q7c, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q7d.num <- recode(UKES_2014$Q7d, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")
UKES_2014$Q7e.num <- recode(UKES_2014$Q7e, "'Very often' = 5;'Often' = 4;'Sometimes' = 2;'Never' = 1; else=0")












