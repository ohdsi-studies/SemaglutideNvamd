################################################################################
# INSTRUCTIONS: The code below assumes you have access to a PostgreSQL database
# and permissions to create tables in an existing schema specified by the
# resultsDatabaseSchema parameter.
# 
# See the Working with results section
# of the UsingThisTemplate.md for more details.
# 
# More information about working with results produced by running Strategus 
# is found at:
# https://ohdsi.github.io/Strategus/articles/WorkingWithResults.html
# ##############################################################################

# Code for creating the result schema and tables in a PostgreSQL database
resultsDatabaseSchema <- "semanvamd"
analysisSpecifications <- ParallelLogger::loadSettingsFromJson(
  fileName = "inst/semaglutideNvamdAnalysisSpecification.json"
)

resultsDatabaseConnectionDetails <- DatabaseConnector::createConnectionDetails(
  dbms = "postgresql",
  server = Sys.getenv("OHDSI_RESULTS_DATABASE_SERVER"),
  user = Sys.getenv("OHDSI_RESULTS_DATABASE_USER"),
  password = Sys.getenv("OHDSI_RESULTS_DATABASE_PASSWORD")
)

# Create results data model -------------------------

# Use the 1st results folder to define the results data model
resultsFolder <- list.dirs(path = "results", full.names = T, recursive = F)[1]
resultsDataModelSettings <- Strategus::createResultsDataModelSettings(
  resultsDatabaseSchema = resultsDatabaseSchema,
  resultsFolder = file.path(resultsFolder, "strategusOutput")
)

Strategus::createResultDataModel(
  analysisSpecifications = analysisSpecifications,
  resultsDataModelSettings = resultsDataModelSettings,
  resultsConnectionDetails = resultsDatabaseConnectionDetails
)

# Used when reloading from scratch:
truncateAllTables <- function(resultsDatabaseConnectionDetails, resultsDatabaseSchema) {
  connection <- DatabaseConnector::connect(resultsDatabaseConnectionDetails)
  on.exit(DatabaseConnector::disconnect(connection))
  
  # Analyze all tables in the results schema
  message("Truncate all tables in results schema")
  sql <- "TRUNCATE TABLE @schema.@table_name CASCADE;"
  tableList <- DatabaseConnector::getTableNames(
    connection = connection,
    databaseSchema = resultsDatabaseSchema
  )
  for (i in 1:length(tableList)) {
    DatabaseConnector::renderTranslateExecuteSql(
      connection = connection,
      sql = sql,
      schema = resultsDatabaseSchema,
      table_name = tableList[i],
      progressBar = FALSE,
      reportOverallTime = FALSE
    )
  }
}