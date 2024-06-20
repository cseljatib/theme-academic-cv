## Script: fxBal.R                       /
## Sobre:  funciones de R para ajuste del modelo de FDP de Weibull./
#------------------------------------------------------------/ 
## Este script es una mezcla de funciones que he recopilado desde
##  diversas fuentes, siendo una de ellas, el Prof. Arne Pommerening (Suecia).
##
## Profesor: Christian Salas Eljatib
## E-mail: cseljatib AT gmail DOT com
## Web: https://eljatib.com
#======================================
bal <- function(ba, area) {
  sumba <- sum(ba)
  basmaller <- 0
  pix <- 0
  bal <- 0
  for (i in 1 : length(ba)) {
    bax <- ba[i]
    basmaller <- sum(ba[ba <= bax])
    pix <- basmaller / sumba
    bal[i] <- sumba * (1 - pix) / area
  }
  return(bal)
}