# Helper function that formats the output of the query_api function into a tibble with appropriate column types
# This function will not be visible by users

clean_data <- function(query_api_output) {
  df <- as.data.frame(do.call(rbind, query_api_output$content))

  # Check if the dataframe is empty

  if (nrow(df) == 0) {
    stop("The requested query has no result")
  }

  # Each column is a list, we thus need to unnest every column
  # This way, R will be able to attribute the appropriate type to each column

  df_unnest <- unnest(df, cols = all_of(colnames(df)))

  # output the tibble
  df_unnest
}


