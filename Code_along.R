
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




#### _____ END OF INTRO TO R _________ ####



download.file("https://ndownloader.figshare.com/files/2292169",
              "data/portal_data_joined.csv")


surveys <- read.csv("data/portal_data_joined.csv")





