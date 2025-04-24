\name{inter-range-methods}

\alias{inter-range-methods}

\alias{isDisjoint}
\alias{isDisjoint,RangedSElite-method}

\alias{disjointBins}
\alias{disjointBins,RangedSElite-method}


\title{Inter range transformations of a RangedSElite object}

\description{
  This man page documents the \emph{inter range transformations} that are
  supported on \link{RangedSElite} objects.
}

\usage{
\S4method{isDisjoint}{RangedSElite}(x, ignore.strand=FALSE)

\S4method{disjointBins}{RangedSElite}(x, ignore.strand=FALSE)
}

\arguments{
  \item{x}{
    A \link{RangedSElite} object.
  }
  \item{ignore.strand}{
    See \code{?\link[GenomicRanges]{isDisjoint}} in the
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
\preformatted{    f(rowRanges(x), ...)
}
  where \code{f} is the name of the function and \code{...} any additional
  arguments passed to it.

  See \code{?\link[GenomicRanges]{isDisjoint}} in the \pkg{GenomicRanges}
  package for the details of how these transformations operate on a
  \link[GenomicRanges]{GenomicRanges} or \link[GenomicRanges]{GRangesList}
  object.
}

\value{
  See \code{?\link[GenomicRanges]{isDisjoint}} in the
  \pkg{GenomicRanges} package.
}

\seealso{
  \itemize{
    \item \link{RangedSElite} objects.

    \item The \link[GenomicRanges]{isDisjoint} man page in the
          \pkg{GenomicRanges} package where \emph{inter range transformations}
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
rse1 <- shift(rse0, 99*start(rse0))

isDisjoint(rse0)  # FALSE
isDisjoint(rse1)  # TRUE

bins0 <- disjointBins(rse0)
bins0
stopifnot(identical(bins0, disjointBins(rowRanges(rse0))))

bins1 <- disjointBins(rse1)
bins1
stopifnot(all(bins1 == bins1[1]))
}

\keyword{methods} 
\keyword{utilities}
