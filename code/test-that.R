library(testthat)
source("code/tests/test-regression.R")
set.seed(123)
norm1 <- rnorm(100, 2, 1)
norm2 <- norm1*2
fit_2x <- lm(norm2 ~ norm1)

context("Testing whether rss works")
test_that("rss function works as expected", {
  expect_equal(round(rss(fit_2x), 2), 0)
  expect_type(rss(fit_2x), 'double')
  expect_length(rss(fit_2x), 1)
})

norm3 <- rnorm(100, 0, 0.3)
target <- norm1*2 + norm3
fit_2xe <- lm(target ~ norm3)

context("Testing whether tss works")
test_that("tss works as expected", {
  expect_equal(tss(fit_2xe), sum(anova(fit_2xe)$"Sum Sq"))
  expect_type(tss(fit_2xe), 'double')
  expect_length(tss(fit_2xe), 1)
})

context("Testing whether Rsquared works")
test_that("rsq works as expected", {
  expect_equal(round(rsq(fit_2xe), 3), round((1 - rss(fit_2xe)/tss(fit_2xe)), 3))
  expect_gte(rsq(fit_2xe), 0)
  expect_lte(rsq(fit_2xe), 1)
  expect_type(rsq(fit_2xe), 'double')
  expect_length(rsq(fit_2xe), 1)
})

context("Testing whether F-statistic works")
test_that("fstat works as expected", {
  expect_type(fstat(fit_2xe), "double")
  expect_length(fstat(fit_2xe), 1)
  fst = ((tss(fit_2xe) - rss(fit_2xe))/1)/(tss(fit_2xe)/(100-2))
  expect_equivalent((round(fstat(fit_2xe), 1))['value'], round(fst, 1)[1])
})

context("Testing whether residual standard error works")
test_that("rse works as expected", {
  expect_type(rse(fit_2xe), "double")
  expect_length(rse(fit_2xe), 1)
  RSE <- sqrt(rss(fit_2xe)/(100-2))
  expect_equal(rse(fit_2xe), RSE)
})

