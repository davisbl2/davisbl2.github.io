##########################################################################################
#### Chapter 2 - Introduction to R
##########################################################################################
### Creating objects in R


### Challenge
##
## What are the values after each statement in the following?

mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

## Answers:





#########################################################################################

### Vectors and data types

### Challenge
## 1. We’ve seen that atomic vectors can be of type character, numeric, integer, and
##    logical. But what happens if we try to mix these types in a single
##    vector?
## 
## 2. What will happen in each of these examples? (hint: use `class()` to
##    check the data type of your object)
##
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
## 
## 3. Why do you think it happens?
##
## 4. How many values in combined_logical are "TRUE" (as a character) in the
##    following example:
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)
## 
## 5. You've probably noticed that objects of different types get
##    converted into a single, shared type within a vector. In R, we call
##    converting objects from one class into another class
##    _coercion_. These conversions happen according to a hierarchy,
##    whereby some types get preferentially coerced into other types. Can
##    you draw a diagram that represents the hierarchy of how these data
##    types are coerced?

## Answers:

# 1. 


# 2.


# 3. 


# 4. 


# 5. 



#########################################################################################

### Challenge (optional)
##
## * Can you figure out why `"four" > "five"` returns `TRUE`?

# Answer:

##  

#########################################################################################

### Challenge
## 1. Using this vector of heights in inches, create a new vector with the NAs removed.
##
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 
             64, 70, 63, 65)
##
## 2. Use the function `median()` to calculate the median of the `heights` vector.
##
## 3. Use R to figure out how many people in the set are taller than 67 inches.
### Presentation of the survey data

# Answers:

# 1.


# 2.


# 3.



##########################################################################################
#### Chapter 3 - Starting with data
##########################################################################################

if (!dir.exists("data_raw")) dir.create("data_raw")

download.file(url="https://ndownloader.figshare.com/files/2292169",
              destfile = "data_raw/portal_data_joined.csv")

surveys <- read.csv("data_raw/portal_data_joined.csv")

view(surveys)
#########################################################################################
### Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?

## 1. What is the class of the object `surveys`?
## 2. How many rows and how many columns are in this object?
## 3. How many species have been recorded during these surveys?

# Answers:

# 1.


# 2. 


# 3.


#
#########################################################################################

## Indexing and subsetting data frames

### Challenge:
###
### 1. Create a `data.frame` (`surveys_200`) containing only the
###    data in row 200 of the `surveys` dataset.
###
### 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
###
###      * Use that number to pull out just that last row in the data frame
###      * Compare that with what you see as the last row using `tail()` to make
###        sure it's meeting expectations.
###      * Pull out that last row using `nrow()` instead of the row number
###      * Create a new data frame object (`surveys_last`) from that last row
###
### 3. Use `nrow()` to extract the row that is in the middle of the
###    data frame. Store the content of this row in an object named
###    `surveys_middle`.
###
### 4. Combine `nrow()` with the `-` notation above to reproduce the behavior of
###    `head(surveys)`, keeping just the first through 6th rows of the surveys
###    dataset.

# Answers:
# 1.


# 2.


# 3.


# 4.



#########################################################################################
### Factors

## Challenge
sex <- surveys$sex
## 1.  Rename "F" and "M" to "female" and "male" respectively.
## 2.  Now that we have renamed the factor level to "undetermined", can you recreate the
##     barplot such that "undetermined" is last (after "male")

# Answers:

# 1. 


# 2. 


# Or with ggplot2



#########################################################################################

