fares <- read.csv("fares.csv")
fares$revenue_per_customer <- fares$revenue / fares$num_people
summary(fares$revenue)

library(dplyr)

flights <- read.csv("PRIMARY_flight_traffic.csv")
x <- flights %>% group_by(quarter, airline_id, origin_airport, destination_airport) %>% dplyr::count()

fares <- left_join(fares, x, by = c("quarter", "airline_id", "origin_airport", "destination_airport")) %>% rename(num_flights = n)


flights$X <- NULL
flights$wheels_off <- NULL
flights$wheels_on <- NULL

