# build_yaml
# read yaml to list
# for each item sey 

# a custom render

html_cv <- function(yaml_path = "content"){
  make_yaml(yaml_path)
  rmarkdown::html_document(
    fig_width = 6.5,
    fig_height = 4,
    css = "template/style.css",
    template = 'template/template.html',
    pandoc_args = file.path(tempdir(), "temp.yaml"),
    mathjax = NULL)
}

make_yaml <- function(path){
  files <- list.files(path, pattern = "\\.yaml$")
  temp_dir <- tempdir()
  temp_file <- "temp.yaml"
  unlink(file.path(temp_dir, temp_file))
  cat("---\n", file = file.path(temp_dir, temp_file))
  plyr::l_ply(files, function(a){
    b <- readChar(file.path(path, a), file.info(file.path(path, a))$size)
    write(b, file = file.path(temp_dir, temp_file), append = TRUE)
  })
  write("---", file = file.path(temp_dir, temp_file), append = TRUE)
}

pdf_cv <- function(yaml_path = "content"){
  make_yaml(yaml_path)
  rmarkdown::pdf_document(
    fig_width = 6.5,
    fig_height = 4,
    latex_engine = "xelatex",
    template = 'template/template.tex',
    pandoc_args = file.path(tempdir(), "temp.yaml"))
}