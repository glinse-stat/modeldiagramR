#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @importFrom magrittr %>%
## usethis namespace: end

# Needed because dplyr is used for writing this function
utils::globalVariables(c("thisLevel","numThisLvl","get(RElist[1])",
                         "onesCol","cumSumCol","thisRE","firstLevel",
                         "numFirstLvl","get(thisColName)","fPrevNestedVar",
                         "groupID","keepThis","thisREold","ObsLevelPos",
                         "ObsLevel_rawPos","rowVal","actName","name",
                         "label","y_pos","meanVal", "x", "y", "x_old",
                         "id", "fixedsize"))
