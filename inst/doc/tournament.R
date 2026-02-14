## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=8, 
  fig.height=6, 
  fig.path='figs-tournament/',
  fig.align='center',
  prompt=TRUE
)

## ----message=FALSE------------------------------------------------------------
library(bdrc)
data(krokfors)
head(krokfors)

## ----cache=TRUE---------------------------------------------------------------
set.seed(1) # set seed for reproducibility
t_obj <- tournament(Q ~ W, krokfors, parallel = TRUE, num_cores = 2) 

## -----------------------------------------------------------------------------
t_obj # or alternatively print(t_obj)

## ----eval=FALSE---------------------------------------------------------------
# t_obj <- tournament(list(plm0.fit, plm.fit, gplm0.fit, gplm.fit))

## -----------------------------------------------------------------------------
summary(t_obj)

## ----fig.width=8, fig.height=6, fig.alt="<em>A diagram showing the results of the power-law tournament. The diagram progresses from bottom (four initial models) to top (single winner). Each model's residual plot is shown at the bottom, with corresponding WAIC values above. Green WAIC values indicate the more parsimonious models in each comparison for these data. The first round selects gplm0 and plm0, which advance to the final comparison. gplm0 emerges as the tournament winner, indicated by its green WAIC value and the name at the top of the diagram.</em>"----
plot(t_obj) #default plot type is type='tournament_results'

## ----fig.width=8, fig.height=6, fig.alt="A comparative boxplot displaying posterior log-likelihood values for the models, with corresponding WAIC values shown as red diamonds. The log-likelihood values are presented on the deviance scale for direct comparison with WAIC. Each boxplot represents the distribution of log-likelihood values computed with the samples from the posterior distribution of the corresponding model. This visualization allows for easy comparison of model performance and fit across the four models."----
plot(t_obj, type = 'boxplot')

## ----fig.width=8, fig.height=6, fig.alt="A plot comparing the rating curves estimated by four models. The graph shows water level (stage) on the y-axis and discharge on the x-axis. Each model's estimated rating curve is represented by a solid line, with dotted lines showing the 95% prediction interval. This visualization enables assessment of model fit across the range of water levels, highlighting differences in predictive capabilities. Optimal performance is indicated by the solid line following the mean of observations and 95% of observations falling within the prediction interval."----
plot(t_obj, type = 'rating_curve')

## ----fig.width=8, fig.height=6------------------------------------------------
plot(t_obj, type = 'residuals')

## ----fig.width=8, fig.height=6------------------------------------------------
plot(t_obj, type = 'f')

## ----fig.width=8, fig.height=6------------------------------------------------
plot(t_obj, type = 'sigma_eps')

## ----fig.width=8, fig.height=6------------------------------------------------
plot(t_obj, type = 'panel', transformed = TRUE)

## ----eval=FALSE---------------------------------------------------------------
# t_obj_known_c <- tournament(formula = Q ~ W , data = krokfors, c_param = 7.65)

## -----------------------------------------------------------------------------
summary(t_obj, winning_criteria = 5)

## -----------------------------------------------------------------------------
summary(t_obj, winning_criteria = "Delta_WAIC > 2 & Delta_WAIC - SE_Delta_WAIC > 0")

## -----------------------------------------------------------------------------
summary(t_obj, method = "DIC")

## -----------------------------------------------------------------------------
summary(t_obj, method = "PMP", winning_criteria = 0.9)

