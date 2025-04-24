\name{RangedSElite-class}
\docType{class}

% Class
\alias{class:RangedSElite}
\alias{RangedSElite-class}
\alias{RangedSElite}

\alias{parallel_slot_names,RangedSElite-method}

% Coercion
\alias{coerce,RangedSElite,SElite-method}
\alias{coerce,SElite,RangedSElite-method}

% Accessors
\alias{rowRanges}
\alias{rowRanges,SElite-method}
\alias{rowRanges,RangedSElite-method}
\alias{rowRanges<-}
\alias{rowRanges<-,SElite,NULL-method}
\alias{rowRanges<-,RangedSElite,NULL-method}
\alias{rowRanges<-,SElite,GenomicRanges-method}
\alias{rowRanges<-,SElite,GRangesList-method}
\alias{names,RangedSElite-method}
\alias{names<-,RangedSElite-method}
\alias{dimnames<-,RangedSElite,list-method}

% GenomicRanges compatibility methods
\alias{Compare,ANY,RangedSElite-method}
\alias{Compare,RangedSElite,ANY-method}
\alias{Compare,RangedSElite,RangedSElite-method}
\alias{pcompare,ANY,RangedSElite-method}
\alias{pcompare,RangedSElite,ANY-method}
\alias{pcompare,RangedSElite,RangedSElite-method}
\alias{duplicated,RangedSElite-method}
\alias{elementMetadata,RangedSElite-method}
\alias{elementMetadata<-,RangedSElite-method}
\alias{end,RangedSElite-method}
\alias{end<-,RangedSElite-method}
\alias{granges,RangedSElite-method}
\alias{is.unsorted,RangedSElite-method}
\alias{mcols,RangedSElite-method}
\alias{mcols<-,RangedSElite-method}
\alias{order,RangedSElite-method}
\alias{ranges,RangedSElite-method}
\alias{ranges<-,RangedSElite-method}
\alias{rank,RangedSElite-method}
\alias{seqinfo,RangedSElite-method}
\alias{seqinfo<-,RangedSElite-method}
\alias{seqnames,RangedSElite-method}
\alias{sort,RangedSElite-method}
\alias{split,RangedSElite-method}
\alias{split,RangedSElite,ANY-method}
\alias{start,RangedSElite-method}
\alias{start<-,RangedSElite-method}
\alias{strand,RangedSElite-method}
\alias{strand<-,RangedSElite,ANY-method}
\alias{subset,RangedSElite-method}
\alias{width,RangedSElite-method}
\alias{width<-,RangedSElite-method}

% updateObject
\alias{updateObject,RangedSElite-method}

\title{RangedSElite objects}

\description{

  The RangedSElite class is a matrix-like container where rows
  represent ranges of interest (as a \link{GRanges} or \link{GRangesList}
  object) and columns represent samples (with sample data summarized as a
  \link{DataFrame}). A RangedSElite object contains one or more
  assays, each represented by a matrix-like object of numeric or other mode.

  RangedSElite is a subclass of \link{SElite} and,
  as such, all the methods documented in \code{?SElite}
  also work on a RangedSElite object or any
  \link{SElite} derivative. The methods documented below
  are additional methods that are specific to RangedSElite
  objects.
}

\usage{

## Constructor

# See ?SElite for the constructor function.

## Accessors

rowRanges(x, ...)
rowRanges(x, ...) <- value

## Subsetting

\S4method{subset}{RangedSElite}(x, subset, select, ...)

## rowRanges access
## see 'GRanges compatibility', below
}

\arguments{

  \item{x}{A RangedSElite object or derivative. The
    \code{rowRanges} setter will also accept a \link{SElite}
    \emph{instance} and will first coerce it to RangedSElite
    before it sets \code{value} on it.}

  \item{...}{Further arguments to be passed to or from other methods.}

  \item{value}{A \link[GenomicRanges]{GRanges} or
    \link[GenomicRanges]{GRangesList} object.}

  \item{subset}{An expression which, when evaluated in the
    context of \code{rowRanges(x)}, is a logical vector indicating
    elements or rows to keep: missing values are taken as false.}

  \item{select}{An expression which, when evaluated in the
    context of \code{colData(x)}, is a logical vector indicating
    elements or rows to keep: missing values are taken as false.}

}

\details{

  The rows of a RangedSElite object represent ranges
  (in genomic coordinates) of interest. The ranges of interest are
  described by a \link{GRanges} or a \link{GRangesList} object, accessible
  using the \code{rowRanges} function, described below. The \link{GRanges}
  and \link{GRangesList} classes contains sequence (e.g., chromosome) name,
  genomic coordinates, and strand information. Each range can be
  annotated with additional data; this data might be used to describe
  the range or to summarize results (e.g., statistics of differential
  abundance) relevant to the range. Rows may or may not have row names;
  they often will not.

}

\section{Constructor}{

  RangedSElite instances are constructed using the
  \code{SElite()} function documented in
  \code{?\link{SElite}}.

}

\section{Accessors}{

  In the code snippets below, \code{x} is a RangedSElite object
  or derivative (e.g. a \link[SingleCellExperiment]{SingleCellExperiment}
  object).

  \describe{

    \item{\code{rowRanges(x)}, \code{rowRanges(x) <- value}:}{Get or set the
      row data. \code{value} is a \code{GenomicRanges} object. Row
      names of \code{value} must be NULL or consistent with the existing
      row names of \code{x}.}
   
  }
}

