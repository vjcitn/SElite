\name{nearest-methods}

\alias{nearest-methods}

\alias{precede}
\alias{precede,RangedSElite,ANY-method}
\alias{precede,ANY,RangedSElite-method}
\alias{precede,RangedSElite,RangedSElite-method}

\alias{follow}
\alias{follow,RangedSElite,ANY-method}
\alias{follow,ANY,RangedSElite-method}
\alias{follow,RangedSElite,RangedSElite-method}

\alias{nearest}
\alias{nearest,RangedSElite,ANY-method}
\alias{nearest,ANY,RangedSElite-method}
\alias{nearest,RangedSElite,RangedSElite-method}

\alias{distance}
\alias{distance,RangedSElite,ANY-method}
\alias{distance,ANY,RangedSElite-method}
\alias{distance,RangedSElite,RangedSElite-method}

\alias{distanceToNearest}
\alias{distanceToNearest,RangedSElite,ANY-method}
\alias{distanceToNearest,ANY,RangedSElite-method}
\alias{distanceToNearest,RangedSElite,RangedSElite-method}


\title{Finding the nearest range neighbor in RangedSElite objects}

\description{
  This man page documents the \code{nearest} methods and family (i.e.
  \code{precede}, \code{follow}, \code{distance}, and \code{distanceToNearest}
  methods) for \link{RangedSElite} objects.
}

\usage{
\S4method{precede}{RangedSElite,ANY}(x, subject, select=c("arbitrary", "all"),
        ignore.strand=FALSE)
\S4method{precede}{ANY,RangedSElite}(x, subject, select=c("arbitrary", "all"),
        ignore.strand=FALSE)

\S4method{follow}{RangedSElite,ANY}(x, subject, select=c("arbitrary", "all"),
        ignore.strand=FALSE)
\S4method{follow}{ANY,RangedSElite}(x, subject, select=c("arbitrary", "all"),
        ignore.strand=FALSE)

\S4method{nearest}{RangedSElite,ANY}(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
\S4method{nearest}{ANY,RangedSElite}(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)

\S4method{distance}{RangedSElite,ANY}(x, y, ignore.strand=FALSE, ...)
\S4method{distance}{ANY,RangedSElite}(x, y, ignore.strand=FALSE, ...)

\S4method{distanceToNearest}{RangedSElite,ANY}(x, subject, ignore.strand=FALSE, ...)
\S4method{distanceToNearest}{ANY,RangedSElite}(x, subject, ignore.strand=FALSE, ...)
}

\arguments{
  \item{x, subject}{
    One of these two arguments must be a \link{RangedSElite}
    object.
  }
  \item{select, ignore.strand}{
    See \code{?\link[GenomicRanges]{nearest}} in the \pkg{GenomicRanges}
    package.
  }
  \item{y}{
    For the \code{distance} methods, one of \code{x} or \code{y} must be a
    \link{RangedSElite} object.
  }
  \item{...}{Additional arguments for methods.}
}

\details{
  These methods operate on the \code{rowRanges} component of the
  \link{RangedSElite} object, which can be a
  \link[GenomicRanges]{GenomicRanges} or \link[GenomicRanges]{GRangesList}
  object.

  More precisely, if any of the above functions is passed a
  \link{RangedSElite} object thru the \code{x}, \code{subject},
  and/or \code{y} argument, then it behaves as if \code{rowRanges(x)},
  \code{rowRanges(subject)}, and/or \code{rowRanges(y)} had been passed
  instead.

  See \code{?\link[GenomicRanges]{nearest}} in the \pkg{GenomicRanges}
  package for the details of how \code{nearest} and family operate on
  \link[GenomicRanges]{GenomicRanges} and \link[GenomicRanges]{GRangesList}
  objects.
}

\value{
  See \code{?\link[GenomicRanges]{nearest}} in the \pkg{GenomicRanges}
  package.
}

\seealso{
  \itemize{
    \item \link{RangedSElite} objects.

    \item The \link[GenomicRanges]{nearest} man page in the
          \pkg{GenomicRanges} package where the \code{nearest} family
          of methods for \link[GenomicRanges]{GenomicRanges} and
          \link[GenomicRanges]{GRangesList} objects is documented.
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
rse1 <- shift(rse0, 100)

res <- nearest(rse0, rse1)
res
stopifnot(identical(res, nearest(rowRanges(rse0), rowRanges(rse1))))
stopifnot(identical(res, nearest(rse0, rowRanges(rse1))))
stopifnot(identical(res, nearest(rowRanges(rse0), rse1)))

res <- nearest(rse0)  # missing subject
res
stopifnot(identical(res, nearest(rowRanges(rse0))))

hits <- nearest(rse0, rse1, select="all")
hits
stopifnot(identical(
  hits,
  nearest(rowRanges(rse0), rowRanges(rse1), select="all")
))
stopifnot(identical(
  hits,
  nearest(rse0, rowRanges(rse1), select="all")
))
stopifnot(identical(
  hits,
  nearest(rowRanges(rse0), rse1, select="all")
))
}

\keyword{methods} 
\keyword{utilities}
