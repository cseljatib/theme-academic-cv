#' Produces a time series plot, of variable Y as a function of X by an observational unit factor or id.
#'   Both Y and X must be numeric variables, and the column representing the observational unit, must be
#'   a factor. This factor identifies the longitudinal context of the data, for instance, a student
#'   being measured on time. Besides, two more factors can be added to the plotting details, in order
#'    to represent the potential variability among them.
#'   
#' 
#' @title Produces a time series plot, of variable Y as a function of X, by an observational unit factor or id. 
#' @param data a dataframe with at least tree columns representing the response variable ("y"),
#'   the main predictor variable ("x"), and a variable indicating the observational unit ("obs.unit").
#' @param y a character giving the column name of the response variable or variable of interest.
#' @param x a character giving the column name of the main predictor variable. Generally this variable
#' is time.
#' @param obs.unit a character giving the column name containing the info of the observational unit.
#' @param factor1 an optional character having the name of a column having a factor variable (e.g., treatment). The
#'  detault value is set to NULL.
#' @param factor2 an optional character having the name of a column having another factor variable (e.g., species). The
#'  detault value is set to NULL.
#' @param only.lines a logic value if only lines, but not including dots, are going to be drwan in the plot. The detault
#'  value is set to FALSE.
#' @param xlab Label for the X-axis
#' @param ylab Label for the Y-axis
#' @param linetype.lab is an optional string to be used as the title of the factor being represented by lines. It is only
#'  needed if factor1 and factor2 are defined. See example.
#' @param factor2.line a logic value if the second factor, factor2, is going to be segregated according to the
#'  type of lines. The detault  value is set to TRUE.
#' @param factor2.col a logic value if the second factor, factor2, is going to be segregated according to the
#'  color of the lines only. The detault  value is set to FALSE.
#' @param max.y.all A number representing the maximum level of Y-axis for all classes
#' @param levels.i.want A vector having the levels for the factor under study
#' @param col.lev.i.want A vector having the colors to be used for the factor under study
#' 
#' @return This function returns a time series plot
#' @author Christian Salas-Eljatib
#' @note Please, uses with caution, and run first the examples to understand it better.
#' @examples
#' 
#' #df<-data('orange');
#' #df$Site <-"Southern site" 
#' #df[df$tree.id==1 | df$tree.id==3,"Site"] <-"Northern site"
#' #df$Species <-"Douglas-fir"
#' #df[df$tree.id==2,"Species"] <-"Beech"
#' #df[df$tree.id==1,"Species"] <-"Radiata pine"
#' #timeSerPlot(df, y="dbh", x="time", obs.unit = "tree.id")
#' #timeSerPlot(df, y="dbh", x="time", obs.unit = "tree.id", factor1="Site")
#' #timeSerPlot(df, y="dbh", x="time", obs.unit = "tree.id", factor1="Site", factor2= "Species")
#' #timeSerPlot(df, y="dbh", x="time", obs.unit = "tree.id", factor1="Site", factor2= "Species",
#' #             factor2.col = T, only.lines = T)
#' @rdname timeSerPlot
#' @export
#' 
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
timeSerPlot <- function(data=data, y=y, x=x, obs.unit=obs.unit,
                           factor1 = NA, factor2=NA,only.lines=FALSE,
                           ylab=NA, xlab=NA,linetype.lab=NA,
                           factor2.line=TRUE,factor2.col=FALSE,
                           max.y.all=NA,levels.i.want=FALSE, col.lev.i.want=FALSE){  
  db<-data;
  
  if(prod(is.na(factor1))){has.factor1 <-0} else {has.factor1 <-1}
  if(prod(is.na(factor2))){has.factor2 <-0} else {has.factor2 <-1}
  
  if(has.factor1==0 & has.factor2==0){  
    df.h <- data.frame(assign(obs.unit,db[,obs.unit]),assign(x,db[,x]),assign(y,db[,y]))
    names(df.h) <- c(obs.unit,x,y) } else {nada=111}
  if(has.factor1==1 & has.factor2==0){  
    df.h <- data.frame(assign(obs.unit,db[,obs.unit]),assign(factor1,db[,factor1]),assign(x,db[, x]),assign(y,db[,y]))
    names(df.h) <- c(obs.unit,factor1,x,y) } else {nada=111}
  if(has.factor1==1 & has.factor2==1){  
    df.h <- data.frame(assign(obs.unit,db[,obs.unit]),assign(factor1,db[,factor1]),assign(factor2,db[,factor2]),assign(x,db[, x]),assign(y,db[,y]))
    names(df.h) <- c(obs.unit,factor1,factor2,x,y) } else {nada=111}
  
  if(prod(is.na(xlab))){xlab.h<-x} else {xlab.h <- xlab}
  if(prod(is.na(ylab))){ylab.h<-y} else {ylab.h <- ylab}
  if(prod(is.na(linetype.lab))){linetype.lab.h<-factor2} else {linetype.lab.h <- linetype.lab}
  
  if(has.factor1==0 & has.factor2==0 & only.lines==FALSE){
    ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit]))
    p<- ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) + 
      ggplot2::geom_line()+ ggplot2::geom_point()+
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) 
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    
    print(p)
  } else {nada=0}
  
  if(has.factor1==0 & has.factor2==0 & only.lines==TRUE){
    ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit]))
    p<- ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) + 
      ggplot2::geom_line()+ 
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) 
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
  ##for one factor plotting      
  if(has.factor1==1 & has.factor2==0  & only.lines==FALSE){
    p<-  ggplot2::qplot(y=df.h[,y],x=df.h[,x], group=df.h[,obs.unit], facets=~df.h[,factor1], data=df.h,geom=c("point", "line"), ylab=ylab.h,xlab=xlab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
  if(has.factor1==1 & has.factor2==0  & only.lines==TRUE){
    p<-  ggplot2::qplot(y=df.h[,y],x=df.h[,x], group=df.h[,obs.unit], facets=~df.h[,factor1], data=df.h,geom=c("line"), ylab=ylab.h,xlab=xlab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))  
    print(p)
  } else {nada=0}
  
  ##for two factors plotting  
  if(has.factor1==1 & has.factor2==1 & factor2.col==TRUE){factor2.line=FALSE} else {nada=999}
  
  if(has.factor1==1 & has.factor2==1 & factor2.line==TRUE  & only.lines==FALSE){
    p<-  ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) +
      ggplot2::geom_line(ggplot2::aes(linetype=df.h[,factor2]))+
      ggplot2::facet_wrap(df.h[,factor1])+
      ggplot2::geom_point()+
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) +
      ggplot2::labs(linetype=linetype.lab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
  if(has.factor1==1 & has.factor2==1 & factor2.line==TRUE  & only.lines==TRUE){
    p<-  ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) +
      ggplot2::geom_line(ggplot2::aes(linetype=df.h[,factor2]))+
      ggplot2::facet_wrap(df.h[,factor1])+
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) +
      ggplot2::labs(linetype=linetype.lab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
  if(has.factor1==1 & has.factor2==1 & factor2.col==TRUE  & only.lines==FALSE){
    p<-  ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) +
      ggplot2::geom_line(ggplot2::aes(col=df.h[,factor2]))+
      ggplot2::facet_wrap(df.h[,factor1])+
      ggplot2::geom_point()+
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) +
      ggplot2::labs(col=linetype.lab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
  if(has.factor1==1 & has.factor2==1 & factor2.col==TRUE  & only.lines==TRUE){
    p<-  ggplot2::ggplot(df.h, ggplot2::aes(x=df.h[,x], y=df.h[,y], group=df.h[,obs.unit])) +
      ggplot2::geom_line(ggplot2::aes(col=df.h[,factor2]))+
      ggplot2::facet_wrap(df.h[,factor1])+
      ggplot2::xlab(xlab.h) + ggplot2::ylab(ylab.h) +
      ggplot2::labs(col=linetype.lab.h)
    p <- p + 
      ggplot2::theme(panel.background = ggplot2::element_blank(),
            panel.border = ggplot2::element_blank(), 
            panel.grid.major = ggplot2::element_blank(),
            panel.grid.minor = ggplot2::element_blank(), 
            axis.line = ggplot2::element_line(colour = "black"))
    print(p)
  } else {nada=0}
  
}
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
