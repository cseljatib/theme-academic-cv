## Script: fxAltDom.R                       /
## Sobre:  funciones para calculo de altura dominante./
#------------------------------------------------------------/ 
## Este script provienen del Prof. Oscar Garcia.
##########################################################
##       R functions for top height calculations        ##
##########################################################

#  See: Garcia, O. and Batho, A.  "Top height estimation
#  in lodgepole pine sample plots".  Western Journal of
#  Applied Forestry 20(1), 64-68. 2005.

# IMPORTANT: Data must be sorted by increasing dbh.

TopHeight <- function(heights, ares) {
# Calculate top height using the interpolated U-estimator.
# Inputs:
#   heights: vector or list of tree heights, sorted by
#       increasing dbh
#   ares: plot area in ares (1 hectare = 100 ares)
# Uses the  Uestimator function.
# Reference: Garcia,O. and Batho,A. Western Journal of
#   Applied forestry 20(1), 64-68. 2005.
    m <- length(heights) / ares
    mlo <- floor(m)
    mhi <- ceiling(m)
    U <- Uestimator(heights, mlo)
    if (mhi == mlo) return(U)
    (mhi - m) * U + (m - mlo) * Uestimator(heights, mhi)
}


Uestimator <- function(heights, trees.per.are) {
# Compute U-estimator, for integer trees/are
# Inputs:
#   heights: vector or list of tree heights, sorted by increasing dbh 
#   trees.per.are: =length(heights) / (plot area in ares).  If not
#       integer, it is rounded to the nearest integer, with a warning.
# Reference: Garcia,O. and Batho,A. Western Journal of
#   Applied Forestry 20(1), 64-68. 2005.
    m <- round(trees.per.are)
    if (m != trees.per.are) warning("trees.per.are = ", trees.per.are, " has been rounded")
    sum(choose(0:(length(heights) - 1), m - 1) * heights) / choose(length(heights), m)
}
#############  Examples  ##############