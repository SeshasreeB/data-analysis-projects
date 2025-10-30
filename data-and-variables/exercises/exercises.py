# 1. Declare and assign the variables here:
name_spaceShuttle = "Determination"
shuttle_Speed_mph = 17500
distance_Mars_km = 225000000
distance_Moon_km = 384400
Miles_per_KM = 0.621

# 2. Use print() to print the 'type' each variable. Print one item per line.
print(type(name_spaceShuttle))
print(type(shuttle_Speed_mph))
print(type(distance_Mars_km))
print(type(distance_Moon_km))
print(type(Miles_per_KM))

# Code your solution to exercises 3 and 4 here:
miles_to_mars = distance_Mars_km * Miles_per_KM
hours_to_mars = miles_to_mars / shuttle_Speed_mph
days_to_mars = hours_to_mars / 24
days_to_mars = str(days_to_mars)
print(name_spaceShuttle + " will take " + days_to_mars + " days to reach Mars. ")
# Code your solution to exercise 5 here
miles_to_moon = distance_Moon_km * Miles_per_KM
hours_to_moon = miles_to_moon / shuttle_Speed_mph
days_to_moon = hours_to_moon /24
days_to_moon = str(days_to_moon)
print(name_spaceShuttle + " will take " + days_to_moon + " days to reach the Moon. ")