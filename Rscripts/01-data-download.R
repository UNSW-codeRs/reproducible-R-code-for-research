# title: "Preparing R code for reproducible research"
# subtitle: "Example code for data download"  
# author: "José R. Ferrer-Paris" 
# date: 'March 2023'

# This is an example script with lots of comments and only three steps, please see the presentation in the presentation folder of this repo and read the README file.

# Outline ----------
# - Preliminaries
# - Step 1: Data download
# - Step 2: Modify data
# - Step 3: Save modified data
# - R session info and done !

# Preliminaries ----------
# Before you start: Take a look at suggested best practices for coding in R, for example these: <https://www.r-bloggers.com/2018/09/r-code-best-practices/>
 
# Step 1: Data download ----------
# We want to download the FRED-MD dataset:
# > FRED-MD ("Federal Reserve Economic Data Monthly Database") is a publicly available dataset. Originally designed for the analysis of ***big economic data***, the dataset contains more than one hundred features.

fred.url <- 'https://files.stlouisfed.org/files/htdocs/fred-md/monthly/current.csv'

# we will work in a temporal directory:
my.temp.dir <- tempdir()
# we use `sprintf` to add the path of the temporal directory and the name of the output file: `raw-data.csv`,
target.file <- sprintf("%s/raw-data.csv", my.temp.dir)

# if file does not exists we download it:
if (!file.exists(target.file)) {
  # function download.file uses the best available method for each OS, test if this works for you:
  download.file(url=fred.url, destfile=target.file)
}

# now read the file:
original.data <- read.csv(target.file)

# Step 2: Modify data ----------

# We want to skip the first record and use the next 100 records from the table, if library `dplyr` is available we can use the `slice` function, otherwise we can use simply `head`

if (require(dplyr)) {
  ss.data <- original.data %>% 
    slice(2:101)
} else {
  ss.data <- head(original.data[-1,],n=100)
}

# We can check the dimensions of the data with `dim`
# Before:
dim(original.data)
# After:
dim(ss.data)

# Step 3: Save modified data ----------
# 

target.file <- sprintf("%s/modified-data.rds", my.temp.dir)

saveRDS(file=target.file,ss.data)


# R session Info ----------
# 
sessionInfo()
