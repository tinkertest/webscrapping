# Import the libraries

library(robotstxt)
library(rvest)

# Assign a variable for the website link

url <- "https://en.wikipedia.org/wiki/World_population"

# Check whether the website is allowed to scrap

path <- paths_allowed(url)

# HTML Elements from website

my_html <- read_html(url)
View(my_html)

# Segregating the tables

population_table <- html_nodes(my_html,'table')
View(population_table)

# Storing a table

final_table <- html_table(population_table)[[5]]

View(final_table)

# Slicing the table

population <- final_table[,1:4]
View(population)

# Saving the file

write.csv(population, "Top10populouscountry.csv")
