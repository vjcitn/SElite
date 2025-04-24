### =========================================================================
### nearest (and related) methods
### -------------------------------------------------------------------------
###


### precede & follow

for (f in c("precede", "follow")) {
    setMethod(f, c("RangedSElite", "ANY"),
        function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
        {
            x <- rowRanges(x)
            callGeneric()
        }
    )
    setMethod(f, c("ANY", "RangedSElite"),
        function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
        {
            subject <- rowRanges(subject)
            callGeneric()
        }
    )
    setMethod(f, c("RangedSElite", "RangedSElite"),
        function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
        {
            x <- rowRanges(x)
            subject <- rowRanges(subject)
            callGeneric()
        }
    )
}

### nearest

setMethod("nearest", c("RangedSElite", "ANY"),
    function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
    {
        x <- rowRanges(x)
        callGeneric()
    }
)

setMethod("nearest", c("ANY", "RangedSElite"),
    function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
    {
        subject <- rowRanges(subject)
        callGeneric()
    }
)

setMethod("nearest", c("RangedSElite",
                       "RangedSElite"),
    function(x, subject, select=c("arbitrary", "all"), ignore.strand=FALSE)
    {
        x <- rowRanges(x)
        subject <- rowRanges(subject)
        callGeneric()
    }
)

### distance

setMethod("distance", c("RangedSElite", "ANY"),
    function(x, y, ignore.strand=FALSE, ...)
    {
        x <- rowRanges(x)
        callGeneric()
    }
)

setMethod("distance", c("ANY", "RangedSElite"),
    function(x, y, ignore.strand=FALSE, ...)
    {
        y <- rowRanges(y)
        callGeneric()
    }
)

setMethod("distance", c("RangedSElite",
                        "RangedSElite"),
    function(x, y, ignore.strand=FALSE, ...)
    {
        x <- rowRanges(x)
        y <- rowRanges(y)
        callGeneric()
    }
)

### distanceToNearest

setMethod("distanceToNearest", c("RangedSElite", "ANY"),
    function(x, subject, ignore.strand=FALSE, ...)
    {
        x <- rowRanges(x)
        callGeneric()
    }
)

setMethod("distanceToNearest", c("ANY", "RangedSElite"),
    function(x, subject, ignore.strand=FALSE, ...)
    {
        subject <- rowRanges(subject)
        callGeneric()
    }
)

setMethod("distanceToNearest", c("RangedSElite",
                                 "RangedSElite"),
    function(x, subject, ignore.strand=FALSE, ...)
    {
        x <- rowRanges(x)
        subject <- rowRanges(subject)
        callGeneric()
    }
)

