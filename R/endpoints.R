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
#' @examples
#' get_food()
#' get_food(foodCode = 2314)
#' get_food(foodcode = 2314, lang = "fr")
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

#' get_yieldamount
#'
#' Makes a query to the Canadian Nutrient File yieldamount endpoint. This endpoint returns
#' data from a list of food codes and corresponding yield amounts (yield from refuse and or
#' cooking losses). For instance, if you search the food id 1002 (Beef Gravy), it will tell
#' you that it takes 5.55 g dehydrated to make 60 mL and 9.26g to make 100 mL.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding yields are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing food names and food codes, yield amounts, and yield names.
#'
#' @examples
#' get_yieldamount()
#' get_yieldamount(foodCode = 57)
#' get_yieldamount(foodCode = 57, lang = "fr")
get_yieldamount <- function(apiKey = NULL,
                     foodCode = NULL,
                     lang = "en") {
  # Query the yieldamount endpoint of the api.
  output <-
    query_api(
      path = "yieldamount",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientamount
#'
#' Makes a query to the Canadian Nutrient File nutrientamount endpoint. This endpoint returns
#' a list of nutrient id's and their corresponding nutrient amounts/
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding nutrient amount are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing the foodCode, nutrient_value, number_observation,
#' nutrientNameId, nutrient_web_name, nutrient_source_id
#'
#' @examples
#' get_nutrientamount()
#' get_nutrientamount(foodCode = 4)
#' get_nutrientamount(foodCode = 4, lang = "fr")
get_nutrientamount <- function(apiKey=NULL,
                               foodCode=NULL,
                               lang="en") {
  # Query nutrientamount endpoint of the api
  output <-
    query_api(
      path = "nutrientamount",
      apiKey = apiKey,
      id = foodCode,
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
#' @param nutrientGroupId The code indicating the food group you want to search for. If null,
#' all foods and their corresponding names are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient group's id, name, order
#'
#' @examples
#' get_nutrientgroup()
#' get_nutrientgroup(nutrientGroupId = 7)
#' get_nutrientgroup(nutrientGroupId = 7, lang = "fr")
#'
get_nutrientgroup <- function(apiKey=NULL,
                              nutrientGroupId=NULL,
                              lang="en") {
  # Query nutrientgroup endpoint of the api
  output <-
    query_api(
      path = "nutrientgroup",
      apiKey = apiKey,
      id = nutrientGroupId,
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
#' @param nutrientNameId The code indicating the food name you want to search for. If null,
#' all foods and their corresponding symbols and  are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing nutrient name id, name, code, web_name and other details
#'
#' @examples
#' get_nutrientname()
#' get_nutrientname(nutrientNameId = 550)
#' get_nutrientname(nutrientNameId = 550, lang = "fr")
#'
#'
get_nutrientname <- function(apiKey=NULL,
                             nutrientNameId=NULL,
                             lang="en") {
  # Query nutrientname endpoint of the api
  output <-
    query_api(
      path = "nutrientname",
      apiKey = apiKey,
      id = nutrientNameId,
      lang = lang)

  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_nutrientsource
#'
#' Makes a query to the Canadian Nutrient File nutrientsource endpoint. This endpoint returns
#' a list of nutrient source id's and their corresponding description.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param nutrientSourceId The code indicating the nutrient source you want to search for. If null,
#' all nutrient sources are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing the id's of nutrient sources as well as their corresponding description.
#'
#' @examples
#' get_nutrientsource()
#' get_nutrientsource(nutrientSourceId = 108)
#' get_nutrientsource(nutrientSourceId = 108, lang = "fr")
get_nutrientsource <- function(apiKey = NULL,
                               nutrientSourceId = NULL,
                               lang = "en") {
  # Query the nutrientsource endpoint of the api.
  output <-
    query_api(
      path = "nutrientsource",
      apiKey = apiKey,
      id = nutrientSourceId,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}

#' get_refuseamount
#'
#' Makes a query to the Canadian Nutrient File refuseamount endpoint. This endpoint returns
#' a list of refuse amounts and name as well as the corresponding food code and description.
#' Refuse amounts correspond to the inedible portion of the food. For instance, searching for
#' food code 557 (Chicken, broiler, meat, skin, giblets and neck) will return
#' a refuse amount of 28 and its associated name is 'bone'.
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding refuse amounts are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing refuse name, refuse amount, food names and food codes.
#'
#' @examples
#' get_refuseamount()
#' get_refuseamount(foodCode = 557)
#' get_refuseamount(foodCode = 557, lang = "fr")
get_refuseamount <- function(apiKey = NULL,
                             foodCode = NULL,
                             lang = "en") {
  # Query the refuseamount endpoint of the api.
  output <-
    query_api(
      path = "refuseamount",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}


#' get_servingsize
#'
#' Makes a query to the Canadian Nutrient File servingsize endpoint. This endpoint returns
#' a list of serving sizes as well as the corresponding food code and description. The conversion
#' factor value is also given. This represents the proportion of weight between cooked edible
#' portion and raw edible portion.
#' \href{https://www.researchgate.net/publication/327790633_Cooking_conversion_factor_of_commonly_consumed_Sri_Lankan_food_items#:~:text=Conversion%20factor%20is%20the%20proportion,water%20reduction%20and%20fat%20absorption.}{conversion factor}
#'
#'
#' @param apiKey Key to access the API. Can be retrieved from
#' <https://hc-sc.api.canada.ca/en/detail?api=cnf#!/Nutrient/get_nutrientamount>.
#' If none is provided, the system environment variables will be checked.
#' @param foodCode The code indicating the food you want to search for. If null,
#' all foods and their corresponding serving sizes are returned.
#' @param lang The language to return results in, can be either 'en' or 'fr'.
#'
#' @return A tibble containing conversion factor values, food names, food codes and serving sizes.
#'
#' @examples
#' get_servingsize()
#' get_servingsize(foodCode = 45)
#' get_servingsize(foodCode = 45, lang = "fr")
get_servingsize <- function(apiKey = NULL,
                            foodCode = NULL,
                            lang = "en") {
  # Query the servingsize endpoint of the api.
  output <-
    query_api(
      path = "servingsize",
      apiKey = apiKey,
      id = foodCode,
      lang = lang
    )
  # Get a clean tibble from the results and return it.
  clean_data(output)
}
