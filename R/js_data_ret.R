#' @title Original function
#'
#' @param obj a js_data object from get_obj funtion
#'
#' @param order the order of the object in the database from left to right apart from object ID, default is 1
#'
#' @importFrom purrr map
#'
#' @importFrom  magrittr %>%
#'
#' @importFrom jsonlite fromJSON
#'
#' @importFrom jsonlite rbind_pages
#'
#'
js_data_ret <- function(obj,order=1){
  if (class(obj)!="js_data"){

    stop("Please input a valid js_data object, use the output of get_obj and set returnjs=T")}


data <- obj$obj %>% fromJSON()

num <- length(data$results[[order]][[1]]$trial_index)

num_p <- length(data$results$objectId)

index <- seq(1,num_p) %>% rep(num) %>% sort(decreasing = FALSE)

par_id <- map("participants_",function(x){paste0(x,index)}) %>% unlist()

data_clean <- rbind_pages(data$results[[order]])

data1 <-cbind(par_id,data_clean)

return(data1)

}
