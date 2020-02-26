#' @title js_data_get
#'
#' @description This function is to transfer the json object retrieved from get_obj function to a dataframe.
#'
#' @param obj a js_data object from get_obj funtion
#'
#' @param order the order of the object in the database from left to right apart from object ID, default is 1
#'
#' @export


js_data_get.js_data <- function(obj,order=1){

    UseMethod("js_data_ret")

}
