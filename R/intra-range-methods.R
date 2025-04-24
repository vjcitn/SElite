### =========================================================================
### Intra-range methods
### -------------------------------------------------------------------------
###


setMethod("shift", "RangedSElite",
    function(x, shift=0L, use.names=TRUE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("narrow", "RangedSElite",
    function(x, start=NA, end=NA, width=NA, use.names=TRUE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("resize", "RangedSElite",
    function(x, width, fix="start", use.names=TRUE, ignore.strand=FALSE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("flank", "RangedSElite", 
    function(x, width, start=TRUE, both=FALSE, use.names=TRUE,
             ignore.strand=FALSE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("promoters", "RangedSElite",
    function(x, upstream=2000, downstream=200)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("terminators", "RangedSElite",
    function(x, upstream=2000, downstream=200)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

### Because 'keep.all.ranges' is FALSE by default, it will break if some
### ranges are dropped.
setMethod("restrict", "RangedSElite",
    function(x, start=NA, end=NA, keep.all.ranges=FALSE, use.names=TRUE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

setMethod("trim", "RangedSElite",
    function(x, use.names=TRUE)
    {
        x0 <- x
        x <- rowRanges(x)
        rowRanges(x0) <- callGeneric()
        x0
    }
)

