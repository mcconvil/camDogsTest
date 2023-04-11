test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


test_that("check all columns were kept",{
  expect_setequal(names(top10(camDogs, Dog_Name)), sample(names(camDogs)))
})

test_that("check class", {
  expect_s3_class(top10(camDogs, Dog_Name), "data.frame")
})

test_that("errors when given an incorrect input class", {
  expect_error(top10(camDogs, Latitude_masked))

})

test_that("Less than or equal number of rows in the filtered dataset", {
  expect_lte(nrow(top10(camDogs, Dog_Name)), nrow(camDogs))
})
