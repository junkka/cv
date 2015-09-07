CV 
====

This repository containes R scripts to render a vita from yaml data. 

[html CV](http://johanjunkka.com/cv/) and [PDF CV](http://johanjunkka.com/cv/cv.pdf)

## Render html and PDF CV from YAML using RMarkdown

The procedure is inspired by James Kierstad's post on [Generating an academic CV with R and YAML](http://www.jameskeirstead.ca/blog/generating-an-academic-cv-with-r-and-yaml/). The structured content of the CV is written in YAML.

``` yaml 
- content/
    - publications.yaml
    - appoitments.yaml
    - ...
```

The RMarkdown package uses pandoc to render .Rmd files to different formats. The YAML font matter can be stated within the document or given to pandoc as it own input

```
pandoc infile.Rmd metadata.yaml -o outfile.html 
```

These means that we can concatinate all the yaml data, wrap it within `---` and feed it to pandoc using a custom render function `html_cv()` & `pdf_cv()`. The renderers can be specified in the font matter in the .Rmd file

```
title: CV
author: First Last
output:
    html_cv:
        yaml_path: "content"
```

## Templates

The html template is an extension off the rmarkdown vignette template and the PDF template extends [Dario Taraborellis Compact Academic cv](http://www.latextemplates.com/template/compact-academic-cv) tex template.

The templates are populated using the pandoc templatong language.