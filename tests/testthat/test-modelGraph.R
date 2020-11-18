test_that("graph is using numeric values for x axis", {
  expect_error(plot_modelgraph(gapminder::gapminder, continent, country, model_type = "lm"))
  expect_error(plot_modelgraph(gapminder::gapminder, continent, lifeExp, model_type = "lm"))
})

test_that("graph is using numeric values for y axis", {
  expect_error(plot_modelgraph(gapminder::gapminder, continent, country, model_type = "lm"))
  expect_error(plot_modelgraph(gapminder::gapminder, lifeExp, country, model_type = "lm"))
})

test_that("Scale y is labelled correctly",{
  p <- plot_modelgraph(gapminder::gapminder, lifeExp, pop, model_type = "lm")
  expect_identical(p$labels$y, "pop")
})

test_that("Scale y is labelled correctly",{
  p <- plot_modelgraph(gapminder::gapminder, lifeExp, pop, model_type = "lm")
  expect_identical(p$labels$x, "lifeExp")
})
