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
#' @examples
#' get_key()
get_key <- function() {
  key <- Sys.getenv("CN_API")
  if (key == "") {
    stop("An API key is required. Please set environment variable `CN_API` to your API key as so : `Sys.setenv(CN_API = 'your_key')` or pass
          an API key as an argument to the function. An API key can be acquired at <https://hc-sc.api.canada.ca/en/detail?api=cnf>", call. = FALSE)
  }

  key
}
