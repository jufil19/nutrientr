get_nutrientamount <- function(apiKey=NULL,food_code=NULL){
  nutrient_amount_uncleaned <-query_api("nutrientamount",apiKey,id=food_code)
  nutrient_cleaned <- clean_data(nutrient_amount_uncleaned)
  nutrient_cleaned
}

data <-get_nutrientamount(apiKey="4ed46e31519f0bb5b7a66a5d350a4f1c",food_code=c(4,5,7,8))


