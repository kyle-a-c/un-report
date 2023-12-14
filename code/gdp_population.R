#Script to analyze relationship between GDP and Life Expectancy
library(tidyverse)
gapminder_1997 <- read_csv("gapminder_1997.csv")
View(gapminder_1997)
name <- "Ben"
name 

age <- 26
age

name <- "Harry Potter"
name

name_character <- "Frodo Bagins"

  
test <- read_csv("gapminder_1997.csv")

Sys.Date()

getwd()

sum(5, 6)

round(3.1415, digits = 3)

read_csv(file = 'gapminder_1997.csv')

Sys.Date() #outputs the current date, used for knowing when I last ran

getwd() #outputs the current directory

gapminder_1997 <- read_csv(file='gapminder_1997.csv')
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title = "Does GDP Impact Life Expectancy?") + 
  aes(color = continent) +
  scale_color_brewer(palette = "Set1") +
  aes(size = pop/1000000) + #pop is the varialbe in the dataset
  labs(size = "Population (in millions)") +
  aes(shape = continent)


gapminder_1997 <- read_csv(file='gapminder_1997.csv')
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color = continent, size = pop/1000000,
      shape = continent) +
  geom_point() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "GDP Per Capita", y = "Life Expectancy",
       title = "Does GDP Affect Life Expectancy?", 
       size = "Population (in millions)")
ggsave("figures/gdpPercap_lifeExp.png:")


gapminder_data <- read_csv("gapminder_data.csv")
dim(gapminder_data)
head(gapminder_data)
# year as x, life expect as y, content to define aesthetic color, use points
# to display it in the plot

gapminder_data <- read_csv(file='gapminder_data.csv')
ggplot(data = gapminder_data) +
  aes(x = year, y = lifeExp, color = continent) +
  geom_point()


ggsave("figures/gdpPercap_lifeExp.png")
  