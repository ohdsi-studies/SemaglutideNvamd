################################################################################
# INSTRUCTIONS: This script assumes you have cohorts you would like to use in an
# ATLAS instance. Please note you will need to update the baseUrl to match
# the settings for your enviroment. You will also want to change the 
# CohortGenerator::saveCohortDefinitionSet() function call arguments to identify
# a folder to store your cohorts. This code will store the cohorts in 
# "inst/sampleStudy" as part of the template for reference. You should store
# your settings in the root of the "inst" folder and consider removing the 
# "inst/sampleStudy" resources when you are ready to release your study.
# 
# See the Download cohorts section
# of the UsingThisTemplate.md for more details.
# ##############################################################################

library(dplyr)
baseUrl <- "https://atlas-demo.ohdsi.org/WebAPI"
# Use this if your WebAPI instance has security enables
# ROhdsiWebApi::authorizeWebApi(
#   baseUrl = baseUrl,
#   authMethod = "windows"
# )
cohortDefinitionSet <- ROhdsiWebApi::exportCohortDefinitionSet(
  baseUrl = baseUrl,
  cohortIds = c(
    # outcome
    1793486,
    1793488,
    1793491,
    1793493, # CohortDiagnostics first, and then CM and SCCS
    1793494, # CohortDiagnostics first, and then CM and SCCS
    1793495, # CohortDiagnostics first, and then CM and SCCS
    1793496, # CohortDiagnostics first, and then CM and SCCS
    1793640, # added on 06/30
    1793641, # CohortDiagnostics first, and then CM and SCCS (sensitivity analysis)
    1793642, # CohortDiagnostics first, and then CM and SCCS (sensitivity analysis)
    1793643, # CohortDiagnostics first, and then CM and SCCS (sensitivity analysis)
    1793644, # CohortDiagnostics first, and then CM and SCCS (sensitivity analysis)
    # indication
    1793556, 
    # Exposure 
    ## SCCS only
    1793557,
    1793558,
    1793559,
    1793560,
    1793561,
    1793562,
    ## CohortMethod
    1793563,
    1793564,
    1793565,
    1793566,
    1793567,
    1793568, 
    ## CohortMethod (sensitivity analysis 1)
    1793569,
    1793570,
    1793571,
    1793572,
    1793573,
    1793574, 
    # CohortMethod (sensitivity analysis 2)
    1793575,
    1793576,
    1793577,
    1793578,
    1793579,
    1793580
  ),
  generateStats = TRUE
)

# Rename cohorts
## Outcome
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793486,]$cohortName <- "Specific NVAMD"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793488,]$cohortName <- "Sensitive NVAMD"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793491,]$cohortName <- "Non-infectious Ocular Inflammation"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793493,]$cohortName <- "Anterior Uveitis"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793494,]$cohortName <- "Chorioretinal Inflammation"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793495,]$cohortName <- "Panuveitis"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793496,]$cohortName <- "Retinal Vasculitis"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793640,]$cohortName <- "Non-infectious Ocular Inflammation excluding intraocular surgery"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793641,]$cohortName <- "Anterior Uveitis excluding intraocular surgery"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793642,]$cohortName <- "Chorioretinal Inflammation excluding intraocular surgery"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793643,]$cohortName <- "Panuveitis excluding intraocular surgery"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793644,]$cohortName <- "Retinal Vasculitis excluding intraocular surgery"

  

