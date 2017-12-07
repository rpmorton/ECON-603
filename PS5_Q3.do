*Written by RM on 2016.12.06 to graph price adj fct for Micro
*FOr ECON 603 PS 5 Question 3 

global out "/Users/russellmorton/Desktop/Coursework/Fall 2017/ECON 601-603/ECON 603"


clear

set obs 10000


g obs = [_n]

g pi = obs / 10000
drop if pi == 1
drop if pi == 0

g adj = 10/pi - 20
g adj_alt = 10/(1-pi)-20

g f_1 = (pi + max(adj,0)) / (1 + max(adj,0)  + max(adj_alt,0)   ) 

g fixed_point = pi 

la var f_1 "Post-Adjustment Price"
la var fixed_point "Fixed Point Price"

twoway (scatter f_1 pi, msize(tiny)) (scatter fixed_point pi, msize(vtiny)),   ///
	title("ECON 603 Question 3: Price Adjustment Function") ///
	xtitle("Price of Good 1") ytitle("Adjusted Price of Good 1") ///
	legend( cols (2) keygap(1) ) ///
	

	
graph export "$out/PS5 Q3 Price Adj Fct Graph.pdf", as (pdf) replace
