# Import the libraries

library(robotstxt)
library(rvest)

# Assign a variable for the url

url <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

# Check whether the website is allowed to scrap

path <- paths_allowed(url)

# HTML elements from the website

web <- read_html(url)

# Segregating the name of the movie

Name <- web%>%html_nodes(".lister-item-header a")%>%html_text()
View(Name)

# Year

Year <- web%>%html_nodes(".text-muted.unbold")%>%html_text()

# Ratings

Ratings <- web%>%html_nodes(".ratings-imdb-rating strong")%>%html_text()

# Duration

Duration <- web%>%html_nodes(".runtime")%>%html_text()

# Put into a dataframe
# Creating a dataframe

imdb.ratings <- data.frame(Name, Year, Ratings, Duration)

# View the dataframe

View(imdb.ratings)

# Saving the data

write.csv(imdb.ratings, "Imdbratings.csv")
