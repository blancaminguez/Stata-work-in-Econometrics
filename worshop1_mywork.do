

clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Workshop 1-20241012"
import delimited using class_1.csv, clear

browse
describe 
list
*only list certain variables
list job_title salary_in_usd company_location in 

list job_title salary_in_usd company_location in 1/10

list job_title salary_in_usd company_location if company_location == "uk" 

*and 
list job_title salary_in_usd company_location if company_location == "uk" & salary_in_usd < 50000 

*or
list job_title salary_in_usd company_location if company_location == "uk" | salary_in_usd < 50000  

*not
list job_title salary_in_usd company_location if company_location != "usa" 


* red is a word
* black is a number in data editor (browse)

/*
big notes 
*/

summarize salary_in_usd remote_ratio, d 
* ,d shows us details 

tabulate experience_level if not_usa == 1
*

tab experience_level not_usa 
* ,row  shows percentages that add to 100

tab experience_level not_usa, row



* Generating variables

gen usa = 1 - not_usa
gen lnsalary_usd = ln(salary_usd)
gen salary_usd_squared = salary_usd^2
gen exp_usd_squared = exp(salary_usd/1000)


*** replace***

replace salary = salary/1000

** generating binary variables** will give 1 if true and 0 if false 
gen high_salary = salary_in_usd >= 200000
replace high_salary = . if salary_in_usd ==.

** alternative**
gen high_salary_one = salary_in_usd >= 200000 if salary != . 


** we observe correlations with corr command** and ,cov for covariance
corr salary_in_usd remote_ratio not_usa
corr salary_in_usd remote_ratio not_usa, cov


save salary_edited, replace 
use salary_edited, clear 

*excel format save
outsheet using salary_edited.csv, comma replace
