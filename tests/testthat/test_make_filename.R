context("Test make_filename() function")

test_that("filename is combination of 'accident_' provided year and 'csv.bz2' suffix", {

  expect_equal(make_filename("2013"), "accident_2013.csv.bz2")
  expect_equal(make_filename(c("2013", "2014")), c("accident_2013.csv.bz2", "accident_2014.csv.bz2"))

})

test_that("class of output is character",{
  expect_type(make_filename("2013"), "character")
  expect_type(make_filename(c("2013", "2014")), "character")
})