### Compare the difference between our data read as `factor` vs `character`.
surveys <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = TRUE)
str(surveys)
surveys <- read.csv("data_raw/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys)
## ## Convert the column "plot_type" into a factor
surveys$plot_type <- factor(surveys$plot_type)

#########################################################################################

#### Challenge:

## 1.  There are a few mistakes in this hand-crafted `data.frame`,
##     can you spot and fix them? Don't hesitate to experiment!

## animal_data <- data.frame(
##       animal = c(dog, cat, sea cucumber, sea urchin),
##       feel = c("furry", "squishy", "spiny"),
##       weight = c(45, 8 1.1, 0.8)
##       )


## 2.   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would have been different if we had added `stringsAsFactors = FALSE`
## ##     when we created this data frame?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
## country_climate <- data.frame(country = c("Canada", "Panama", "South Africa", "Australia"),
##                                climate = c("cold", "hot", "temperate", "hot/temperate"),
##                                temperature = c(10, 30, 18, "15"),
##                                northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
##                                has_kangaroo = c(FALSE, FALSE, FALSE, 1))

# Answers:

# 1. 
# * 
# *
# *

# 2.
# * 
# * 
# * 



##########################################################################################
#### Chapter 4 - Data Manipulation using dplyr and tidyr
##########################################################################################
library(tidyverse)
surveys <- read_csv("data_raw/portal_data_joined.csv")
##########################################################################################
###  Challenge (Subset):

##   Using pipes, subset the surveys data to include animals collected
##   before 1995, and retain the columns `year`, `sex`, and `weight.`

# Answer:
surveys %>%
  filter(year < 1995) %>% 
  select(year, sex, weight)


##########################################################################################
### Challenge (Mutate):

##   Create a new data frame from the surveys data that meets the following criteria: 
##   contains only the species_id column and a new column called hindfoot_cm 
##   containing the hindfoot_length values converted to centimeters. In this 
##   hindfoot_cm column, there are no NAs and all values are less than 3.
## 
##   Hint: think about how the commands should be ordered to produce this data frame.
##   What are the original units for hindfoot_length?

# Answer:



##########################################################################################

### Challenge (Count)

##  1. How many animals were caught in each `plot_type`?
## 
##  2. Use `group_by()` and `summarize()` to find the mean, min, and max
##     hindfoot length for each species (using `species_id`). Also add the number of
##     observations (hint: see `?n`).
## 
##  3. What was the heaviest animal measured in each year? Return the
##     columns `year`, `genus`, `species_id`, and `weight`.

# Answers:

# 1. 




# 2.




# 3. 




##########################################################################################
## ## Reshaping challenges
## 
## 1. Create a “wider” new tibble from the surveys data frame named 
##    surveys_spread_genera using the pivot_wider() function with year 
##    as columns, plot_id as rows, and the number of genera per plot 
##    as the values. You will need to 
##    summarize before reshaping, and use the function n_distinct() to get 
##    the number of unique genera within a particular chunk of data. It’s a 
##    powerful function! See ?n_distinct for additional information.

## 2. Now take that data frame and use pivot_longer so that each row is a 
##    unique plot_id by year combination.

## 3. The `surveys` data set has two measurement columns: `hindfoot_length` and 
##    `weight`.  This makes it difficult to do things like look at the relationship 
##     between mean values of each measurement per year in different plot types. 
##     Let's walk through a common solution for this type of problem. First, 
##    use `pivot_longer()` to create a dataset where the `names_to` column is 
##    `measurement` and the `values_to` column is `value` that takes on the 
##     value of either `hindfoot_length` or `weight`. *Hint*: You'll need to 
##     specify which columns are being gathered/pivoted.

## 4. With this new data set, calculate the average of each `measurement` in 
##    each `year` for each different `plot_type`. Use `pivot_wider()` to 
##    spread the results with a column for `hindfoot_length` and `weight`. 
##    *Hint*: You only need to specify the `names_from` and `values_from` 
##    arguments for `pivot_wider()`.

### Answers:

# 1. 




# 2.




# 3.




# 4.




##########################################################################################

## ### Create the dataset for exporting:
## Let’s start by removing observations of animals for which weight and 
## hindfoot_length are missing, or the sex has not been determined:

surveys_complete <- surveys %>%
  filter(!is.na(weight),             # remove missing weight
         !is.na(hindfoot_length),    # remove missing hindfoot_length
         !is.na(sex))                # remove missing sex 

## Extract the most common species_id
species_counts <- surveys_complete %>%
  count(species_id) %>% 
  filter(n >= 50)
## Only keep the most common species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)
dim(surveys_complete)
if (!dir.exists("data")) dir.create("data")
write_csv(surveys_complete, path = "./data/surveys_complete.csv")

##########################################################################################
#### Chapter 5 - Using ggplot2
##########################################################################################


### Challenge

##  Use what you just learned to create a scatter plot of weight versus species_id 
##  with the plot types shown in different colors.

## Answer:



##########################################################################################

### Challenge with boxplots:
###  Start with the boxplot we created:

## ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
##   geom_boxplot(alpha = 0) +
##   geom_jitter(alpha = 0.3, color = "tomato")
## 
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
## 
## ##  2. Represent weight on the log10 scale; see `scale_y_log10()`.
##
#####################################
## 
## ##  3. Create boxplot for `hindfoot_length` overlaid on a jitter layer.
## 
## ##  4. Add color to the data points on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  *Hint:* Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
## 

## Answers:

### 1 and 2


### 3 and 4




##########################################################################################
##
## ### Plotting time series challenge:
## ##
## ##  Use what you just learned to create a plot that depicts how the
## ##  average weight of each species changes through the years.
## 
##
## Answer:




##########################################################################################
###
### Final plotting challenge if time allows:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://www.rstudio.com/wp-content/uploads/2015/08/ggplot2-cheatsheet.pdf


##########################################################################################