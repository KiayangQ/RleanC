% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_obj.R
\name{create_obj}
\alias{create_obj}
\title{create_obj}
\usage{
create_obj(web, obj_name, body, ID, KEY, type = "application/json",
  up_df = F)
}
\arguments{
\item{web}{Character. Your leancloud database RESTFUL API. You can find it in leancloud website-console-setting-app keys}

\item{obj_name}{Character. The name of the object or value that you want to create}

\item{ID}{AppID. Character. You can find it in leancloud website-console-setting-app keys}

\item{KEY}{AppKey. Character. You can find it in leancloud website-console-setting-app keys}

\item{type}{Format of the object or value you uploaded (how the database formats the object you uploaded)}

\item{up_df}{Whether the value or the object you uploaded is a dataframe}
}
\description{
A fucntion to create a value or an object that you can upload to the leancloud database
}
