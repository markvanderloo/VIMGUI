\name{TKRparcoordMiss}
\alias{TKRparcoordMiss}
\title{Parallel coordinate plot with information about missing/imputed values}
\usage{
  TKRparcoordMiss(x, delimiter = NULL, highlight = NULL,
    selection = c("any", "all"), plotvars = NULL,
    plotNA = TRUE,
    col = c("skyblue", "red", "skyblue4", "red4", "orange", "orange4"),
    alpha = NULL, hscale = NULL, vscale = 1,
    TKRpar = list(), ...)
}
\arguments{
  \item{x}{a matrix or \code{data.frame}.}

  \item{delimiter}{a character-vector to distinguish
  between variables and imputation-indices for imputed
  variables (therefore, \code{x} needs to have
  \code{\link{colnames}}). If given, it is used to
  determine the corresponding imputation-index for any
  imputed variable (a logical-vector indicating which
  values of the variable have been imputed). If such
  imputation-indices are found, they are used for
  highlighting and the colors are adjusted according to the
  given colors for imputed variables (see \code{col}).}

  \item{highlight}{a vector giving the variables to be used
  for highlighting. If \code{NULL} (the default), all
  variables are used for highlighting.}

  \item{selection}{the selection method for highlighting
  missing/imputed values in multiple highlight variables.
  Possible values are \code{"any"} (highlighting of
  missing/imputed values in \emph{any} of the highlight
  variables) and \code{"all"} (highlighting of
  missing/imputed values in \emph{all} of the highlight
  variables).}

  \item{plotvars}{a vector giving the variables to be
  plotted.  If \code{NULL} (the default), all variables are
  plotted.}

  \item{col}{if \code{plotNA} is \code{TRUE}, a vector of
  length six giving the colors to be used for observations
  with different combinations of observed and
  missing/imputed values in the plot variables and
  highlight variables (vectors of length one or two are
  recycled).  Otherwise, a vector of length two giving the
  colors for non-highlighted and highlighted observations
  (if a single color is supplied, it is used for both).}

  \item{plotNA}{a logical indicating whether missing values
  in the plot variables should be represented by a point
  above the corresponding coordinate axis to prevent
  disconnected lines.}

  \item{alpha}{a numeric value between 0 and 1 giving the
  level of transparency of the colors, or \code{NULL}.
  This can be used to prevent overplotting.}

  \item{\dots}{for \code{parcoordMiss}, further graphical
  parameters to be passed down (see
  \code{\link[graphics]{par}}).  For
  \code{TKRparcoordMiss}, further arguments to be passed to
  \code{parcoordMiss}.}

  \item{hscale}{horizontal scale factor for plot to be
  embedded in a \emph{Tcl/Tk} window (see
  \sQuote{Details}).  The default value depends on the
  number of variables.}

  \item{vscale}{vertical scale factor for the plot to be
  embedded in a \emph{Tcl/Tk} window (see
  \sQuote{Details}).}

  \item{TKRpar}{a list of graphical parameters to be set
  for the plot to be embedded in a \emph{Tcl/Tk} window
  (see \sQuote{Details} and \code{\link[graphics]{par}}).}
}
\description{
  Parallel coordinate plot with adjustments for
  missing/imputed values. Missing values in the plotted
  variables may be represented by a point above the
  corresponding coordinate axis to prevent disconnected
  lines. In addition, observations with missing/imputed
  values in selected variables may be highlighted.
}
\details{
  In parallel coordinate plots, the variables are
  represented by parallel axes.  Each observation of the
  scaled data is shown as a line.  Observations with
  missing/imputed values in selected variables may thereby
  be highlighted.  However, plotting variables with missing
  values results in disconnected lines, making it
  impossible to trace the respective observations across
  the graph.  As a remedy, missing values may be
  represented by a point above the corresponding coordinate
  axis, which is separated from the main plot by a small
  gap and a horizontal line, as determined by
  \code{plotNA}.  Connected lines can then be drawn for all
  observations.  Nevertheless, a caveat of this display is
  that it may draw attention away from the main
  relationships between the variables.

  If \code{interactive} is \code{TRUE}, it is possible
  switch between this display and the standard display
  without the separate level for missing values by clicking
  in the top margin of the plot. In addition, the variables
  to be used for highlighting can be selected
  interactively.  Observations with missing/imputed values
  in any or in all of the selected variables are
  highlighted (as determined by \code{selection}).  A
  variable can be added to the selection by clicking on a
  coordinate axis.  If a variable is already selected,
  clicking on its coordinate axis removes it from the
  selection. Clicking anywhere outside the plot region
  (except the top margin, if missing/imputed values exist)
  quits the interactive session.

  \code{TKRparcoordMiss} behaves like \code{parcoordMiss},
  but uses \code{\link[tkrplot]{tkrplot}} to embed the plot
  in a \emph{Tcl/Tk} window. This is useful if the number
  of variables is large, because scrollbars allow to move
  from one part of the plot to another.
}
\note{
  Some of the argument names and positions have changed
  with versions 1.3 and 1.4 due to extended functionality
  and for more consistency with other plot functions in
  \code{VIM}.  For back compatibility, the arguments
  \code{colcomb} and \code{xaxlabels} can still be supplied
  to \code{\dots{}} and are handled correctly.
  Nevertheless, they are deprecated and no longer
  documented.  Use \code{highlight} and \code{labels}
  instead.
}
\examples{
data(chorizonDL, package = "VIM")
## for missing values
parcoordMiss(chorizonDL[,c(15,101:110)],
    plotvars=2:11, interactive = FALSE)
legend("top", col = c("skyblue", "red"), lwd = c(1,1),
    legend = c("observed in Bi", "missing in Bi"))

## for imputed values
parcoordMiss(kNN(chorizonDL[,c(15,101:110)]), delimiter = "_imp" ,
    plotvars=2:11, interactive = FALSE)
legend("top", col = c("skyblue", "orange"), lwd = c(1,1),
    legend = c("observed in Bi", "imputed in Bi"))
}
\author{
  Andreas Alfons, Matthias Templ, modifications by Bernd
  Prantner
}
\references{
  Wegman, E. J. (1990) Hyperdimensional data analysis using
  parallel coordinates. \emph{Journal of the American
  Statistical Association} \bold{85 (411)}, 664--675.

  M. Templ, A. Alfons, P. Filzmoser (2012) Exploring
  incomplete data using visualization tools.  \emph{Journal
  of Advances in Data Analysis and Classification}, Online
  first. DOI: 10.1007/s11634-011-0102-y.
}
\seealso{
  \code{\link{pbox}}
}
\keyword{hplot}

