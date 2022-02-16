#' Retrieves the API key
#'
#' @description
#' `get_key` stops execution and returns an error message if the environment variable `CN_API` is not set to the user's API key. If the environment
#' variable is not set, the function returns an error message.
#'
#' @return The user's API key, if set as an environment variable. If key is not set, returns an error message indicating that the user can either set
#' the environment variable `CN_API` or pass the API key as an argument to the function.

#' @references Note that this function is based on, and repeats much of the code in
#'   the R API package best practices, available at <https://httr.r-lib.org/articles/api-packages.html#overall-design-1>.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' get_key()
#' }
get_key <- function() {
  key <- Sys.getenv("CN_API")
  if (key == "") {
    stop("An API key is required. Please set environment variable `CN_API` to your API key as so : `Sys.setenv(CN_API = 'your_key')` or pass
          an API key as an argument to the function. An API key can be acquired at <https://hc-sc.api.canada.ca/en/detail?api=cnf>", call. = FALSE)
  }

  key
}


# helper function that skips unit tests if no API key is set
# This function will not be visible by users (inspired by: https://cran.r-project.org/web/packages/httr/vignettes/secrets.html)

skip_if_no_key <- function() {
  if (Sys.getenv("CN_API") == "") {
    testthat::skip("No API key available")
  }
}


#' query_api
#' Makes a query to the Canadian Nutrient Files API.
#'
#' @param path the path to the desired endpoint. (Should be one of food, nutrientamount
#' nutrientgroup, nutrientname, nutrientsource, refuseamount, servingsize, or yieldamount.)
#' @param apiKey key to access the API. Can be retrieved from <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, @seealso [get_key()] will check the system environments for one.
#' @param id the id of what you're looking for. Meaning of the id changes depending on endpoint.
#' @param lang the language you are using and want results returned in.
#'
#' @return a structure with the parsed text response, the raw response, the endpoint path, and the id.
#'
#' @references Note that this function is based on, and repeats much of the code in
#' the R API package best practices,
#' available at <https://httr.r-lib.org/articles/api-packages.html#overall-design-1>.
#'
#' @export
#'
#' @examples
#' \dontrun{

#' query_api("food")
#' query_api("food", id = 2314)
#' query_api("nutrientgroup", id = 1)
#' query_api("nutrientname", id = 1)

#' query_api("nutrientsource", id = 82)
#' query_api("refuseamount", id = 2314)


#' query_api("servingsize", id = 2314)
#' query_api("yieldamount", id = 2314)

#' }
query_api <- function(path, apiKey = NULL, id = NULL, lang = "en") {

  # API limit is 60 requests per minute, so wait 1 second do make sure we never go over.
  Sys.sleep(1)

  if (is.null(path)){
    stop("You need to specify and endpoint.")
  }

  # Should no key be provided, check to see if one
  # is saved as as a system variable.
  if (is.null(apiKey)) {
    apiKey <- get_key()
  }

  # Set a user agent.
  ua <- httr::user_agent('https://github.com/jufil19/nutrientr')

  # Make sure all the necessary components are ready to make a query.
  url <- httr::modify_url("https://cnf-hc-sc-apicast-production.api.canada.ca", path = paste('v1/', path, sep = ''))
  query <- list(lang = lang, id = id, type = 'json')
  header <- httr::add_headers("user-key" = apiKey)
  resp <- httr::GET(url, ua, header, query = query)

  # Need to verify output was JSON as it should be.
  if (httr::http_type(resp) != "application/json") {
    # Check status code since the API doesn't return json if there is an error.
    if (httr::status_code(resp) != 200) {
      stop(
        paste("Canadian Nutrient File API request failed:", httr::status_code(resp), rawToChar(resp$content)),
        call. = FALSE
      )
    }
    # Otherwise the call was valid but response was not json.
    stop("API did not return json", call. = FALSE)
  }

  # Now parse the text output from the response.
  parsed <-  jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)


  # Check status code to make sure query was successful and if not provide useful errors.
  if (httr::status_code(resp) != 200) {
    stop(
      paste("Canadian Nutrient File API request failed:", httr::status_code(resp), parsed$Message, parsed$documentation_url),
      call. = FALSE
    )
  }

  # Return all of the relevant information in a structure for easy access.
  structure(
    list(
      content = parsed,
      path = path,
      id = id,
      response = resp
    ),
    class = "cn_api"
  )
}



#' clean_data
#' Helper function that formats the output of the query_api function into a tibble with appropriate column types
#'
#' @param query_api_output the output provided by the `query_api` function.
#'
#' @export
#'
clean_data <- function(query_api_output) {
  df <- as.data.frame(do.call(rbind, query_api_output$content))

  # Check if the dataframe is empty

  if (nrow(df) == 0) {
    stop("The requested query has no result")
  }

  # Each column is a list, we thus need to unnest every column
  # This way, R will be able to attribute the appropriate type to each column

  df_unnest <- tidyr::unnest(df, cols = tidyselect::all_of(colnames(df)))

  # output the tibble
  df_unnest
}

