
* Problem Set 7

clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 7/"
import delimited survey_analysis_AEJ.csv, clear

browse
describe 

**** 1a)

reg wage treated, robust 

replace wage = 0 if employed == 0
reg wage treated, robust

**** 1c)

reg wage extraversion, robust 

reg wage extraversion if extraversion>3, robust

**** 1e)

reg wage extraversion age, robust 





