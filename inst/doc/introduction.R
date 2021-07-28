## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = 'center',
  prompt = TRUE
)

## ----message=FALSE------------------------------------------------------------
library(bdrc)
set.seed(1) #set seed for reproducibility

## ---- data--------------------------------------------------------------------
data(krokfors)
krokfors

## ---- cache=TRUE--------------------------------------------------------------
gplm.fit <- gplm(Q~W,data=krokfors,parallel=TRUE,num_cores=2) # parallel=TRUE by default and by default, the number of cores is detected on the machine

## -----------------------------------------------------------------------------
summary(gplm.fit)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit,type='histogram',param='c')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit,type='histogram',param='c',transformed=TRUE)

## ---- fig.width=8, fig.height=3-----------------------------------------------
plot(gplm.fit,type='histogram',param=c('a','c'))

## ---- fig.width=10, fig.height=6----------------------------------------------
plot(gplm.fit,type='histogram',param='hyperparameters')

## ---- fig.width=10, fig.height=6----------------------------------------------
plot(gplm.fit,type='histogram',param='hyperparameters',transformed=TRUE)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit,type='f')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit,type='sigma_eps')

## ---- fig.width=8, fig.height=6,results='hide'--------------------------------
plot(gplm.fit,type='panel',transformed=TRUE)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(gplm.fit,type='residuals')

## ---- fig.width=10, fig.height=6----------------------------------------------
plot(gplm.fit,type='trace',param='c',transformed=TRUE)

## ---- fig.width=10, fig.height=6----------------------------------------------
plot(gplm.fit,type='trace',param='hyperparameters',transformed=TRUE)

## ----fig.width=8, fig.height=6------------------------------------------------
plot(gplm.fit,type='r_hat')

## ----fig.width=8, fig.height=6------------------------------------------------
plot(gplm.fit,type='autocorrelation')

## ----cache=TRUE,eval=FALSE----------------------------------------------------
#  gplm.fit.known_c <- gplm(Q~W,krokfors,c_param=7.65,h_max=10,parallel=FALSE)

## -----------------------------------------------------------------------------
h_grid <- seq(8,9,by=0.01)
rating_curve_h_grid <- predict(gplm.fit,newdata=h_grid)
print(rating_curve_h_grid)

