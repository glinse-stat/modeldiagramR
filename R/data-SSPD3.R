#' Simulated data for a split-split-plot experimental design.
#'
#' The data is simulated using [modeldiagramR::simulate_SSPD3_data()]
#'
#' @format a \code{data.frame} with 120 observations on 13 variables:
#' \describe{
#'   \item{ID}{Observation/split-split-plot identification number, numeric}
#'   \item{LOCATION}{One of three locations "A", "B", and "C", a blocking variable, categorical}
#'   \item{PLOT}{Plot identification variable, one for each location and whole plot combination, numeric}
#'   \item{REP}{Replication number, all 1 as there was no replication, integer}
#'   \item{WHOLE_PLOT}{Treatment, whether or not the plot was irrigated "IRR_NO" for not irrigated and "IRR_YES" for irrigated, categorical}
#'   \item{SPLIT_PLOT}{Treatment, fungicide applied to split-plot, 4 fungicides and one control, "Fung1", ..., "Fung4", and "NFung", categorical}
#'   \item{SPLIT_SPLIT_PLOT}{Treatment, variety of bean seeded in split-split-plot, 4 varieties, "Beans1", ..., "Beans4", categorical}
#'   \item{TRT_COMB}{Treatments combined over WHOLE_PLOT, SPLIT_PLOT, and SPLIT_SPLIT_PLOT}
#'   \item{RESP}{Simulated response, not based on a meaningful input values, numeric}
#'   \item{LocationF}{Factor version of LOCATION}
#'   \item{Irrigation}{Factor version of WHOLE_PLOT treatment}
#'   \item{Fungicide}{Factor version of SPLIT_PLOT treatment}
#'   \item{Variety}{Factor version of SPLIT_SPLIT_PLOT treatment}
#' }
#'
#' @name SSPD3
#' @docType data
#' @references Murillo D, Gezan S (2024). _FielDHub: A Shiny App for Design of Experiments in Life Sciences_. R package version 1.4.2, <https://CRAN.R-project.org/package=FielDHub>.
#' @keywords data split-split-plot experimental design
#' @examples
#' data("SSPD3")
#'
#' # Simple model for testing
#' library(nlme)
#' lme_simple <- lme(RESP ~ Fungicide + Variety, random=~1|LOCATION/WHOLE_PLOT,
#'                      data=SSPD3)
#' model_diagram(lme_simple)
#'
#' \donttest{
#' # Intended full model
#' aov_results <- aov(RESP ~ Irrigation*Fungicide*Variety + Error(LOCATION/WHOLE_PLOT/SPLIT_PLOT),
#'                    data=SSPD3)
#' summary(aov_results)
#' library(lme4)
#' library(modeldiagramR)
#' lmer_results <- lmer(RESP ~ Irrigation*Fungicide*Variety + (1|LOCATION/WHOLE_PLOT/SPLIT_PLOT),
#'                      data=SSPD3)
#' summary(lmer_results)
#'
#' anova(lmer_results)
#'
#' model_diagram(lmer_results)
#'
#' model_diagram(lmer_results, width = 800, height=400, orientation="horizontal",
#'               shiftFixed = 2, shiftRandom = 5, scaleFontSize = 2)
#' }
"SSPD3"
