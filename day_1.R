setwd("C://Users//thoma//OneDrive//Documents//R//Advent-of-code-2021")

puzzle_input <- readLines("2021_day_1.txt")
puzzle_numbers <- as.integer(puzzle_input)

library(tidyverse)
day_1_data <- tibble(puzzle_numbers)

###TASK1###

# Count the number of times a depth measurement increases from the previous measurement. 
# (There is no measurement before the first measurement.)
# How many measurements are larger than the previous measurement?

day_1_data_2 <- day_1_data %>% mutate(depth = puzzle_numbers
                                      - lag(puzzle_numbers)) %>%
mutate(in_or_dec = case_when (depth >0 ~ "increase",
                              depth <0 ~ "decrease"))

sum(day_1_data_2$in_or_dec == "increase", na.rm = TRUE)


###TASK2###

install.packages("zoo")
library(zoo)
test <- tibble(rollsum(day_1_data_2$puzzle_numbers, k=3, align = "left", fill = NA))

day_1_data_3 <- day_1_data_2 %>% mutate(rollsum(puzzle_numbers, k=3, align = "left", fill = NA))

names(day_1_data_3)[4] <- 'three_roll_sum'

day_1_data_4 <- day_1_data_3 %>%
  mutate(three_sliding_window = three_roll_sum - lag(three_roll_sum)) %>%
  mutate(in_or_dec_rolling = case_when (three_sliding_window >0 ~ "increase",
                                three_sliding_window <0 ~ "decrease"))

sum(day_1_data_4$in_or_dec_rolling == "increase", na.rm = TRUE)

