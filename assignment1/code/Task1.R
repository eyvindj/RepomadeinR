install.packages("usethis", "tidyverse","renv")
library(usethis)
library(renv)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(forcats)
library(GGally)

df <- as_tibble(iris)

pairs <- ggpairs(iris, aes(color = Species))


# Summarize the data
summary_data <- iris %>%
  group_by(Petal.Length, Species) %>%
  summarise(Count = n(), .groups = "drop")

# Use geom_col() to plot
column <- ggplot(summary_data, aes(x = Petal.Length, y = Count, fill = Species)) +
  geom_col() +
  theme(
    panel.background = element_blank(),  # Removes the background grid
    legend.title = element_text(size = 12)  # Adjusts the size of the legend title
  ) +
  labs(
    legend.title = "Petal length by species"  
  )
head(df)
smooth <- ggplot(df, aes(x=Petal.Length, y=Sepal.Width, fill = Species))+
  geom_smooth()+
  geom_point()+
  labs(
      title = 'Experimental plot',
      fill  = "Group by species" )+
        
  theme(
      panel.background = element_blank()
      
  
      
  )

plot_list <- list(pairs, column, smooth)
# Save all plots in the list
for (i in seq_along(plot_list)) {
  ggsave(
    filename = sprintf("assignment1/figures/figure_%d.png", i), # Format file name as figure_1, figure_2, etc.
    plot = plot_list[[i]], # Access each plot in the list
    width = 8,
    height = 6
  )
}