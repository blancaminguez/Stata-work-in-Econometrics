
clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 3/"
import delimited using Hotel_Reservations.csv

browse
describe 


* to use: lead_time, avg_price_per_room, booking_status, repeated_guest

***** Q1

* (a)

gen binary_status = 0
replace binary_status = 1 if booking_status == "Canceled"

ttest avg_price_per_room, by(binary_status)
ttest binary_status, by(repeated_guest)

* the ttest values are so big for both ttest, that they failt o reject the null hypothesis. -27.4332 and 20.5519



* (b)

summarize lead_time, d

gen long_lead_time = 0
replace long_lead_time = 1 if lead_time > r(p50)
ttes



* (c)
gen adjusted_avg_price = avg_price_per_room
replace adjusted_avg_price = avg_price_per_room + 3 if long_lead_time == 1
ttest adjusted_avg_price, by(long_lead_time)



* (d)

reg avg_price_per_room lead_time

** 𝛽0 is the intercept, and therefor the average price per room when lead time is zero. This coeff is 105.6, so this is the average price per room with zero lead days. 

** 𝛽1 is the average change in price per room as lead time increases by 1. This coeff is negative, so additional days of lead time decrease the average cost per room. 
* 𝛽1 seems small, as the avg price is changing very little per additional day of lead time. 



* (e) 
reg avg_price_per_room lead_time
predict residuals, residuals
reg residuals lead_time 

* The estimated slope coefficient is -5.68e-11. This is quite close to zero. The p value is very large (1000), suggsting that the residuals are not a result of lead time (as in not affected by). 



* (f)
sum avg_price_per_room lead_time

gen standardi_avg_price = avg_price_per_room / r(sd)
gen standardi_lead_time = lead_time / r(sd)

reg standardi_avg_price standardi_lead_time

* We have standardised these variables. For every increse in the slope by the sd (so the number of lead days), teh avg price of the room decreases by  -.025561. So booking in advance is better. 


