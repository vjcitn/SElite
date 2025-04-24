\name{findOverlaps-methods}

\alias{findOverlaps-methods}

\alias{findOverlaps}
\alias{findOverlaps,RangedSElite,Vector-method}
\alias{findOverlaps,Vector,RangedSElite-method}
\alias{findOverlaps,RangedSElite,RangedSElite-method}


\title{Finding overlapping ranges in RangedSElite objects}

\description{
  This man page documents the \code{findOverlaps} methods for
  \link{RangedSElite} objects.

  \link{RangedSElite} objects also support
  \code{countOverlaps}, \code{overlapsAny}, and \code{subsetByOverlaps}
  thanks to the default methods defined in the \pkg{IRanges} package and
  to the \code{findOverlaps} methods defined in this package and documented
  below.
}

\usage{
\S4method{findOverlaps}{RangedSElite,Vector}(query, subject,
    maxgap=-1L, minoverlap=0L,
    type=c("any", "start", "end", "within", "equal"),
    select=c("all", "first", "last", "arbitrary"),
    ignore.strand=FALSE)
\S4method{findOverlaps}{Vector,RangedSElite}(query, subject,
    maxgap=-1L, minoverlap=0L,
    type=c("any", "start", "end", "within", "equal"),
    select=c("all", "first", "last", "arbitrary"),
    ignore.strand=FALSE)
}

\arguments{
  \item{query, subject}{
    One of these two arguments must be a \link{RangedSElite}
    object.
  }
  \item{maxgap, minoverlap, type}{
    See \code{?\link[GenomicRanges]{findOverlaps}} in the \pkg{GenomicRanges}
    package.
  }
  \item{select, ignore.strand}{
    See \code{?\link[GenomicRanges]{findOverlaps}} in the \pkg{GenomicRanges}
    package.
  }
}

\details{
  These methods operate on the \code{rowRanges} component of the
  \link{RangedSElite} object, which can be a
  \link[GenomicRanges]{GenomicRanges} or \link[GenomicRanges]{GRangesList}
  object.

  More precisely, if any of the above functions is passed a
  \link{RangedSElite} object thru the \code{query} and/or
  \code{subject} argument, then it behaves as if \code{rowRanges(query)}
  and/or \code{rowRanges(subject)} had been passed instead.

  See \code{?\link[GenomicRanges]{findOverlaps}} in the \pkg{GenomicRanges}
  package for the details of how \code{findOverlaps} and family operate on
  \link[GenomicRanges]{GenomicRanges} and \link[GenomicRanges]{GRangesList}
  objects.
}

\value{
  See \code{?\link[GenomicRanges]{findOverlaps}} in the \pkg{GenomicRanges}
  package.
}

\seealso{
  \itemize{
    \item \link{RangedSElite} objects.

    \item The \link[GenomicRanges]{findOverlaps} man page in the
          \pkg{GenomicRanges} package where the \code{findOverlaps} family
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

hits <- findOverlaps(rse0, rse1)
hits
stopifnot(identical(hits, findOverlaps(rowRanges(rse0), rowRanges(rse1))))
stopifnot(identical(hits, findOverlaps(rse0, rowRanges(rse1))))
stopifnot(identical(hits, findOverlaps(rowRanges(rse0), rse1)))
}

\keyword{methods}
\keyword{utilities}
