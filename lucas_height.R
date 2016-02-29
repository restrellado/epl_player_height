# Packages
library(ggplot2)
library(dplyr)

# Raw data must be in the working directory
setwd("~/Documents/github/epl_player_height")

# Read dataset
df <- read.csv("data-jX2NV.csv", stringsAsFactors = FALSE)
med <- median(df$Height..m.)

# Rename columns and subset data
df2 <- df %>%
  rename("Height" = Height..m.) %>%
  arrange(desc(Height)) %>%
  filter(Club == "Liverpool" | Club == "Manchester City") %>%
  mutate(Lucas = Player == "Lucas Leiva")

# Plot
ggplot(df2, aes(x = Height, y = reorder(Player, Height), color = Lucas)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("dark grey", "hotpink3")) +
  guides(color = FALSE) +
  labs(x = "Height (Meters)", y = "") +
  geom_vline(xintercept = med, linetype = 3, size = 1.5) +
  annotate("text", label = "league median height",
           x = med + .040, y = "Lucas Leiva", size = 4)