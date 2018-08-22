setwd(~/"Desktop/University/Subjects/Lab 2/Week 3")
#setwd = set work directory, then theres the directory (go to session, set wd, choose directory, select folder)
library(tidyverse)
lubrary(lubridate)

(df1 <- read_csv("Crop_example1 to import.csv")) 


df2 <- df1 %>%
  gather("Date", "Value", c(-crop,-type))

df3 <- df2 %>%
  separate(Date, c("Month", "Year"))%>%
  mutate(Year2=paste("20", Year, sep="")) %>%
  mutate (Day=1) %>%
  mutate(Date=paste (Year, Month, Day, sep="")) %>%
  select(-Month, -Year, -Day, -Year2) %>%
  mutate(Date = ymd(Date))


df4 <- df3 %>%
  separate(Date, c("Month", "Year")) %>%
      mutate(Year2=paste("20", Year, sep="")), %>%
      mutate (Day=1) %>%
      mutate(Date=paste (Year, Month, Day, sep="")) %>%
#     select(-Month, -Year, -Day, -Year2) %>%
      mutate(Date = ymd(Date))

ggplot(df3, aes(Date, Value, group=Type, colour=type)) +
  geom_line()
  facet_grid(~Crop)

