

clear all
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 5/"
import delimited using house_data.csv

browse
describe

* variables to use price, sqft_living (the area of the living space in square feet), yr_built (year built), and waterfront (a binary variable that takes the value 1 if the house overlooks the waterfront)

**** 1(a)

reg price sqft_living, robust

reg price sqft_living yr_built, robust


**** 1(d)

reg sqft_living yr_built, robust

**** 1(e)

reg price yr_built, robust
drop price_residuals 
predict price_residuals, resid

reg sqft_living yr_built, robust
drop sqft_residuals 
predict sqft_residuals, resid

reg price_residuals sqft_residuals, robust

reg price sqft_residuals, robust


**** 1 (f)

reg price sqft_living yr_built waterfront, robust
test waterfront = 0
test waterfront = 3000 * sqft_living
test (waterfront = 3000 * sqft_living) (yr_built = -7.5 * sqft_living)
