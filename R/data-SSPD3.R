#' Simulated data for a split-split-plot experimental design.
#'
#' The code used to simulate the data is included in the examples below.#'
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
#' \dontrun{
#' library(tidyverse)
#' library(FielDHub)
#' wp <- paste("IRR_", c("NO", "Yes"), sep = "") #Irrigation (2 Whole plots)
#' sp <- c("NFung", paste("Fung", 1:4, sep = "")) #Fungicides (5 Sub plots)
#' ssp <- paste("Beans", 1:4, sep = "") #Beans varieties (4 Sub-sub plots)
#' split_split_plot_Data <- data.frame(list(WHOLE_PLOT = c(wp, rep(NA, 3)),
#'                                          SPLIT_PLOT = sp,
#'                                          SPLIT_SPLIT_PLOT = c(ssp, rep(NA,1))))
#' SSPD3_FB <- split_split_plot(reps = 1, l = 3,
#'                              plotNumber = c(1101, 2101, 3101),
#'                              seed = 23,
#'                              type = 2,
#'                              locationNames = c("A", "B", "C"),
#'                              data = split_split_plot_Data)
#' SSPD3_FB$infoDesign
#' head(SSPD3_FB$fieldBook,12)
#'
#' mu <- 10
#' r <- c(1,2,3)
#' alpha <- c(1,10) #IRR_NO, IRR_YES
#' beta <- c(5,10,15,20,1) # Fung1, Fung2, Fung3, Fung4, NFung (Control)
#' alpha_beta <- c(1,2,-1,2,-1, # IRR_NO x (Fung1, Fung2, Fung3, Fung4, NFung)
#'                 2,-1,3,-2,1) # IRR_YES x (Fung1, Fung2, Fung3, Fung4, NFung)
#'
#' gamma <- c(5,10,15,20)
#' set.seed(7654)
#' alpha_gamma <- sample(-2:2,2*4, replace=TRUE)
#' beta_gamma <- sample(-5:5, 5*4, replace=TRUE)
#' alpha_beta_gamma <- sample(-3:3, 2*5*4, replace=TRUE)
#'
#' sigma_W <- 3.23
#' sigma_SP <- 2.75
#' sigma_SSP <- 1.12
#'
#' epsilon_W <- rnorm(6, mean=0, sd=sigma_W) #hi = 3*2 =6
#' epsilon_SP <- rnorm(30, mean=0, sd=sigma_SP) #hij = 3*2*5 = 30
#' epsilon_SSP <- rnorm(120, mean=0, sd=sigma_SSP) #hijk = 3*2*5*4 = 120
#'
#' SSPD3 <- SSPD3_FB$fieldBook %>%
#'   add_column(RESP = as.numeric(NA)) %>%
#'   arrange(LOCATION, TRT_COMB) %>%
#'   mutate(LocationF = factor(LOCATION),
#'          Irrigation = factor(WHOLE_PLOT),
#'          Fungicide = factor(SUB_PLOT),
#'          Variety = factor(SUB_SUB_PLOT)) %>%
#'   rename(SPLIT_PLOT = SUB_PLOT,
#'          SPLIT_SPLIT_PLOT = SUB_SUB_PLOT)
#'
#' for(h in 1:3){
#'   for(i in 1:2){
#'     for(j in 1:5){
#'       for(k in 1:4){
#'
#'         y <- mu + r[h] + alpha[i] + beta[j] + alpha_beta[5*(i-1) + j] +
#'           gamma[k] + alpha_gamma[4*(i-1) + k] + beta_gamma[4*(j-1) + k] +
#'           alpha_beta_gamma[5*4*(i-1) + 4*(j-1) + k] +
#'           epsilon_W[2*(h-1) + i] + epsilon_SP[2*5*(h-1) + 5*(i-1) + j] +
#'           epsilon_SSP[2*5*4*(h-1) + 5*4*(i-1) + 4*(j-1) + k]
#'         SSPD3$RESP[2*5*4*(h-1) + 5*4*(i-1) + 4*(j-1) + k] <- y
#'
#'       }
#'     }
#'   }
#' }
#' }
#' data("SSPD3")
#' aov_results <- aov(RESP ~ Irrigation*Fungicide*Variety + Error(LOCATION/WHOLE_PLOT/SPLIT_PLOT),
#'                    data=SSPD3)
#' summary(aov_results)
#'
#' library(lme4)
#' library(modeldiagramR)
#' lmer_results <- lmer(RESP ~ Irrigation*Fungicide*Variety + (1|LOCATION/WHOLE_PLOT/SPLIT_PLOT),
#'                      data=SSPD3)
#' summary(lmer_results)
#'
#' anova(lmer_results)
#' model_diagram(lmer_results)
#' model_diagram(lmer_results, width = 800, height=400, orientation="horizontal",
#'               shiftFixed = 2, shiftRandom = 5, scaleFontSize = 2)
"SSPD3"
