#' @title Original function
#'
#' @importFrom purrr map
#'
#' @import magrittr
#'
#' @import jsonlite
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
