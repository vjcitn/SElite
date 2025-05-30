\name{intra-range-methods}

\alias{intra-range-methods}

\alias{shift}
\alias{shift,RangedSElite-method}

\alias{narrow}
\alias{narrow,RangedSElite-method}

\alias{resize}
\alias{resize,RangedSElite-method}

\alias{flank}
\alias{flank,RangedSElite-method}

\alias{promoters}
\alias{terminators}
\alias{promoters,RangedSElite-method}
\alias{terminators,RangedSElite-method}

\alias{restrict}
\alias{restrict,RangedSElite-method}

\alias{trim,RangedSElite-method}


\title{Intra range transformations of a RangedSElite object}

\description{
  This man page documents the \emph{intra range transformations} that are
  supported on \link{RangedSElite} objects.
}

\usage{
\S4method{shift}{RangedSElite}(x, shift=0L, use.names=TRUE)

\S4method{narrow}{RangedSElite}(x, start=NA, end=NA, width=NA, use.names=TRUE)

\S4method{resize}{RangedSElite}(x, width, fix="start", use.names=TRUE,
       ignore.strand=FALSE)

\S4method{flank}{RangedSElite}(x, width, start=TRUE, both=FALSE,
      use.names=TRUE, ignore.strand=FALSE)

\S4method{promoters}{RangedSElite}(x, upstream=2000, downstream=200)
\S4method{terminators}{RangedSElite}(x, upstream=2000, downstream=200)

\S4method{restrict}{RangedSElite}(x, start=NA, end=NA, keep.all.ranges=FALSE,
         use.names=TRUE)

\S4method{trim}{RangedSElite}(x, use.names=TRUE)
}

\arguments{
  \item{x}{
    A \link{RangedSElite} object.
  }
  \item{shift, use.names, start, end, width, fix, ignore.strand, both,
        upstream, downstream, keep.all.ranges}{
    See \code{?GenomicRanges::\link[GenomicRanges]{shift}} in the
    \pkg{GenomicRanges} package.
  }
}

\details{
  These transformations operate on the \code{rowRanges} component of the
  \link{RangedSElite} object, which can be a
  \link[GenomicRanges]{GenomicRanges} or \link[GenomicRanges]{GRangesList}
  object.

  More precisely, any of the above functions performs the following
  transformation on \link{RangedSElite} object \code{x}:
\preformatted{    rowRanges(x) <- f(rowRanges(x), ...)
}
  where \code{f} is the name of the function and \code{...} any additional
  arguments passed to it.

  See \code{?GenomicRanges::\link[GenomicRanges]{shift}} in the
  \pkg{GenomicRanges} package for the details of how these transformations
  operate on a \link[GenomicRanges]{GenomicRanges} or
  \link[GenomicRanges]{GRangesList}
  object.
}

\seealso{
  \itemize{
    \item \link{RangedSElite} objects.

    \item The \code{\link[GenomicRanges]{shift}} man page in the
          \pkg{GenomicRanges} package where \emph{intra range transformations}
          of a \link[GenomicRanges]{GenomicRanges} or
          \link[GenomicRanges]{GRangesList} object are documented.
  }
}

\examples{
nrows <- 20; ncols <- 6
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)
rowRanges <- GRanges(rep(c("chr1", "chr2"), c(5, 15)),
                     IRanges(sample(1000L, 20), width=100),
                     strand=Rle(c("+", "-"), c(12, 8)))
colData <- DataFrame(Treatment=rep(c("ChIP", "Input"), 3),
                     row.names=LETTERS[1:6])
rse0 <- SElite(assays=SimpleList(counts=counts),
                             rowRanges=rowRanges, colData=colData)

rse1 <- shift(rse0, 1)
stopifnot(identical(
  rowRanges(rse1),
  shift(rowRanges(rse0), 1)
))

se2 <- narrow(rse0, start=10, end=-15)
stopifnot(identical(
  rowRanges(se2),
  narrow(rowRanges(rse0), start=10, end=-15)
))

se3 <- resize(rse0, width=75)
stopifnot(identical(
  rowRanges(se3),
  resize(rowRanges(rse0), width=75)
))

se4 <- flank(rse0, width=20)
stopifnot(identical(
  rowRanges(se4),
  flank(rowRanges(rse0), width=20)
))

se5 <- promoters(rse0, upstream=85, downstream=50)
stopifnot(identical(
  rowRanges(se5),
  promoters(rowRanges(rse0), upstream=85, downstream=50)
))

se6 <- terminators(rse0, upstream=85, downstream=50)
stopifnot(identical(
  rowRanges(se6),
  terminators(rowRanges(rse0), upstream=85, downstream=50)
))

se7 <- restrict(rse0, start=200, end=700, keep.all.ranges=TRUE)
stopifnot(identical(
  rowRanges(se7),
  restrict(rowRanges(rse0), start=200, end=700, keep.all.ranges=TRUE)
))
}

\keyword{methods}
\keyword{utilities}
