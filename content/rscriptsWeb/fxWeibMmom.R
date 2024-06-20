## Script: fxWeibMmom.R                       /
## Sobre:  funciones para ajuste de fdp de Weibull, basado en el
##  metodo de los momentos./
#------------------------------------------------------------/ 
## Este script provienen del Prof. Oscar Garcia.
#R function for fitting the Weibull pdf
# based upon Garcia 88 approach
###############  Weibull parameters in R  #############
mweibull <- function(mean, stdev)
  # Returns the Method-of-Moments shape and scale parameter estimates
  # for the Weibull distribution, given a mean and variance.
  # Method:  Garcia, O.  NZ Journal of Forestry Science
  # Use help("dweibull") for definitions and more details.
{
  cv <- stdev / mean
  if (cv > 1.2 || cv <= 0)
    stop("Out of range")
  a <- 1 / (cv * (((((0.007454537 * cv * cv - 0.08354348) * cv + 0.153109251) *
                      cv - 0.001946641) * cv - 0.22000991) * (1 - cv) * (1 - cv) + 1))
  list(shape = a, scale = mean / gamma(1 + 1 / a))
}
#######################################################
##examples
# library(datana)
# list.d<-pspLlancahue2$dap
# summary(list.d)
# mweibull(mean = mean(list.d), stdev = sd(list.d))
