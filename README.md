---
title: "Preparing R code for reproducible research"
subtitle: "CES Skills Seminars"  
author: 
  - "José R. Ferrer-Paris" 
  - "(a.k.a. Jose Ferrer; JR)"
date: '`r Sys.Date()`'
---

# R code for reproducible research

This repository contains:

-   a [presentation](presentation/presentation.html) about the benefits of reproducible research for the author of the research,
-   a couple of figures in graphviz (`.dot`) format in folder [img](img/)
-   and a list of simple recommendations (this file)

## My recommendations for reproducible research

First take a look at suggested best practices for coding in R, for example these: <https://www.r-bloggers.com/2018/09/r-code-best-practices/>

It takes time to get used to all of these, don't need to try to implement everything at once.

### Folder/files organisation

The most important thing is to think about the structure of your code as you would do if you were writing a project: what are the objectives and what steps do I need to reach each objective. Once your code is organised it is easier to isolate the tasks you need to do as a clear workflow.

I suggest you split your code into steps with explicit file names, for example:

    Step-01-Read-Spatial-data.R
    Step-02-Read-Camera-trap-data.R
    Step-03-Fit-basic-model.R
    Step-04-Compare-models.R
    Etc

### README

It is a good idea to add a README file in the scripts folder to explain the general workflow or outline of the project / repository.

### Script structure

Each script should have a header, a series of steps with comments and there should be a clear output at the end.

The header should have a title/author/date, etc and possibly a bullet list of intended outputs, so when anybody opens the code they can immediately realise what is going on.

Try to give a number or title to each step, so that there is a clear flow.

### Scripts inputs and outputs

Output can be either an object to be saved in .CSV, .RDS or .Rdata file or a figure. You can have output at the end of each step or at the end of the script, but please add a very clear comment of what it is and why is helpful, for example:

```{r}
# OUTPUT: data frame with all records summarised by location, will be used as input for function X in script Y
save(file=’step1-output.rda’,data)
```

Ideally you want to start a script without needing to run the previous ones, so at the start of one script you will load or read the output of a previous script, again use comments to explain:

```{r}
# INPUT: data frame with all records summarised by location, created in script Z
load(file=’step1-output.rda’)
```

### Paths and navigation

Adapt the paths to make them relative to the project folder, or use a helper package to navigate the paths to the files you need.

### Large files

Reading large data files can slow down your code and compromise portability. Consider using persistent external repositories for large data files, and download files if needed:

```{r}
# INPUT: data available from external repository
if (!file.exists("input-data.rda"))
  download.file(url="https://....",destfile="input-data.rda")
load(file="input-data.rda")
```

Ideally the script to read large data will be run once, and the summary of results stored in a data.frame with the essential information for the analysis.

### Naming functions and objects

Try to use informative names for the models or add comments with the main parameters of the model, so that you can easily compare different models you will build along your workflow.

## Simple steps

### Know your tools

-   Integrated development environments
    -   RStudio
    -   jupyter lab !
    -   VisualCode !
-   R-projects
-   Packages:
    -   environments (`renv`)
    -   work directory (`here`)
    -   utils for packages, etc.
-   Containers !!

------------------------------------------------------------------------

### Input data

-   Share your (raw) data (at least a sample dataset)
-   Document data preparation and cleaning
-   Foolproof data ingestion:
    -   universal, simple formats if possible (e.g. `.csv`, `.txt`)
    -   use open access tools and libraries for more complex formats whenever possible (e.g. `sqlite`, `gdal`)
    -   follow data from downloading to final `data.frame`/`tibble`

More on this: Making your data and code open access / CES Skills Seminars 20-04-2023

------------------------------------------------------------------------

## Documentation

-   README or DESCRIPTION file
-   Comment your code:
-   comments in R script,
-   documents or reports using R/Sweave and knit, Rmarkdown, Quarto, etc.
-   Vignette or tutorials

------------------------------------------------------------------------

### Modular code

-   Short R scripts with explicit inputs and outputs
-   Save intermediate steps (Rdata or RDS files)
-   Run Rscript or Background Jobs
-   Use and reuse your functions !
-   Write a package !!

------------------------------------------------------------------------

### Output data is useful for other people

-   Presentation of your data outputs (i.e. images or `pdf` documents)\
-   Useful for readers
-   Reviews
-   Fully automated reports (Sweave and Knitr!)
-   Outputs and raw results
-   Might be useful for meta-analysis
-   Tabular formats
-   Structured text formats (Metadata, XML)
-   Spatial data (raster, vector data)

More on this: Making your data and code open access / CES Skills Seminars 20-04-2023

------------------------------------------------------------------------

### Document your journey

-   Tutorials / blogs
-   Keep a change log: explain what and why (fixed errors, etc)
-   Version control (e.g. git and GitHub!!)
