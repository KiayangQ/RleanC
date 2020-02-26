#' @title get_obj
#'
#' @description This function is a simple wrapper of leancloud RESTful API to retrieve a value or a object from leancloud database.
#'
#' @param web Your leancloud database RESTFUL API. You can find it in leancloud website-console-setting-app keys
#'
#' @param query The name of the object that you want to retrieve
#'
#' @param ID AppID, You can find it in leancloud website-console-setting-app keys
#'
#' @param KEY AppKey, You can find it in leancloud website-console-setting-app keys
#'
#' @param returnjs This paradigm indicate whether return a js_data object for further data extraction
#'
#' @import httr
#'
#' @importFrom pingr is_online
#'
#' @import magrittr
#'
#' @importFrom jsonlite fromJSON
#'
#' @export




get_obj <- function(web,query,ID,KEY,returnjs=T){

  if (is.character(web)==FALSE|is.character(ID)==FALSE|is.character(KEY)==FALSE){
    stop("Please input characters, but not symbols")
  }

  if(is_online()==FALSE){
    stop("Cannot connect the internet, please check your internet connection")
  }
  site <- paste0(web,"/1.1/classes/",query)
  obj <- tryCatch(GET(site,add_headers('X-LC-Id'=ID,'X-LC-Key'=KEY))

   ,error=function(e){stop("Please check whether you input a correct server URL")})


  if(obj$status_code==401){
    stop("Unauthorized query.Please check whether you input an correct AppID, a AppKEY or a server URL")
  }

  if(obj$status_code==404){
    stop("The object you queried dose not exist")
  }

  obj <- content(obj,"text")

  obj_json <- obj %>% fromJSON()

  p_num <- length(obj_json$results$objectId)

  if (returnjs==T){
    obj <- structure(list(participants_num=p_num,obj=obj),class="js_data")
  }

  return(obj)
}
