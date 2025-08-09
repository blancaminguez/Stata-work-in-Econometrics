


clear all 
cd "/Users/blancaminguezlumsden/Desktop/EC2C3/Problem Sets-20241012/Problem Set 8/"
import delimited sanitation_invest.csv, clear

browse
describe 
import delimited social_media_mh.csv, clear

browse
describe 

**** 2(a)

reg delta_inf_mort sanitation_spend_1887_1903 pop_1886_25000 pop_1886_50000 pop_1886_100000 pop_1886_100000_plus popgrowth1881to1891 popgrowth1891to1901, robust

**** 2(b)

ivregress 2sls delta_inf_mort (sanitation_spend_1887_1903 = delta_interest_rate_1887_1903) pop_1886_25000_50000 pop_1886_50000_100000 pop_1886_100000_plus popgrowth1881to1891 popgrowth1891to1901, robust

**** 2(c)

ivregress 2sls delta_inf_mort (sanitation_spend_1887_1903 = delta_interest_rate_1887_1903) pop_1886_25000_50000 pop_1886_50000_100000 pop_1886_100000_plus popgrowth1881to1891 popgrowth1891to1901 loan_stock_1886, robust

**** 2(e)

reg sanitation_spend_1887_1903 took_loan_pwlb_1882_1886
reg delta_inf_mort took_loan_pwlb_1882_1886

ivregress 2sls delta_inf_mort (sanitation_spend_1887_1903 = took_loan_pwlb_1882_1886)



