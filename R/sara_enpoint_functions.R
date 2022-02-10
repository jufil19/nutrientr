#' get_food
#'
#' Makes a query to the Canadian Nutrient File food endpoint. This endpoint returns
#' data from a list of food codes and corresponding names.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing food names and food ids.
#'
#' @export
#'
#' @examples
#' get_food()
#' get_food(food_code = 2314)
#' get_food(food_code = 2314, lang = "fr")
get_food <- function(apiKey = NULL,
                     foodCode = NULL,
                     lang = "en") {
  # Query the food endpoint of the api.
  output <-
    query_api(
      path = "food",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}