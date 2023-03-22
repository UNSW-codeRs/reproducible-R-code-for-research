# title: "Preparing R code for reproducible research"
# subtitle: "Example code for plotting data"  
# author: "José R. Ferrer-Paris" 
# date: 'March 2023'

# This is an example script with lots of comments and only three steps, please see the presentation in the presentation folder of this repo and read the README file.

# Outline ----------
# - Preliminaries
# - Step 1: Input - Read the data
# - Step 2: Plot the data
# - Step 3: Output - Save plot
# - R session info and done !

# Preliminaries ----------
# This script read data prepared with the `01-data-download.R` script and outputs an image in pdf format.

# Step 1: Input - Read the data ----------

# our data is in a  temporal directory:
my.temp.dir <- tempdir()

# we use `sprintf` to add the path of the temporal directory and the name of the output file: `raw-data.csv`,
target.file <- sprintf("%s/modified-data.rds", my.temp.dir)

fred.data.subset <- readRDS(file=target.file)


# Step 2: Plot the data ----------

# We want to use ggplot2 to make cool graphics, the code will give an error if ggplot2 is not installed

if (!require(ggplot2)) {
  stop("Sorry, this code only works with the ggplot2 library")
}

## This is our code to make a very fancy plot of three important economic variables (?)

ggplot(fred.data.subset) +
  geom_point(aes(x=INDPRO, y=S.P.500, colour=RPI)) +
  labs(title='Three very important economic variables',
       subtitle='Data from the FRED-MD dataset') +
  xlab("Industrial production") +
  ylab("Stock Market") +
  scale_colour_continuous("Personal\nIncome",type = "viridis") +
  theme_linedraw()


# Step 3: Output - Save plot ----------
# 
# This will save the last ggplot as a pdf file in my Desktop 
ggsave(file="~/Desktop/ Very nice ggplot2 demostration!.pdf")

# Will this filepath and name work in your computer?

# R session Info ----------
# 
sessionInfo()
