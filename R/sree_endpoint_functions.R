#' get_nutrientamount
#'
#' Makes a query to the Canadian Nutrient File nutrientamount endpoint. This endpoint returns
#' a list of nutrient id's and their corresponding nutrient amounts/
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param food_code The code indicating the food you want to search for. If null,
#' all foods and their corresponding nutrient amount are returned.
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
#' get_nutrientamount(food_code = 4)
#' get_nutrientamount(food_code = 4, lang = "fr")
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
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientgroup>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrient_group_id The code indicating the food group you want to search for. If null,
#' all foods and their corresponding names are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient group's id, name, order  
#'
#' @export
#'
#' @examples
#' get_nutrientgroup()
#' get_nutrientgroup(nutrient_group_id = 7)
#' get_nutrientgroup(nutrient_group_id = 7, lang = "fr")
#' 
get_nutrientgroup <- function(apiKey=NULL,
                               nutrient_group_id=NULL,
                               lang="en") {
  # Query nutrient amount endpoint of the api
  output <- 
    query_api(
      path = "nutrientgroup",
      apiKey = apiKey,
      id = nutrient_group_id,
      lang = lang)
  
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientname
#'
#' Makes a query to the Canadian Nutrient File nutrientname endpoint. This endpoint 
#' returns a list of all nutrient names, or if an ID is provided, the list of 
#' all nutrient names that correspond to the given nutrient name identification number
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientname>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrient_name_id The code indicating the food name you want to search for. If null,
#' all foods and their corresponding symbols and  are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient name id, name, code, web_name and other details
#'
#' @export
#'
#' @examples
#' get_nutrientname()
#' get_nutrientname(nutrient_name_id = 550)
#' get_nutrientname(nutrient_name_id = 550, lang = "fr")
#' 
#' 
get_nutrientname <- function(apiKey=NULL,
                             nutrient_name_id=NULL,
                              lang="en") {
  # Query nutrient amount endpoint of the api
  output <- 
    query_api(
      path = "nutrientname",
      apiKey = apiKey,
      id = nutrient_name_id,
      lang = lang)
  
  # Get a clean tibble from the results and return it.
  clean_data(output)
}
