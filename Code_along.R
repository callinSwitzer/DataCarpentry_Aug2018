
### INTRO TO R

3 + 5
12 / 7

weight_kg <- 55
weight_kg

(weight_kg <- 55)

2.2 * weight_kg

# re-assign value
weight_kg <- 57.5
2.2 * weight_kg


weight_lb <- 2.2 * weight_kg
weight_kg <- 100


# what is weight_lb? 126.6 or 220?
weight_lb


# challenge
mass <- 47.5            # mass?
age  <- 122             # age?
mass <- mass * 2.0      # mass?
age  <- age - 20        # age?
mass_index <- mass/age  # mass_index?

# functions
a = 10
b <- sqrt(a)
b

# fxns with multiple arguments
round(3.14159)
?round
args(round)
round(3.14159, 2)
round(x = 3.14159, digits = 2)
round(digits = 2, 3.14159)


# vectors
weight_g <- c(50, 60, 65, 82)
weight_g

animals <- c("mouse", "rat", "dog")
animals

length(weight_g)
length(animals)

class(weight_g)
class(animals)

str(weight_g)
str(animals)

weight_g <- c(weight_g, 90) # add to the end of the vector
weight_g <- c(30, weight_g) # add to the beginning of the vector
weight_g

typeof(weight_g)

#challenge
num_char <- c(1, 2, 3, "a")
class(num_char)
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)


# subsetting vectors
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animals[c(3, 2)]
more_animals <- animals[c(1, 2, 3, 2, 1, 4)]
more_animals

weight_g <- c(21, 34, 39, 54, 55)
weight_g[c(TRUE, FALSE, TRUE, TRUE, FALSE)]

weight_g > 50
weight_g[weight_g > 50]

weight_g[weight_g < 30 | weight_g > 50]
weight_g[weight_g >= 30 & weight_g == 21]

animals <- c("mouse", "rat", "dog", "cat")
animals[animals == "cat" | animals == "rat"]

animals %in% c("rat", "cat", "dog", "duck", "goat")

animals[animals %in% c("rat", "cat", "dog", "duck", "goat")]


# challenge
"four" > "five"



heights <- c(2, 4, 4, NA, 6)
mean(heights)
max(heights)
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

## Extract those elements which are not missing values.
heights[!is.na(heights)]

## Returns the object with incomplete cases removed. The returned object is an atomic vector of type `"numeric"` (or `"double"`).
na.omit(heights)

## Extract those elements which are complete cases. The returned object is an atomic vector of type `"numeric"` (or `"double"`).
heights[complete.cases(heights)]


# challenge
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)

# create new vector with NA's removed
heights_no_na <- heights[!is.na(heights)]

# calculate median
median(heights, na.rm = TRUE)

# calculate how many people are taller than 67 inches
length(heights_no_na[heights_no_na>67])




#### _____ STARTING WITH DATA _________ ####



download.file("https://ndownloader.figshare.com/files/2292169",
              "data/portal_data_joined.csv")


surveys <- read.csv("data/portal_data_joined.csv")

head(surveys)

View(surveys)

#structure
str(surveys)
summary(surveys)

# size
dim(surveys)
nrow(surveys)
ncol(surveys)


# content
head(surveys)
tail(surveys)

# Names
names(surveys)
rownames(surveys)

#challenge
# Based on the output of str(surveys), can you answer the following questions?
# What is the class of the object surveys?
# How many rows and how many columns are in this object?
# How many species have been recorded during these surveys?

# indexing and subsetting
# first element in the first column of the data frame (as a vector)
surveys[1, 1]   
# first element in the 6th column (as a vector)
surveys[1, 6]   
# first column of the data frame (as a vector)
surveys[, 1]    
# first column of the data frame (as a data.frame)
surveys[1]      
# first three elements in the 7th column (as a vector)
surveys[1:3, 7] 
# the 3rd row of the data frame (as a data.frame)
surveys[3, ]    
# equivalent to head_surveys <- head(surveys)
head_surveys <- surveys[1:6, ] 


surveys["species_id"]       # Result is a data.frame
surveys[, "species_id"]     # Result is a vector
surveys[["species_id"]]     # Result is a vector
surveys$species_id          # Result is a vector



# Factors

sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)
sex

# change level order
sex <- factor(sex, levels = c("male", "female"))
sex

# convert to character
as.character(sex)

# converting factors to numbers doesn't work in an intuitive way
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

