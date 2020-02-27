#' @title create_obj
#'
#' @description A fucntion to create a value or an object that you can upload to the leancloud database
#'
#' @param web Character. Your leancloud database RESTFUL API. You can find it in leancloud website-console-setting-app keys
#'
#' @param obj_name Character. The name of the object or value that you want to create
#'
#' @param ID AppID. Character. You can find it in leancloud website-console-setting-app keys
#'
#' @param KEY AppKey. Character. You can find it in leancloud website-console-setting-app keys
#'
#' @param type Format of the object or value you uploaded (how the database formats the object you uploaded)
#'
#' @param up_df Whether the value or the object you uploaded is a dataframe
#'
#'
#' @importFrom  httr POST
#'
#' @importFrom  httr add_headers
#'
#' @importFrom pingr is_online
#'
#'








create_obj <- function(web,obj_name,body,ID,KEY,type="application/json",up_df=F){

  if (is.character(web)==FALSE|is.character(ID)==FALSE|is.character(KEY)==FALSE){
    stop("Please input characters, but not symbols")
  }

  if(is_online()==FALSE){
    stop("Cannot connect the internet, please check your internet connection")
  }
  site <- paste0(web,"/1.1/classes/",obj_name)

  if(up_df==T){

    stopifnot(is.data.frame(body),{print("Please input a datarame")})

    body <- toJSON(body)
  }


  obj <- tryCatch(POST(site,add_headers('X-LC-Id'=ID,'X-LC-Key'=KEY,'Content-Type'=type),body=body)

                  ,error=function(e){stop("Please check whether you input a correct server URL")})


  if(obj$status_code==401){
    stop("Please check whether you input an correct AppID, a AppKEY or a server URL")
  }

  if(obj$status_code==400){
    stop("The server cannot or will not process the request. This error may be due to the format of the content that you are trying to upload ")
  }

  if(obj$status_code==201){
    message("Object uploaded successfully")
  }

}
