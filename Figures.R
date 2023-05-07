### require tidyverse/ggplot2

library(tidyverse)

### load data from CSV in working directory

# "data-eyes" selectively includes frontal images (for the "eyes ratio"):

data_eyes <- read_csv("bears-data.csv") %>%
  filter(!(is.na(ratio_eyes)))

# "data-eyes" selectively includes sagittal images (for the "head ratio"):

data_head <- read_csv("bears-data.csv") %>%
  filter(!(is.na(ratio_head)))

### Generate figures

# Figure 1:  eyes -> crown / eyes -> base of head

ggplot(data=data_eyes, aes(x = year, y = ratio_eyes)) +
  geom_point(size=2) + 
  xlab("\nyear") +
  ylab("eyes -> crown \n --------------------- \n eyes -> base of head\n") +
  geom_smooth(method="lm") + # plot basic regression line, 95% confidence intervals
  theme(text = element_text(size=13))

# Figure 2:  snout -> back of head / crown -> base of head
  
ggplot(data=data_head, aes(x = year, y = ratio_head)) +
  geom_point(size=2) + 
  xlab("\nyear") +
  ylab("snout -> back of head \n ---------------------------- \n crown -> base of head\n") +
  geom_smooth(method="lm") + # plot basic regression line, 95% confidence intervals
  theme(text = element_text(size=13))
       