# Notice that in the levels() approach, three important steps occur:
#   
# We obtain all the factor levels using levels(year_fct)
# We convert these levels to numeric values using as.numeric(levels(year_fct))
# We then access these numeric values using the underlying integers of the vector year_fct inside the square brackets

# plotting factors (base R)
plot(surveys$sex)

sex <- surveys$sex
head(sex)
levels(sex)

# changing names of factors
levels(sex)[1] <- "undetermined"
levels(sex)
head(sex)

# Challenge
# Rename “F” and “M” to “female” and “male” respectively.
# Now that we have renamed the factor level to “undetermined”, can you recreate the barplot such that “undetermined” is last (after “male”)?



# stringsAsFactors 
surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = TRUE)
str(surveys)
surveys <- read.csv("data/portal_data_joined.csv", stringsAsFactors = FALSE)
str(surveys)
## Convert the column "plot_type" into a factor
surveys$plot_type <- factor(surveys$plot_type)


# Challenge
# We have seen how data frames are created when using read.csv(), but they can also be created by hand with the data.frame() function. There are a few mistakes in this hand-crafted data.frame. Can you spot and fix them? Don’t hesitate to experiment!
# animal_data <- data.frame(
#     animal = c(dog, cat, sea cucumber, sea urchin),
#     feel = c("furry", "squishy", "spiny"),
#     weight = c(45, 8 1.1, 0.8)
#   )

#Can you predict the class for each of the columns in the following example? Check your guesses using str(country_climate):
# Are they what you expected? Why? Why not?
#   What would have been different if we had added stringsAsFactors = FALSE when creating the data frame?
#   What would you need to change to ensure that each column had the accurate data type?
country_climate <- data.frame(
  country = c("Canada", "Panama", "South Africa", "Australia"),
  climate = c("cold", "hot", "temperate", "hot/temperate"),
  temperature = c(10, 30, 18, "15"),
  northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
  has_kangaroo = c(FALSE, FALSE, FALSE, 1)
)


# formatting dates
str(surveys)

library(lubridate)
my_date <- ymd(paste("2015", "1", "1", sep = "-")) 
str(my_date)

paste(surveys$year, surveys$month, surveys$day, sep = "-")
ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
surveys$date <- ymd(paste(surveys$year, surveys$month, surveys$day, sep = "-"))
str(surveys) # notice the new column, with 'date' as the class
summary(surveys$date)

# investigate missing data
is_missing_date <- is.na(surveys$date)
date_columns <- c("year", "month", "day")
missing_dates <- surveys[is_missing_date,  date_columns]

missing_dates # sept has only 30 days



#####_______ Manipulating data frames _______#####
library("tidyverse")
surveys <- read_csv("data/portal_data_joined.csv")
## inspect the data
str(surveys) # different than before useing tidyverse.  tbl_df displays data tyep and only shows enought data to fit on one screen.  Also, strings are not factors.

## preview the data
# View(surveys)

## manipulation with dplyr
# get columns
select(surveys, plot_id, species_id, weight)

# get rows 
filter(surveys, year == 1995)

# combining operations 

# method 1: intermediate steps
surveys2 <- filter(surveys, weight < 5)
surveys_sml <- select(surveys2, species_id, sex, weight)

# method 2: nested functions
surveys_sml <- select(filter(surveys, weight < 5), species_id, sex, weight)

# method 3: pipes - takes output of one function and sends it directly to the next
# takes object to left and passes as 1st argument to the function on the right
# think of pipes as the word "then"
surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

surveys_sml <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

surveys_sml

#challenge
# Using pipes, subset the surveys data to include animals collected before 1995 and retain only the columns  year, sex, and weight.

# mutate -- create new columns based on exisiting ones
surveys %>% 
  mutate(weight_kg = weight / 1000)

surveys %>%
  mutate(weight_kg = weight / 1000,
         weight_kg2 = weight_kg * 2)

# another example to get rid of NA's
surveys %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight / 1000) %>%
  head()

# challenge
# Create a new data frame from the surveys data that meets the following criteria: contains only the  species_id column and a new column called hindfoot_half containing values that are half the  hindfoot_length values. In this hindfoot_half column, there are no NAs and all values are less than 30.

# 
# surveys_2 <- surveys %>%
#   mutate(hindfoot_half = hindfoot_length / 2) %>%
#   filter(!is.na(hindfoot_half)) %>%
#   filter(hindfoot_half > 30) %>%
#   select(species_id, hindfoot_half)


