install.packages("usethis", "tidyverse","renv")
library(usethis)
library(renv)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(forcats)
library(GGally)

df <- as_tibble(iris)

ggpairs(iris, aes(color = Species))

# Summarize the data
summary_data <- iris %>%
  group_by(Petal.Length, Species) %>%
  summarise(Count = n(), .groups = "drop")

# Use geom_col() to plot
ggplot(summary_data, aes(x = Petal.Length, y = Count, fill = Species)) +
  geom_col() +
  theme(
    panel.background = element_blank(),  # Removes the background grid
    legend.title = element_text(size = 12)  # Adjusts the size of the legend title
  ) +
  labs(
    legend.title = "Petal length by species"  
  )

