## code to prepare `DATASET` dataset goes here
camDogs <- readr::read_csv("https://data.cambridgema.gov/api/views/sckh-3xyx/rows.csv?accessType=DOWNLOAD")

camDogs <- dplyr::mutate(camDogs,
                  Breed_Binary = dplyr::if_else(Dog_Breed == "Mixed Breed",
                                  "Mixed", "Single")) |>
  dplyr::relocate(.after = Dog_Breed, Breed_Binary) |>
  dplyr::select(-Location_masked)

usethis::use_data(camDogs, overwrite = TRUE)
