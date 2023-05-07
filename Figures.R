library(tidyverse)

data_eyes <- read_csv("bears-data.csv") %>%
  filter(!(is.na(ratio_eyes)))

data_head <- read_csv("bears-data.csv") %>%
  filter(!(is.na(ratio_head)))

ggplot(data=data_eyes, aes(x = year, y = ratio_eyes)) +
  geom_point(size=2) + 
  xlab("\nyear") +
  ylab("eyes -> crown \n --------------------- \n eyes -> base of head\n") +
  geom_smooth(method="lm") +
  theme(text = element_text(size=13))
  
ggplot(data=data_head, aes(x = year, y = ratio_head)) +
  geom_point(size=2) + 
  xlab("\nyear") +
  ylab("snout -> back of head \n ---------------------------- \n crown -> base of head\n") +
  geom_smooth(method="lm") +
  theme(text = element_text(size=13))
       