# split-apply-combine
# split data into groups, apply some analysis, combine results
# use summarize() and group_by()
surveys %>%
  group_by(sex) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE)) 

# group by multiple columns
surveys %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight, na.rm = TRUE))  # contains NaN's


# remove missing values first
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight))


# can print more lines
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight)) %>%
  print(n = 15)


# summarizing variables at the same time
# ex. min weight for each species for each sex
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight))


# reordering by min_weight
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  arrange(min_weight)


# descending order arrangement
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            min_weight = min(weight)) %>%
  arrange(desc(mean_weight))


## Counting
surveys %>%
  count(sex)

# count() is shorthand
surveys %>%
  group_by(sex) %>%
  summarize(count = n())


# sort counts
surveys %>%
  count(sex, sort = TRUE)

# count by multiple categories
surveys %>%
  count(sex, species)

# arrange counts
surveys %>% 
  count(sex, species) %>%
  arrange(species, desc(n)) # alphabetical order with decreasing counts


# challenge
# How many animals were caught in each plot_type surveyed?
# Use group_by() and summarize() to find the mean, min, and max hindfoot length for each species (using species_id). Also add the number of observations (hint: see ?n).
# What was the heaviest animal measured in each year? Return the columns year, genus,  species_id, and weight.



# reshaping with gather and spread

# first create a new datasest to work with
surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>%
  summarize(mean_weight = mean(weight))

str(surveys_gw)


# spread
# the data
# the key column variable whose values will become new column names.
# the value column variable whose values will fill the new column variables.
surveys_spread <- surveys_gw %>%
  spread(key = genus, value = mean_weight)

str(surveys_spread)

# can fill NAs with 0s
surveys_gw %>%
  spread(genus, mean_weight, fill = 0) %>%
  head()


# gather
# the data
# the key column variable we wish to create from column names.
# the values column variable we wish to create and fill with values associated with the key.
# the names of the columns we use to fill the key variable (or to drop).


# recreate surveys_gw from surveys_spread
surveys_gather <- surveys_spread %>%
  gather(key = genus, value = mean_weight, -plot_id) # do with all columns except plot_id

str(surveys_gather)
surveys_gather

# gather certain columns
surveys_spread %>%
  gather(key = genus, value = mean_weight, Baiomys:Spermophilus) %>%
  head()
# challenge
# Spread the surveys data frame with year as columns, plot_id as rows, and the number of genera per plot as the values. You will need to summarize before reshaping, and use the function  n_distinct() to get the number of unique genera within a particular chunk of data. It’s a powerful function! See ?n_distinct for more.
# Answer
# Now take that data frame and gather() it again, so each row is a unique plot_id by year combination.
# Answer
# The surveys data set has two measurement columns: hindfoot_length and weight. This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let’s walk through a common solution for this type of problem. First, use  gather() to create a dataset where we have a key column called measurement and a value column that takes on the value of either hindfoot_length or weight. Hint: You’ll need to specify which columns are being gathered.
# Answer
# With this new data set, calculate the average of each measurement in each year for each different  plot_type. Then spread() them into a data set with a column for hindfoot_length and weight. Hint: You only need to specify the key and value columns for spread().


## Exporting data


# first clean dataset

surveys_complete <- surveys %>%
  filter(!is.na(weight),           # remove missing weight
         !is.na(hindfoot_length),  # remove missing hindfoot_length
         !is.na(sex))                # remove missing sex

## Extract the most common species_id
species_counts <- surveys_complete %>%
  count(species_id) %>% 
  filter(n >= 50)

## Only keep the most common species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)

dim(surveys_complete)

write_csv(surveys_complete, path = "data_output/surveys_complete.csv")




##### ______ Visualizing Data _____ #####

library("tidyverse")
surveys_complete <- read_csv("data_output/surveys_complete.csv")


# plot
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

# can add to plot
# Assign plot to a variable
surveys_plot <- ggplot(data = surveys_complete, 
                       mapping = aes(x = weight, y = hindfoot_length))

# Draw the plot
surveys_plot + 
  geom_point()


# challenge
# Scatter plots can be useful exploratory tools for small datasets. For data sets with large numbers of observations, such as the surveys_complete data set, overplotting of points can be a limitation of scatter plots. One strategy for handling such settings is to use hexagonal binning of observations. The plot space is tessellated into hexagons. Each hexagon is assigned a color based on the number of observations that fall within its boundaries. To use hexagonal binning with ggplot2, first install the R package hexbin from CRAN:
#   
#   install.packages("hexbin")
# library(hexbin)
# Then use the geom_hex() function:
#   
#   surveys_plot +
#   geom_hex()
# What are the relative strengths and weaknesses of a hexagonal bin plot compared to a scatter plot? Examine the above scatter plot and compare it with the hexagonal bin plot that you created.


