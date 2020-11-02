# render_cv.R

render_cv <- function(){
  source("R/build_yaml.R")
  library(rmarkdown)
  render("cv.Rmd", "pdf_cv", output_dir = "output")
  render("cv.Rmd", "html_cv", "index.html", output_dir = "output")
}
