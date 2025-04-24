### =========================================================================
### Inter-range methods
### -------------------------------------------------------------------------
###


setMethod("isDisjoint", "RangedSElite",
    function(x, ignore.strand=FALSE)
    {
        x <- rowRanges(x)
        callGeneric()
    }
)

setMethod("disjointBins", "RangedSElite",
    function(x, ignore.strand = FALSE)
    {
        x <- rowRanges(x)
        callGeneric()
    }
)

