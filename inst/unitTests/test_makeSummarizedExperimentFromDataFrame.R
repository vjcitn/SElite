##

rowNames <- paste0("GENE", letters[5:1])

range_info <- list(chr="chr2", start = 11:15, end = 12:16,
                      strand = c("+", "-", "+", "*", "."))
expr_info <- list(expr0 = 3:7, expr1 = 8:12, expr2 = 12:16)

df <- as.data.frame(c(range_info, expr_info), row.names = rowNames)
DF <- DataFrame(c(range_info, expr_info), row.names = rowNames)

test_makeSEliteFromDataFrame <- function()
{
    validObject(makeSEliteFromDataFrame(df))
    validObject(makeSEliteFromDataFrame(DF))

    rangesA <- GRanges(as.data.frame(range_info, row.names = rowNames))
    rangesB <- rowRanges(makeSEliteFromDataFrame(df))
    # Check rowRanges to be identical
    checkIdentical(rangesA, rangesB)
    # Check assay matrix and expr_info matrix are identical
    checkIdentical(assay(makeSEliteFromDataFrame(df)),
                   as.matrix(as.data.frame(expr_info, row.names = rowNames)))
    checkIdentical(assay(makeSEliteFromDataFrame(DF)),
                   as.matrix(as.data.frame(expr_info, row.names = rowNames)))

    checkEquals(makeSEliteFromDataFrame(df),
                makeSEliteFromDataFrame(DF))

    checkException(
        makeSEliteFromDataFrame(
            cbind(df, expr3 = letters[seq_len(nrow(df))])))

    checkException(
        makeSEliteFromDataFrame(
            cbind(DF, DataFrame(expr3 = letters[seq_len(nrow(df))]))))

    checkIdentical(nrow(df),
                   length(rowRanges(
                       makeSEliteFromDataFrame(df))))

    checkIdentical(nrow(DF),
                   length(rowRanges(
                       makeSEliteFromDataFrame(DF))))

    checkIdentical(colnames(makeSEliteFromDataFrame(df)),
                   names(expr_info))
    checkIdentical(rownames(makeSEliteFromDataFrame(df)),
                   rowNames)

    checkIdentical(colnames(makeSEliteFromDataFrame(DF)),
                   names(expr_info))
    checkIdentical(rownames(makeSEliteFromDataFrame(DF)),
                   rowNames)
}

