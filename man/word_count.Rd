% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/word_count.R
\name{word_count}
\alias{char_table}
\alias{character_count}
\alias{character_table}
\alias{wc}
\alias{word_count}
\title{Word Counts}
\usage{
word_count(text.var, byrow = TRUE, missing = NA, digit.remove = TRUE,
  names = FALSE)

wc(text.var, byrow = TRUE, missing = NA, digit.remove = TRUE,
  names = FALSE)

character_count(text.var, byrow = TRUE, missing = NA,
  apostrophe.remove = TRUE, digit.remove = TRUE, count.space = FALSE)

character_table(text.var, grouping.var = NULL, percent = TRUE,
  prop.by.row = TRUE, zero.replace = 0, digits = 2, ...)

char_table(text.var, grouping.var = NULL, percent = TRUE,
  prop.by.row = TRUE, zero.replace = 0, digits = 2, ...)
}
\arguments{
\item{text.var}{The text variable}

\item{byrow}{logical.  If \code{TRUE} counts by row, if \code{FALSE} counts
all words.}

\item{missing}{Value to insert for missing values (empty cells).}

\item{digit.remove}{logical.  If \code{TRUE} removes digits before counting
words.}

\item{names}{logical.  If \code{TRUE} the sentences are given as the names of
the counts.}

\item{apostrophe.remove}{logical.  If \code{TRUE} apostrophes will be counted
in the character count.}

\item{count.space}{logical.  If \code{TRUE} spaces are counted as characters.}

\item{grouping.var}{The grouping variables.  Default \code{NULL} generates
one word list for all text.  Also takes a single grouping variable or a list
of 1 or more grouping variables.}

\item{percent}{logical.  If \code{TRUE} output given as percent.  If
\code{FALSE} the output is proportion.}

\item{prop.by.row}{logical.  If \code{TRUE} applies proportional to the row.
If \code{FALSE} applies by column.}

\item{zero.replace}{Value to replace 0 values with.}

\item{digits}{Integer; number of decimal places to round when printing.}

\item{\ldots}{Other arguments passed to \code{\link[qdap]{prop}}.}
}
\value{
\code{word_count} - returns a word count by row or total.

\code{character_count} - returns a character count by row or total.

\code{character_table} - returns a list:
dataframe of character counts by grouping variable.
\item{raw}{Dataframe of the frequency of characters by grouping variable.}
\item{prop}{Dataframe of the proportion of characters by grouping variable.}
\item{rnp}{Dataframe of the frequency and proportions of characters by
grouping variable.}
\item{percent}{The value of percent used for plotting purposes.}
\item{zero.replace}{The value of zero.replace used for plotting purposes.}
}
\description{
\code{word_count} - Transcript apply word counts.

\code{character_count} - Transcript apply character counts.

\code{character_table} - Computes a table of character counts by grouping .
variable(s).
}
\note{
wc is a convenient short hand for word_count.
}
\examples{
\dontrun{
## WORD COUNT
word_count(DATA$state)
wc(DATA$state)
word_count(DATA$state, names = TRUE)
word_count(DATA$state, byrow=FALSE, names = TRUE)
sum(word_count(DATA$state))

sapply(split(raj$dialogue, raj$person), wc, FALSE) \%>\%
    sort(decreasing=TRUE) \%>\%
    list2df("wordcount", "person") \%>\%
    `[`(, 2:1)

## PLOT WORD COUNTS
raj2 <- raj
raj2$scaled <- unlist(tapply(wc(raj$dialogue), raj2$act, scale))
raj2$scaled2 <- unlist(tapply(wc(raj$dialogue), raj2$act, scale, scale = FALSE))
raj2$ID <- factor(unlist(tapply(raj2$act, raj2$act, seq_along)))

ggplot(raj2, aes(x = ID, y = scaled, fill =person)) +
    geom_bar(stat="identity") +
    facet_grid(act~.) +
    ylab("Scaled") + xlab("Turn of Talk") +
    guides(fill = guide_legend(nrow = 5, byrow = TRUE)) +
    theme(legend.position="bottom") +
    ggtitle("Scaled and Centered")


ggplot(raj2, aes(x = ID, y = scaled2, fill =person)) +
    geom_bar(stat="identity") +
    facet_grid(act~.) +
    ylab("Scaled") + xlab("Turn of Talk") +
    guides(fill = guide_legend(nrow = 5, byrow = TRUE)) +
    theme(legend.position="bottom") +
    ggtitle("Mean Difference")


raj$wc <- wc(raj$dialogue)
raj$cum.wc <- unlist(with(raj, tapply(wc, act, cumsum)))
raj$turn <- unlist(with(raj, tapply(act, act, seq_along)))
ggplot(raj, aes(y=cum.wc, x=turn)) +
    geom_step(direction = "hv") +
    facet_wrap(~act)

## CHARACTER COUNTS
character_count(DATA$state)
character_count(DATA$state, byrow=FALSE)
sum(character_count(DATA$state))

## CHARACTER TABLE
x <- character_table(DATA$state, DATA$person)
plot(x)
plot(x, label = TRUE)
plot(x, label = TRUE, text.color = "red")
plot(x, label = TRUE, lab.digits = 1, zero.replace = "PP7")

scores(x)
counts(x)
proportions(x)

plot(scores(x))
plot(counts(x))
plot(proportions(x))

## combine columns
colcomb2class(x, list(vowels = c("a", "e", "i", "o", "u")))

## char_table(DATA$state, DATA$person)
## char_table(DATA$state, DATA$person, percent = TRUE)
## character_table(DATA$state, list(DATA$sex, DATA$adult))

library(ggplot2);library(reshape2)
dat <- character_table(DATA$state, list(DATA$sex, DATA$adult))
dat2 <- colsplit2df(melt(counts(dat)), keep.orig = TRUE)
head(dat2, 15)

ggplot(data = dat2, aes(y = variable, x = value, colour=sex)) +
    facet_grid(adult~.) +
    geom_line(size=1, aes(group =variable), colour = "black") +
    geom_point()

ggplot(data = dat2, aes(x = variable, y = value)) +
    geom_bar(aes(fill = variable), stat = "identity") +
    facet_grid(sex ~ adult, margins = TRUE) +
    theme(legend.position="none")
}
}
\seealso{
\code{\link[qdap]{syllable_count}},
\code{\link[qdap]{prop}},
\code{\link[qdap]{colcomb2class}}
}
\keyword{character-count}
\keyword{word-count,}