# build plots iteratively
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()

# alpha
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1)

# color
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, color = "blue")

# color by factor
ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha = 0.1, aes(color = species_id))

# challenge
# Use what you just learned to create a scatter plot of weight over species_id with the plot types showing in different colors. Is this a good way to show this type of data?


# boxplot
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot()

# show points
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato")


# Challenge
# Boxplots are useful summaries, but hide the shape of the distribution. For example, if the distribution is bimodal, we would not see it in a boxplot. An alternative to the boxplot is the violin plot, where the shape (of the density of points) is drawn.
# 
# Replace the box plot with a violin plot; see geom_violin().
# In many types of data, it is important to consider the scale of the observations. For example, it may be worth changing the scale of the axis to better distribute the observations in the space of the plot. Changing the scale of the axes is done similarly to adding/modifying other components (i.e., by incrementally adding commands). Try making these modifications:
#   
#   Represent weight on the log10 scale; see scale_y_log10().
# So far, we’ve looked at the distribution of weight within species. Try making a new plot to explore the distribution of another variable within each species.
# 
# Create a boxplot for hindfoot_length. Overlay the boxplot layer on a jitter layer to show actual measurements.
# 
# Add color to the data points on your boxplot according to the plot from which the sample was taken (plot_id).
# 
# Hint: Check the class for plot_id. Consider changing the class of plot_id from integer to factor. Why does this change how R makes the graph?
  

# Timeseries plots
yearly_counts <- surveys_complete %>%
  count(year, species_id)

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line()

# modify aes to group by spec
ggplot(data = yearly_counts, mapping = aes(x = year, y = n, group = species_id)) +
  geom_line()

# color by spp
ggplot(data = yearly_counts, mapping = aes(x = year, y = n, color = species_id)) +
  geom_line()


# faceting

ggplot(data = yearly_counts, mapping = aes(x = year, y = n)) +
  geom_line() +
  facet_wrap(~ species_id)

# split line by sex
yearly_sex_counts <- surveys_complete %>%
  count(year, species_id, sex)

ggplot(data = yearly_sex_counts, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id)


