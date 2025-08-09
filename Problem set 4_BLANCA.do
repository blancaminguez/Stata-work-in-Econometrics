
clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 4/"
import delimited maths_scores.csv, clear

browse
describe 

gen internet_binary = (internet == "yes")

* 1a

reg final_grade internet_binary, robust

*1c

gen mother_sec_or_higher = (medu_secondary == 1 | medu_higher == 1)

reg final_grade internet_binary mother_sec_or_higher, robust

reg mother_sec_or_higher internet_binary, robust

*1d

reg final_grade internet_binary, robust
predict residuals1, residuals

reg final_grade internet_binary mother_sec_or_higher, robust
predict residuals2, residuals

sum residuals1
sum residuals2

*1e 

summarize final_grade

gen standardized_final_grade = ((final_grade - r(mean)) / r(sd))

regress standardized_final_grade mother_sec_or_higher

regress standardized_final_grade mother_sec_or_higher, robust


