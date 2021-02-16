#base.R
x <- 1:10
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x
# is like setting a starting place so you can generate data similar to others
set.seed(123)
y <- x + rnorm(10, 0, 2)
y
DF <- data.frame(x = x, y = y)
rm("x", "y")
#rm is remove and removes from global environment
x
y
DF
plot(DF$x,DF$y)
plot(y~x, data = DF, col = "blue", pch = 19)

plot(y~x, data = DF, col = "blue", pch = 19, xlab = "data", ylab = "other.data", main = "titleofplot")

mod <- lm(y~x,data = DF)

mod

abline(mod, col = "green", lwd = 5)
####
library(tidyverse)

ggplot(DF, aes(x = x, y = y)) + 
  geom_point(color = "blue") +
  geom_smooth(method = "lm", col = "green", se = FALSE)+
  labs(title = "main",
       x = "K1",
       y = "K2")+
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5))

surveys <- read_csv("data_raw/portal_data_joined.csv")
str(surveys)

# the quick way to do %>% is ctrl + shift + M

surveys %>%
  filter(year < 1995) %>% 
  select(year, sex, weight)
##why do i get an error message when i run this code?
