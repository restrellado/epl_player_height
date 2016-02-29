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
  mutate(Lucas = Player == "Lucas Leiva") %>%
  mutate(Color = Club == "Manchester City")

# Plot
ggplot(df2, aes(x = Height, y = reorder(Player, Height), shape = Lucas,
                color = Color)) +
  geom_point(size = 3) +
  scale_color_manual(values = c("red", "sky blue")) +
  guides(color = FALSE, shape = FALSE) +
  labs(x = "Height (Meters)", y = "") +
  geom_vline(xintercept = med, linetype = 3, size = 1.5) +
  annotate("text", label = "league median height",
           x = med + .060, y = "Philippe Coutinho", size = 4) +
  annotate("text", label = "Lucas",
           x = (df2$Height[df2$Player == "Lucas Leiva"]) - .020,
           y = "Lucas Leiva",
           color = "red", size = 4)