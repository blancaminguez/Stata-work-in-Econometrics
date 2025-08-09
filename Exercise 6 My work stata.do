clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 6/"
import delimited social_media_mh.csv, clear

browse
describe 

**** 1a)

gen threeplusi = .
replace threeplusi = 1 if regexm(average_daily_time, "3 and 4 hours|4 and 5 hours|More than 5 hours")
replace threeplusi = 0 if regexm(average_daily_time, "1 and 2 hours|2 and 3 hours|Less than an Hour")

tabulate threeplusi

summarize feel_depressed if threeplusi == 1
summarize feel_depressed if threeplusi == 0


**** 1d)
regress feel_depressed threeplusi age c.threeplusi#c.age

**** 1e)
test threeplusi c.threeplusi#c.age

test c.threeplusi#c.age

lincom threeplusi + 20 * (c.threeplusi#c.age)


**** 1f)

regress sleep_issues threeplusi
regress sleep_issues threeplusi feel_depressed



