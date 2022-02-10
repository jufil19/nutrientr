#' get_nutrientamount
#'
#' Makes a query to the Canadian Nutrient File nutrientamount endpoint. This endpoint returns
#' a list of nutrient id's and their corresponding nutrient amounts/
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param food_code The code indicating the food you want to search for. If null,
#' all foods and their corresponding refuse amounts are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing the food_code, nutrient_value, number_observation, 
#' nutrient_name_id, nutrient_web_name, nutrient_source_id
#'
#' @export
#'
#'#'
#' @examples
#' get_nutrientamount()
#' get_nutrientamount(food_code = 2314)
#' get_nutrientamount(food_code = 2314, lang = "fr")
get_nutrientamount <- function(apiKey=NULL,
                               food_code=NULL,
                               lang="en") {
  # Query nutrient amount endpoint of the api
  output <- 
    query_api(
      path = "nutrientamount",
      apiKey = apiKey,
      id = food_code,
      lang = lang)
  
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientgroup
#'
#' Makes a query to the Canadian Nutrient File refuseamount endpoint. This endpoint 
#' returns a list of all nutrient groups, or if an ID is provided, the list of all 
#' nutrient groups that correspond to the given nutrient group identification number
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrient_group_id The code indicating the food group you want to search for. If null,
#' all foods and their corresponding refuse amounts are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing refuse name, refuse amount, food names and food codes. 
#'
#' @export
#'
#' @examples
#' get_nutrientgroup()
#' get_nutrientgroup(foodCode = 557)
#' get_nutrientgroup(foodCode = 557, lang = "fr")
#' 
get_nutrientgroup <- function(apiKey=NULL,
                               nutrient_group_id=NULL,
                               lang="en") {
  # Query nutrient amount endpoint of the api
  output <- 
    query_api(
      path = "nutrientamount",
      apiKey = apiKey,
      id = nutrient_group_id,
      lang = lang)
  
  # Get a clean tibble from the results and return it.
  clean_data(output)
}



