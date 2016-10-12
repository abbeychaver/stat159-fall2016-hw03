# Returns residual sum of squares - the larger this value, the worse the fit of the model
# Takes an lm object as an input and returns a double
rss <- function(fit){
  sum(fit$residuals^2)
}

# Returns Rsquared, a measure of how much of the variance in the data is explained by the model
# Takes and lm object as an input and returns a double between 0 and 1
rsq <- function(fit) {
  summary(fit)$r.squared
}

# Returns the total sum of squares, a measure of the total variance in the data (regardless of the model)
# Takes an lm object as an input and returns a double
tss <- function(fit) {
  #sum(anova(fit)$"Sum Sq")
  RSQ <- rsq(fit)
  RSS <- rss(fit)
  if (round(RSQ, 4) == 0) {
    return(RSS)
  }
  else {
    return(RSS/(1 - RSQ))
  }
}

# Returns the F statistic of the model, a measure of how likely it is that the model coefficients are not 0
# Takes an lm object as an input and returns a double
# F value should be compared to a F distribution table to assess significance
fstat <- function(fit) {
  summary(fit)$fstatistic['value']
}

# Returns the residual standard error, a measure of goodness of fit
rse <- function(fit) {
  summary(fit)[[6]]
}
