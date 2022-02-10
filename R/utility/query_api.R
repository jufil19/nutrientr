#' query_api
#' Makes a query to the Canadian Nutrient Files API.
#'
#' @param path the path to the desired endpoint. (Should be one of food, nutrientamount
#' nutrientgroup, nutrientname, nutrientsource, refuseamount, servingsize, or yieldamount.)
#' @param userKey key to access the API. Can be retrieved from <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
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
#' @examples
#' query_api("food")
#' query_api("food", id = 2314)
#' query_api("nutrientgroup", id = 1)
#' query_api("nutrientname", id = 1)
#' query_api("nutrientsource", id = 82)
#' query_api("refuseamount", id = 2314)
#' query_api("servingsize", id = 2314)
#' query_api("yieldamoubt", id = 2314)
#'
#' @export
#'
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
  ua <- user_agent('https://github.com/jufil19/nutrientr')

  # Make sure all the necessary components are ready to make a query.
  url <- modify_url("https://cnf-hc-sc-apicast-production.api.canada.ca", path = paste('v1/', path, sep = ''))
  query <- list(lang = lang, id = id, type = 'json')
  header <- add_headers("user-key" = apiKey)
  resp <- GET(url, ua, header, query = query)

  # Need to verify output was JSON as it should be.
  if (http_type(resp) != "application/json") {
    # Check status code since the API doesn't return json if there is an error.
    if (status_code(resp) != 200) {
      stop(
        paste("Canadian Nutrient File API request failed:", status_code(resp), rawToChar(resp$content)),
        call. = FALSE
      )
    }
    # Otherwise the call was valid but response was not json.
    stop("API did not return json", call. = FALSE)
  }

  # Now parse the text output from the response.
  parsed <-  jsonlite::fromJSON(content(resp, "text"), simplifyVector = FALSE)


  # Check status code to make sure query was successful and if not provide useful errors.
  if (status_code(resp) != 200) {
    stop(
      paste("Canadian Nutrient File API request failed:", status_code(resp), parsed$Message, parsed$documentation_url),
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
