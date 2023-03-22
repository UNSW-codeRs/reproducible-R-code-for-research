---
title: "Preparing R code for reproducible research"
subtitle: "General recommendations"  
author: 
  - "José R. Ferrer-Paris" 
date: 'March 2023'
---

## Follow suggested best practices

First take a look at suggested best practices and style guides for coding in R, for example:
  - <https://www.r-bloggers.com/2018/09/r-code-best-practices/>
  - [https://style.tidyverse.org/index.html]

It takes time to get used to all of these, don't need to try to implement everything at once.

## General recommendations

Here are some personal suggestions that will help you in your journey toward reproducible code. 

### Know your tools

-   Integrated development environments
    -   [RStudio](https://posit.co/products/open-source/rstudio/))
    -   [jupyter lab](https://jupyter.org/) !
    -   [Visual Studio Code](https://code.visualstudio.com/) !
-   [Use R-projects](https://thedavidchen.github.io/post/rstudio-why-use-projects/)
-   Packages:
    -   environments (`renv`) : https://rstudio.github.io/renv/
    -   work directory (`here`) : https://here.r-lib.org/
    -   utils for packages, etc.
-   Containers !!

### Input data

-   Share your (raw) data (at least a sample dataset)
-   Document data preparation and cleaning
-   Foolproof data ingestion:
    -   universal, simple formats if possible (e.g. `.csv`, `.txt`)
    -   use open access tools and libraries for more complex formats whenever possible (e.g. `sqlite`, `gdal`)
    -   follow data from downloading to final `data.frame`/`tibble`

More on this: Making your data and code open access / CES Skills Seminars 20-04-2023

### Documentation

-   README or DESCRIPTION file
-   Comment your code:
    -   Comments in R script,

    -   Documents or reports using R/Sweave and knit, Rmarkdown, Quarto, etc.
-   Vignettes and tutorials

### Modular code

-   Short R scripts with explicit inputs and outputs
-   Save intermediate steps (Rdata or RDS files)
-   Run Rscript or Background Jobs
-   Use and reuse your functions !
-   Write a package !!

### Output data is useful for other people

-   Presentation of your data outputs\
    (i.e. images or `pdf` documents)
    -   Useful for readers

    -   Reviews
-   Fully automated reports (Sweave and Knitr!)
-   Outputs and raw results
    -   Might be useful for meta-analysis

    -   Tabular formats

    -   Structured text formats (Metadata, XML)

    -   Spatial data (raster, vector data)

More on this: Making your data and code open access / CES Skills Seminars 20-04-2023

### Document your journey

-   Tutorials / blogs
-   Keep a change log: explain what and why (fixed errors, etc)
-   Version control (e.g. git and GitHub!!)
