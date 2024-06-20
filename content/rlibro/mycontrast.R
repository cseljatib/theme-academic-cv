# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Function: "my.contrast"                                                         #
# Gives the statistics for statistical inference for a given contrast             #
#                                                                                 #
# This function computes the Estimated contrast, standard error of the contrast,  #
#   and confidence interval of the contrast, subject a given alpha level          #
#
# How this function works?:                                                       #
# The syntax is:>  my.contrast(m1,C1.coeff,means.g,ns.g,alpha)                    #
# Where:                                                                          #
# - y: is a vector with the Y-variable values                                     #
# - group: is a vector with the group of each observation                                   #
# - full: indicator, if 0 means give only n,mean,Sd by group, if 1
#   will give n, min,max, mean, CV% by group                                               #
#                                                                                           #
# Author: Christian E. Salas Eljatib                                                        #
# Date: Feb18, 2009                                                                         #
# Last-changes: Feb 18, 2009                                                                #
# New Haven, CT, USA                                                                        #
#-------------------------------------------------------------------------------------------#
my.contrast <- function(mod.obj,coef.cont,g.means,g.ns,alpha,full){
#full=0 if want short output, 1 for longer (i.e. more details) output
  #my style
  c.est <- t(coef.cont)%*%g.means
  # computing the s(C).
  mse=(summary(mod.obj)$sigma)^2
  df.res=df.residual(mod.obj) 
  se.c.est <- sqrt( mse* t(coef.cont^2)%*%(1/g.ns) )

#  alpha=0.05
  tscore=qt(1-alpha/2,df.res)

# confidence interval for the estimated contrast  
  c.est.lower <- c.est-tscore*se.c.est;
  c.est.upper <- c.est+tscore*se.c.est;
 
# t-statistics for the estimated contrast
  t.comp=c.est/se.c.est
#  p.value=pvalueT(t.comp,df.res) #p.value for the t-statistics (my.Functiont)
   p.value=round(((1-pt(abs(t.comp),df.res))*2),4)
  
 if(full==0){
     output=c(c.est,se.c.est,p.value)
     names(output)=c('Est.Contrast','SE.Cont','p-value')
   } else {
  output=c(c.est,se.c.est,c.est.lower,c.est.upper,p.value)
names(output)=c('Est.Contrast','SE.Cont','Lower.bound.Cont','Upper.bound.Cont','p-value')
}

  output
}
#
