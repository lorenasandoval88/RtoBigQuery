# Upload data.frame to bigquery from R
# Purpose: Save reports to bigquery
# Author: Lorena Sandoval
# Email: Sandovall2@nih.gov

# Set working directory, if needed
setwd("C:/Users/_________")

# latest stable version of "bigQueryR" and "googleAuthR" packages-------------------------------------

#install.packages("googleAuthR")
library(googleAuthR)
#install.packages("bigQueryR", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))
library(bigQueryR)

# Authenticate in Google ------------------------------------------------------------------------------
gar_set_client("_______________.apps.googleusercontent.com.json")
gar_auth(email="_________",scopes = "https://www.googleapis.com/auth/bigquery")
gar_token_info()

# Authenticate in bigQueryR ----------------------------------------------------------------------------
bigQueryR::bqr_auth(email = "__________")

options(googleAuthR.client_id = "___________________.apps.googleusercontent.com",
        googleAuthR.client_secret = "_________________")


Sys.setenv(BIGQUERY_TEST_PROJECT = "_________________") # Replace with your GCP project ID

# Upload data.frame that doesn't include "." in header names
names(iris) = c("a","b","c","d","e")
df=data.frame(iris)
bigQueryR::bqr_upload_data(projectId  = "______________", datasetId = "______________", tableId = "______________", df, 
                           
