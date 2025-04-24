### =========================================================================
### findOverlaps methods
### -------------------------------------------------------------------------


### findOverlaps

setMethod("findOverlaps", c("RangedSElite", "Vector"),
    function(query, subject, maxgap=-1L, minoverlap=0L,
             type=c("any", "start", "end", "within", "equal"),
             select=c("all", "first", "last", "arbitrary"),
             ignore.strand=FALSE)
    {
        query <- rowRanges(query)
        callGeneric()
    }
)

setMethod("findOverlaps", c("Vector", "RangedSElite"),
    function(query, subject, maxgap=-1L, minoverlap=0L,
             type=c("any", "start", "end", "within", "equal"),
             select=c("all", "first", "last", "arbitrary"),
             ignore.strand=FALSE)
    {
        subject <- rowRanges(subject)
        callGeneric()
    }
)

setMethod("findOverlaps", c("RangedSElite",
                            "RangedSElite"),
    function(query, subject, maxgap=-1L, minoverlap=0L,
             type=c("any", "start", "end", "within", "equal"),
             select=c("all", "first", "last", "arbitrary"),
             ignore.strand=FALSE)
    {
        query <- rowRanges(query)
        subject <- rowRanges(subject)
        callGeneric()
    }
)