# white background -- there are lots of themes
ggplot(data = yearly_sex_counts, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  theme_bw() +
  theme(panel.grid = element_blank())

# challenge
# Use what you just learned to create a plot that depicts how the average weight of each species changes through the years.


# facet with rows
# One column, facet by rows
yearly_sex_weight <- surveys_complete %>%
  group_by(year, sex, species_id) %>%
  summarize(avg_weight = mean(weight))

ggplot(data = yearly_sex_weight, 
       mapping = aes(x = year, y = avg_weight, color = species_id)) +
  geom_line() +
  facet_grid(sex ~ .)

# One row, facet by column
ggplot(data = yearly_sex_weight, 
       mapping = aes(x = year, y = avg_weight, color = species_id)) +
  geom_line() +
  facet_grid(. ~ sex)


# customization

ggplot(data = yearly_sex_counts, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = "Observed species in time",
       x = "Year of observation",
       y = "Number of species") +
  theme_bw()

# change text size
ggplot(data = yearly_sex_counts, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = "Observed species in time",
       x = "Year of observation",
       y = "Number of species") +
  theme_bw() +
  theme(text=element_text(size = 16))

# change orientation
ggplot(data = yearly_sex_counts, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = "Observed species in time",
       x = "Year of observation",
       y = "Number of species") +
  theme_bw() +
  theme(axis.text.x = element_text(colour = "grey20", size = 12, angle = 90, hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(colour = "grey20", size = 12),
        text = element_text(size = 16))


# creating custom themes

grey_theme <- theme(axis.text.x = element_text(colour = "grey20", size = 12, angle = 90, hjust = 0.5, vjust = 0.5),
                    axis.text.y = element_text(colour = "grey20", size = 12),
                    text = element_text(size = 16))
ggplot(surveys_complete, aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot() +
  grey_theme



# arranging and exporting plots
install.packages("gridExtra")
library(gridExtra)
spp_weight_boxplot <- ggplot(data = surveys_complete, 
                             mapping = aes(x = species_id, y = weight)) +
  geom_boxplot() +
  xlab("Species") + ylab("Weight (g)") +
  scale_y_log10()

spp_count_plot <- ggplot(data = yearly_counts, 
                         mapping = aes(x = year, y = n, color = species_id)) +
  geom_line() + 
  xlab("Year") + ylab("Abundance")

grid.arrange(spp_weight_boxplot, spp_count_plot, ncol = 2, widths = c(4, 6))



# saving
my_plot <- ggplot(data = yearly_sex_counts, 
                  mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  facet_wrap(~ species_id) +
  labs(title = "Observed species in time",
       x = "Year of observation",
       y = "Number of species") +
  theme_bw() +
  theme(axis.text.x = element_text(colour = "grey20", size = 12, angle = 90, hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(colour = "grey20", size = 12),
        text=element_text(size = 16))
ggsave("fig_output/yearly_sex_counts.png", my_plot, width = 15, height = 10)

# This also works for grid.arrange() plots
combo_plot <- grid.arrange(spp_weight_boxplot, spp_count_plot, ncol = 2, widths = c(4, 6))
ggsave("fig_output/combo_plot_abun_weight.png", combo_plot, width = 10, dpi = 300)



##### _____ R and SQL _____ #####

install.packages(c("dbplyr", "RSQLite"))
dir.create("data", showWarnings = FALSE) # make directory, if doesn't exist already
download.file(url = "https://ndownloader.figshare.com/files/2292171",
              destfile = "data/portal_mammals.sqlite", mode = "wb")
library(dplyr)
library(dbplyr)

# connect to database (doesn't load)
mammals <- DBI::dbConnect(RSQLite::SQLite(), "data/portal_mammals.sqlite")

# look at what is in the db
src_dbi(mammals)

# querying database with SQL syntax
tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys"))

# querying with dplyr syntax

surveys <- tbl(mammals, "surveys") #surveys now behaves like a dataframe
surveys %>%
  select(year, species_id, plot_id)

head(surveys, n = 10)

# some fxns don't work as expected
nrow(surveys)

# show sql commands
show_query(head(surveys, n = 10))


# simple queries with dplyr
surveys %>%
  filter(weight < 5) %>% 
  select(species_id, sex, weight) 


# you can assign to variables, just like data frames
data_subset <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

data_subset %>%
  select(-sex)

# to load all data into R, use collect()
data_subset <- surveys %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight) %>%
  collect()
str(data_subset) # now tbl_df, instead of sql connection


# complex database queries


# joining plots and surveys tables

plots <- tbl(mammals, "plots")
plots


# plot_id is common among tables
surveys

plots %>%
  filter(plot_id == 1) %>%
  inner_join(surveys) %>%
  collect() # returns all rows


# challenge
# Write a query that returns the number of rodents observed in each plot in each year.
# 
# Hint: Connect to the species table and write a query that joins the species and survey tables together to exclude all non-rodents. The query should return counts of rodents by year.
# 
# Optional: Write a query in SQL that will produce the same result. You can join multiple tables together using the following syntax where foreign key refers to your unique id (e.g., species_id):


# SELECT table.col, table.col
# FROM table1 JOIN table2
# ON table1.key = table2.key
# JOIN table3 ON table2.key = table3.key

# Challenge
# Write a query that returns the total number of rodents in each genus caught in the different plot types.
# 
# Hint: Write a query that joins the species, plot, and survey tables together. The query should return counts of genus by plot type.
  

# use dplyr to find
# number of genera found in each plot type  
species <- tbl(mammals, "species")
unique_genera <- left_join(surveys, plots) %>%
  left_join(species) %>%
  group_by(plot_type) %>%
  summarize(
    n_genera = n_distinct(genus)
  ) %>%
  collect()


# creating new SQLite database

# tidyverse loads readr, which has read_csv() function
library(tidyverse)

# download files
# species
download.file("https://ndownloader.figshare.com/files/3299483",
              "data/species.csv")
# surveys
download.file("https://ndownloader.figshare.com/files/10717177",
              "data/surveys.csv")
# plots
download.file("https://ndownloader.figshare.com/files/3299474",
              "data/plots.csv")


species <- read_csv("data/species.csv")
surveys <- read_csv("data/surveys.csv")
plots <- read_csv("data/plots.csv")


# create database
my_db_file <- "data_output/portal-database-output.sqlite"
my_db <- src_sqlite(my_db_file, create = TRUE)
my_db

copy_to(my_db, surveys)
copy_to(my_db, plots)
copy_to(my_db, species)
my_db

