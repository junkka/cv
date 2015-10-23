# render_cv.R

render_cv <- function(){
  source("src/build_yaml.R")
  library(rmarkdown)
  render("cv.Rmd", "pdf_cv", output_dir = "output")
  render("cv.Rmd", "html_cv", "index.html", output_dir = "output")
  file.copy("papers", "output/", overwrite = TRUE, recursive = TRUE)
}