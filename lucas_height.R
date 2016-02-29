# Packages
library(ggplot2)
library(dplyr)

# Raw data must be in the working directory
setwd("~/Documents/github/epl_player_height")

# Read dataset
df <- read.csv("data-jX2NV.csv", stringsAsFactors = FALSE)

# Rename columns and subset data
df2 <- df %>%
  rename("Height" = Height..m.) %>%
  arrange(desc(Height)) %>%
  filter(Club == "Liverpool" | Club == "Manchester City") %>%
  mutate(Lucas = Player == "Lucas Leiva")

# Plot
ggplot(df2, aes(x = Height, y = reorder(Player, Height), color = Lucas)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("grey", "hotpink3")) +
  guides(color = FALSE) +
  labs(x = "Height (Meters)", y = "")