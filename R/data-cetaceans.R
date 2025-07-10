#' Data from a repeated measures study on age by tooth staining methods of stranded Cetaceans
#'
#' Results of a study comparing three staining methods to determine age of dolphins
#' from six species of cetaceans from two different locations (Spain and Scotland).
#' It is unclear how the numeric values of sex are coded so they are left as integers.
#' This dataset has been cleaned to remove the dolphin with undetermined sex (DolphinID = 10).
#'
#' Additional variables include sex of the animal, location of the stranding, and
#' stain (Mayer Haematoxylin, Ehlrich Haematoxylin, and Toluidine Blue).
#'
#'
#' @format a \code{data.frame} with 177 observations on 11 variables from 59 dolphins:
#' \describe{
#'   \item{DolphinID}{Dolphin ID from 1 to 61 (excluding 10 and 16)}
#'   \item{Species}{Species of cetacean (6 species)}
#'   \item{Age}{Age determined by staining method from a tooth, numeric}
#'   \item{Sex}{Sex of dolphin, integer}
#'   \item{Stain}{Treatment, staining method (Mayer, Elrich, Toluidine), categorical}
#'   \item{Location}{Location of stranding (Scotland, Spain), categorical}
#'   \item{fSpecies}{Factor version of Species variable}
#'   \item{fDolphinID}{Factor version of DolphinID}
#'   \item{fStain}{Factor version of Stain}
#'   \item{fLocation}{Factor version of Location}
#'   \item{fSex}{Factor version of Sex}
#' }
#'
#' @name cetaceans
#' @docType data
#' @references Zuur AF, Ieno EN, Walker N, Saveliev AA, and Smith GM. 2009. Mixed effects models and extensions in ecology with R. Statistics for Biology and Health. Springer New York, p. 460. DOI: 10.1007/978-0-387-87458-6
#' @source https://www.highstat.com/Books/Book2/ZuurDataMixedModelling.zip
#' @keywords data cetacean dolphins repeated measures mixed models
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' library(viridis)
#' data("cetaceans")
#' p1 <- cetaceans %>%
#'   ggplot(aes(x = DolphinID, y = Age, group=fDolphinID)) +
#'   geom_boxplot(aes(color=fSpecies)) +
#'   scale_color_viridis_d(end = 0.8) +
#'   theme_bw() +
#'   theme(legend.position="none")
#' p2 <- cetaceans %>%
#'   ggplot(aes(x = fSpecies, y = Age, group=fSpecies)) +
#'   geom_boxplot(aes(color = fSpecies)) +
#'   scale_color_viridis_d(end = 0.8) +
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle=90),
#'         legend.position="none")
#' p3 <- cetaceans %>% ggplot(aes(x = fSpecies, y = Age)) +
#'   geom_boxplot(aes(color = fSpecies)) +
#'   scale_color_viridis_d(end = 0.8) +
#'   facet_wrap(~fLocation)+
#'   theme_bw() +
#'   theme(axis.text.x = element_text(angle=90))
#'
#' library(patchwork)
#' (p1) / (p2) / (p3)
#'
#' library(lme4)
#' library(lmerTest)
#' lmer1 <- lmer(Age ~ fSex*fStain*fLocation + (1|fSpecies/fDolphinID), data = cetaceans)
#' summary(lmer1)
#' model_diagram(lmer1)
"cetaceans"
