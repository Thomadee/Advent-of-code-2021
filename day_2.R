setwd("C://Users//thoma//OneDrive//Documents//R//Advent-of-code-2021")
library(tidyverse)

puzzle_input <- readLines("2021_day_2.txt")
day_2_data <- tibble(puzzle_input) %>% separate(puzzle_input, c("direction","measurement")) %>% 
 mutate(across(measurement, as.integer)) %>% group_by(direction) %>% 
  summarise(direction = unique(direction), measurement = sum(measurement))

1967*(2077-1046) #2027977




