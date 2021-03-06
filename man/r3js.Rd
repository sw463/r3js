% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/r3js.R
\name{r3js}
\alias{r3js}
\title{Plot a data3js object}
\usage{
r3js(data3js, rotation = NULL, zoom = NULL, translation = NULL, ...)
}
\arguments{
\item{data3js}{The data3js object}

\item{rotation}{Plot starting rotation}

\item{zoom}{Plot starting zoom factor}

\item{translation}{Plot starting translation}

\item{...}{Additional arguments to pass to `htmlwidgets::createWidget()`}
}
\value{
Returns an html widget of the plot
}
\description{
This function takes the assembled data3js object and plots it as an
htmlwidget.
}
