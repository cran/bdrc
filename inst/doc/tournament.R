## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=8, 
  fig.height=6, 
  #fig.path='figs-tournament/',
  fig.align='center',
  prompt=TRUE
)

## ----message=FALSE------------------------------------------------------------
library(bdrc)
set.seed(1) # set seed for reproducibility
data(krokfors)
krokfors

## ---- cache=TRUE--------------------------------------------------------------
set.seed(1)
t_obj <- tournament(Q~W,krokfors,parallel=TRUE,num_cores=2) # parallel=TRUE by default and by default, the number of cores is detected on the machine

## ----eval=FALSE---------------------------------------------------------------
#  t_obj <- tournament(plm0.fit,plm.fit,gplm0.fit,gplm.fit)

## -----------------------------------------------------------------------------
t_obj # or alternatively print(t_obj)

## -----------------------------------------------------------------------------
summary(t_obj)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj) #this is equivalent to type='tournament_results'

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='deviance')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='rating_curve')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='residuals')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='f')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='sigma_eps')

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj,type='panel',transformed=TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  t_obj_known_c <- tournament(formula=Q~W,data=krokfors,c_param=7.65)