## Indication 
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793556,]$cohortName <- "Persons with Type 2 DM and no prior T1DM or secondary Diabetes"
## Exposure, SCCS only 
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793557,]$cohortName <- "Semaglutide exposures"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793558,]$cohortName <- "Dulaglutide exposures"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793559,]$cohortName <- "Exenatide exposures"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793560,]$cohortName <- "Empagliflozin exposures"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793561,]$cohortName <- "Sitagliptin exposures"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793562,]$cohortName <- "Glipizide exposures"
# Exposure, CohortMethod
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793563,]$cohortName <- "New user of semaglutide as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793564,]$cohortName <- "New user of dulaglutide as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793565,]$cohortName <- "New user of exenatide as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793566,]$cohortName <- "New user of empagliflozin as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793567,]$cohortName <- "New user of sitagliptin as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793568,]$cohortName <- "New user of glipizide as 2nd line prior T2DM and metformin"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793569,]$cohortName <- "New user of semaglutide with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793570,]$cohortName <- "New user of dulaglutide with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793571,]$cohortName <- "New user of exenatide with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793572,]$cohortName <- "New user of empagliflozin with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793573,]$cohortName <- "New user of sitagliptin with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793574,]$cohortName <- "New user of glipizide with prior T2DM"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793575,]$cohortName <- "New user of semaglutide as 2nd line prior T2DM and metformin Dec2017-Jan2020"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793576,]$cohortName <- "New user of semaglutide as 2nd line prior T2DM and metformin Feb2020-June2021"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793577,]$cohortName <- "New user of semaglutide as 2nd line prior T2DM and metformin July2021-Dec2024"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793578,]$cohortName <- "New user of empagliflozin as 2nd line prior T2DM and metformin Dec2017-Jan2020"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793579,]$cohortName <- "New user of empagliflozin as 2nd line prior T2DM and metformin Feb2020-June2021"
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793580,]$cohortName <- "New user of empagliflozin as 2nd line prior T2DM and metformin July2021-Dec2024"

# Re-number cohorts
## Outcome
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793486,]$cohortId <- 1
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793488,]$cohortId <- 2
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793491,]$cohortId <- 3
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793493,]$cohortId <- 4
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793494,]$cohortId <- 5
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793495,]$cohortId <- 6
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793496,]$cohortId <- 7
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793640,]$cohortId <- 8
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793641,]$cohortId <- 9
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793642,]$cohortId <- 10
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793643,]$cohortId <- 11
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793644,]$cohortId <- 12

## Indication 
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793556,]$cohortId <- 50
## Exposure, SCCS only 
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793557,]$cohortId <- 101
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793558,]$cohortId <- 102
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793559,]$cohortId <- 103
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793560,]$cohortId <- 104
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793561,]$cohortId <- 105
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793562,]$cohortId <- 106
# Exposure, CohortMethod
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793563,]$cohortId <- 201 # target
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793564,]$cohortId <- 211
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793565,]$cohortId <- 212
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793566,]$cohortId <- 213
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793567,]$cohortId <- 214
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793568,]$cohortId <- 215
# Exposure, CohortMethod (sensitivity analysis 1)
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793569,]$cohortId <- 301 # target
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793570,]$cohortId <- 311
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793571,]$cohortId <- 312
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793572,]$cohortId <- 313
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793573,]$cohortId <- 314
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793574,]$cohortId <- 315
# Exposure, CohortMethod (sensitivity analysis 2)
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793575,]$cohortId <- 401 # target
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793576,]$cohortId <- 402 # target
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793577,]$cohortId <- 403 # target
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793578,]$cohortId <- 411
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793579,]$cohortId <- 412
cohortDefinitionSet[cohortDefinitionSet$cohortId == 1793580,]$cohortId <- 413


# Save the cohort definition set
# NOTE: Update settingsFileName, jsonFolder and sqlFolder
# for your study.
CohortGenerator::saveCohortDefinitionSet(
  cohortDefinitionSet = cohortDefinitionSet,
  settingsFileName = "inst/Cohorts.csv",
  jsonFolder = "inst/cohorts",
  sqlFolder = "inst/sql/sql_server",
)


# Download and save the negative control outcomes
negativeControlOutcomeCohortSet <- ROhdsiWebApi::getConceptSetDefinition(
  conceptSetId = 1887416,
  baseUrl = baseUrl
) %>%
  ROhdsiWebApi::resolveConceptSet(
    baseUrl = baseUrl
  ) %>%
  ROhdsiWebApi::getConcepts(
    baseUrl = baseUrl
  ) %>%
  rename(outcomeConceptId = "conceptId",
         cohortName = "conceptName") %>%
  mutate(cohortId = row_number() + 1000) %>%
  select(cohortId, cohortName, outcomeConceptId)

# NOTE: Update file location for your study.
CohortGenerator::writeCsv(
  x = negativeControlOutcomeCohortSet,
  file = "inst/negativeControlOutcomes.csv",
  warnOnFileNameCaseMismatch = F
)