\section{GRanges compatibility (rowRanges access)}{

  Many \link{GRanges} and \link{GRangesList} operations are supported on
  RangedSElite objects, using \code{rowRanges}.

  Supported operations include: \code{\link{pcompare}},
  \code{\link{duplicated}}, \code{\link{end}}, \code{\link{end<-}}, 
  \code{\link{granges}}, \code{\link{is.unsorted}}, \code{\link{match}},
  \code{\link{mcols}}, \code{\link{mcols<-}}, \code{\link{order}},
  \code{\link{ranges}}, \code{\link{ranges<-}}, \code{\link{rank}},
  \code{\link{seqinfo}}, \code{\link{seqinfo<-}}, \code{\link{seqnames}},
  \code{\link{sort}}, \code{\link{start}}, \code{\link{start<-}},
  \code{\link{strand}}, \code{\link{strand<-}},
  \code{\link{width}}, \code{\link{width<-}}.

  See also \code{?\link[SElite]{shift}},
  \code{?\link[SElite]{isDisjoint}},
  \code{?\link[SElite]{coverage}},
  \code{?\link[SElite]{findOverlaps}}, and
  \code{?\link[SElite]{nearest}} for more
  \emph{GRanges compatibility methods}.

  Not all \link{GRanges} operations are supported, because
  they do not make sense for RangedSElite objects
  (e.g., length, name, as.data.frame, c, splitAsList), involve
  non-trivial combination or splitting of rows (e.g., disjoin, gaps,
  reduce, unique), or have not yet been implemented (Ops, map, window,
  window<-).

}

\section{Subsetting}{

  In the code snippets below, \code{x} is a RangedSElite object
  or derivative (e.g. a \link[SingleCellExperiment]{SingleCellExperiment}
  object).

  \describe{

    \item{\code{subset(x, subset, select)}:}{Create a subset of \code{x}
      using an expression \code{subset} referring to columns of
      \code{rowRanges(x)} (including \sQuote{seqnames}, \sQuote{start},
      \sQuote{end}, \sQuote{width}, \sQuote{strand}, and
      \code{names(rowData(x))}) and / or \code{select} referring to
      column names of \code{colData(x)}.}

  }

}

\section{Extension}{

  RangedSElite is implemented as an S4 class, and can be
  extended in the usual way, using \code{contains="RangedSElite"}
  in the new class definition.

  See the \link[SingleCellExperiment]{SingleCellExperiment} class defined
  in the \pkg{SingleCellExperiment} package for an example of such extension.

}

\author{Martin Morgan, \url{mtmorgan@fhcrc.org}}

\seealso{
  \itemize{
    \item \link{SElite} for the parent class of
          RangedSElite and the
          RangedSElite/SElite constructor function.

    \item \link[SElite]{shift},
          \link[SElite]{isDisjoint},
          \link[SElite]{coverage},
          \link[SElite]{findOverlaps}, and
          \link[SElite]{nearest} for more
          \emph{GRanges compatibility methods}.

    \item \link[GenomicRanges]{GRanges} objects in the \pkg{GenomicRanges}
          package.

    \item The \link[SingleCellExperiment]{SingleCellExperiment} defined
          in the \pkg{SingleCellExperiment} package, a subclass of
          RangedSElite specifically designed to represent
          single-cell sequencing data.

  }
}

\examples{
nrows <- 200; ncols <- 6
counts <- matrix(runif(nrows * ncols, 1, 1e4), nrows)
rowRanges <- GRanges(rep(c("chr1", "chr2"), c(50, 150)),
                     IRanges(floor(runif(200, 1e5, 1e6)), width=100),
                     strand=sample(c("+", "-"), 200, TRUE),
                     feature_id=sprintf("ID\%03d", 1:200))
colData <- DataFrame(Treatment=rep(c("ChIP", "Input"), 3),
                     row.names=LETTERS[1:6])
rse <- SElite(assays=SimpleList(counts=counts),
                            rowRanges=rowRanges, colData=colData)
rse
dim(rse)
dimnames(rse)
assayNames(rse)
head(assay(rse))
assays(rse) <- endoapply(assays(rse), asinh)
head(assay(rse))

rowRanges(rse)
rowData(rse)  # same as 'mcols(rowRanges(rse))'
colData(rse)

rse[ , rse$Treatment == "ChIP"]

## cbind() combines objects with the same ranges but different samples:
rse1 <- rse
rse2 <- rse1[ , 1:3]
colnames(rse2) <- letters[1:ncol(rse2)] 
cmb1 <- cbind(rse1, rse2)
dim(cmb1)
dimnames(cmb1)

## rbind() combines objects with the same samples but different ranges:
rse1 <- rse
rse2 <- rse1[1:50, ]
rownames(rse2) <- letters[1:nrow(rse2)] 
cmb2 <- rbind(rse1, rse2)
dim(cmb2)
dimnames(cmb2)

## Coercion to/from SElite:
se0 <- as(rse, "SElite")
se0

as(se0, "RangedSElite")

## Setting rowRanges on a SElite object turns it into a
## RangedSElite object:
se <- se0
rowRanges(se) <- rowRanges
se  # RangedSElite

## Sanity checks:
stopifnot(identical(assays(se0), assays(rse)))
stopifnot(identical(dim(se0), dim(rse)))
stopifnot(identical(dimnames(se0), dimnames(rse)))
stopifnot(identical(rowData(se0), rowData(rse)))
stopifnot(identical(colData(se0), colData(rse)))
}
