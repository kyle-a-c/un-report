library(tidyverse)

gapminder_data <- read_csv("gapminder_data.csv")

summarise(gapminder_data, averageLifeExp = mean(lifeExp))

gapminder_data %>% summarize(averageLifeExp = mean(lifeExp))

gapminder_data %>%
    summarize(averageLifeExp = mean(lifeExp))

gapminder_data_summarize <- gapminder_data %>% summarize(averageLifeExp = mean(lifeExp))

# The following will erase all of your data because you're putting in the 
# object you've created into the original data set.
gapminder_data <-  gapminder_data %>% summarize(averageLifeExp = mean(lifeExp))

gapminder_data %>% 
    summarise(recent_year = max(year))

gapminder_data %>% 
    filter(year == 2007) %>% 
    summarize(average = mean(lifeExp))


gapminder_data %>% 
  summarize(first_year_GDP = min(year)) 
gapminder_data %>% 
  filter(year == 1952) %>% 
  summarize(average_first_year_gdp = mean(gdpPercap))

gapminder_data %>% 
  filter(year == min(year)) %>% 
  summarize(average = mean(gdpPercap))
  
# Group by 
gapminder_data %>% 
  group_by(year) %>% 
  summarize(average = mean(lifeExp))


gapminder_data %>% 
  group_by(continent) %>% 
  summarize(average = mean(lifeExp))

gapminder_data %>% 
  group_by(continent) %>% 
  summarize(average=mean(lifeExp), min=min(lifeExp))

# mutate(), a function used to create new columns.

gapminder_data %>% 
    mutate(gdp = pop * gdpPercap)

gapminder_data %>% 
  mutate(gdp = pop * gdpPercap, popInMillions = pop/1000000)

#select

gapminder_data %>% 
  select(pop, year)

gapminder_data %>% 
  select(-continent)

# produce a dataframe that has only columns country, continent, year, life expectancy.

gapminder_data_countrycont_yearlife_columns <- gapminder_data %>% 
  select(country, continent, year, lifeExp)
  
gapminder_data %>% 
  select(country,continent,year,lifeExp) %>% 
  pivot_wider(names_from = year, values_from = lifeExp)


# new dataset named gapminder_data_2007

getwd()

gapminder_data_2007 <- read_csv("gapminder_data.csv") %>% 
  filter(year == 2007 & continent == "Americas") %>% 
  select(-year, -continent)

temp <- read_csv("co2-un-data.csv")

read_csv('co2-un-data.csv', skip = 1)

co2_emissions_dirty <- read_csv("co2-un-data.csv", skip = 2,
                                col_names = c("region", "country",
                                              "year", "series", "value",
                                              "footnotes", "source"))

co2_emissions_dirty

read_csv("co2-un-data.csv", skip = 1) %>% 
  rename(country=...2)

co2_emissions_dirty %>% 
  select(country,year, series, value)

co2_emissions_dirty %>% 
  select(country, year, series, value) %>% 
    mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)"="total_emissions",
                           "Emissions per capita (metric tons of carbon dioxide)"="per_capita_emissions"))

co2_emissions_dirty %>% 
  select(country, year, series, value) %>% 
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)"="total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)"="per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value)

co2_emissions_dirty %>% 
  select(country, year, series, value) %>% 
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)"="total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)"="per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value) %>% 
  count(year)

#filter out data from the year 2005 and drop the year column

co2_emissions_dirty %>% 
  filter(year == 2005) %>%
  select(country, year, series, value) %>% 
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)"="total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)"="per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value) %>% 
  select(-year)

co2_emissions  <- co2_emissions_dirty %>% 
  filter(year == 2005) %>%
  select(country, year, series, value) %>% 
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)"="total_emissions",
                         "Emissions per capita (metric tons of carbon dioxide)"="per_capita_emissions")) %>% 
  pivot_wider(names_from = series, values_from = value) %>% 
  select(-year)

inner_join(gapminder_data, co2_emissions)    

inner_join(gapminder_data, co2_emissions, by="country")

gapminder_co2 <- inner_join(gapminder_data_2007, co2_emissions, by="country")

ggplot(gapminder_co2, aes(x = gdpPercap, y = per_capita_emissions)) +
  geom_point() +
  labs(x="GDP (per capita)", y="CO2 emitted (per capita)",
  title = "Strong association between a nation's GDP and CO2 production")
