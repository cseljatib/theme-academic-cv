## Script: fxAjuWeibull.R                       /
## Sobre:  funciones de R para ajuste del modelo de FDP de Weibull./
#------------------------------------------------------------/ 
## Este script es una mezcla de funciones que he recopilado desde
##  diversas fuentes, siendo una de ellas, el Prof. Lauri Mehtatalo (Finlandia).
##
## Profesor: Christian Salas Eljatib
## E-mail: cseljatib AT gmail DOT com
## Web: https://eljatib.com
#======================================

# 2-parameter Weibull -logL
nLLweibull<-function(x, shape=5,scale=20) {
  -sum(dweibull(x,shape=shape,scale=scale,log=TRUE))
}    

# my 2 parameter Weibull density with analytic differentiation
#mydweibull<-deriv(~(shape/scale)*(d/scale)^(shape-1)*exp(-(d/scale)^shape),
#                  c("shape","scale"),function(d,shape,scale){})

# Ajusta la fdp de Weibull, con dos parametros: shape y scale
fitw2<-function(y) {
  est<-mle(function(shape=1,scale=80)   
    nLLweibull(y,shape,scale))
  if (class(est)=="try-error") list(par=rep(NA,2),neg2LL=NA,conv=NA) 
  else list(
    par=coef(est),
    neg2LL=2*attributes(est)$min,
    conv=attributes(est)$details$convergence,
    summaryFit=summary(est))
}
