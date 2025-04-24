\name{makeSEliteFromExpressionSet}

\alias{makeSEliteFromExpressionSet}
\alias{naiveRangeMapper}
\alias{probeRangeMapper}
\alias{geneRangeMapper}
\alias{coerce,ExpressionSet,RangedSElite-method}
\alias{coerce,ExpressionSet,SElite-method}
\alias{coerce,RangedSElite,ExpressionSet-method}
\alias{coerce,SElite,ExpressionSet-method}


\title{Make a RangedSElite object from an ExpressionSet and
       vice-versa}

\description{
  Coercion between \link{RangedSElite} and
  \link[Biobase]{ExpressionSet} is supported in both directions.

  For going from \link[Biobase]{ExpressionSet} to
  \link{RangedSElite}, the
  \code{makeSEliteFromExpressionSet} function is also
  provided to let the user control how to map features to ranges.
}

\usage{
makeSEliteFromExpressionSet(from,
                                          mapFun=naiveRangeMapper,
                                          ...)

## range mapping functions
naiveRangeMapper(from)
probeRangeMapper(from)
geneRangeMapper(txDbPackage, key = "ENTREZID")
}

\arguments{
  \item{from}{
    An \link[Biobase]{ExpressionSet} object.
  }
  \item{mapFun}{
    A function which takes an \link[Biobase]{ExpressionSet} object and
    returns a \link{GRanges}, or \link{GRangesList} object which
    corresponds to the genomic ranges used in the ExpressionSet.  The
    \link[base]{rownames} of the returned \link[GenomicRanges]{GRanges}
    are used to match the \link[Biobase]{featureNames} of the
    \link[Biobase]{ExpressionSet}.

    The \code{naiveRangeMapper} function is used by default.
  }
  \item{...}{
    Additional arguments passed to \code{mapFun}.
  }
  \item{txDbPackage}{
    A character string with the Transcript Database to use for the mapping.
  }
  \item{key}{
    A character string with the Gene key to use for the mapping.
  }
}

\value{
  \code{makeSEliteFromExpressionSet} takes an
  \link[Biobase]{ExpressionSet} object as input and a \emph{range mapping
  function} that maps the features to ranges.  It then returns a
  \link{RangedSElite} object that corresponds to the input.

  The range mapping functions return a \link{GRanges} object, with the
  \code{rownames} corresponding to the \link[Biobase]{featureNames} of
  the \link[Biobase]{ExpressionSet} object.
}

\author{Jim Hester, \url{james.f.hester@gmail.com}}

\seealso{
  \itemize{
    \item \link{RangedSElite} objects.

    \item \link[Biobase]{ExpressionSet} objects in the \pkg{Biobase} package.

    \item \link[GenomicFeatures]{TxDb} objects in the \pkg{GenomicFeatures}
          package.
  }
}

\examples{
## ---------------------------------------------------------------------
## GOING FROM ExpressionSet TO SElite
## ---------------------------------------------------------------------

data(sample.ExpressionSet, package="Biobase")

# naive coercion
makeSEliteFromExpressionSet(sample.ExpressionSet)
as(sample.ExpressionSet, "RangedSElite")
as(sample.ExpressionSet, "SElite")

# using probe range mapper
makeSEliteFromExpressionSet(sample.ExpressionSet, probeRangeMapper)

# using the gene range mapper
se <- makeSEliteFromExpressionSet(
    sample.ExpressionSet,
    geneRangeMapper("TxDb.Hsapiens.UCSC.hg19.knownGene")
)
se
rowData(se)  # duplicate row names

## ---------------------------------------------------------------------
## GOING FROM SElite TO ExpressionSet
## ---------------------------------------------------------------------

example(RangedSElite)  # to create 'rse'
rse
as(rse, "ExpressionSet")
}

\keyword{manip}
