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
data(krokfors)
krokfors

## ---- cache=TRUE--------------------------------------------------------------
set.seed(1) # set seed for reproducibility
t_obj <- tournament(Q~W,krokfors,parallel=TRUE,num_cores=2) # by default parallel=TRUE and the number of cores is detected on the machine

## ----eval=FALSE---------------------------------------------------------------
#  t_obj <- tournament(list(plm0.fit,plm.fit,gplm0.fit,gplm.fit))

## -----------------------------------------------------------------------------
t_obj # or alternatively print(t_obj)

## -----------------------------------------------------------------------------
summary(t_obj)

## ---- fig.width=8, fig.height=6-----------------------------------------------
plot(t_obj) #default plot type is type='tournament_results'

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

## -----------------------------------------------------------------------------
t_obj_conservative <- tournament(t_obj$contestants,winning_criteria=5)
summary(t_obj_conservative)

## -----------------------------------------------------------------------------
t_obj_DIC <- tournament(t_obj$contestants,method="DIC")
summary(t_obj_DIC)

## -----------------------------------------------------------------------------
t_obj_prob <- tournament(t_obj$contestants,method="Posterior_probability",winning_criteria=0.9)
summary(t_obj_prob) 

