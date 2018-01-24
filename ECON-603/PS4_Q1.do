*Written by RM on 2016.11.29 to create V set for Micro
*FOr ECON 603 PS 4 Question 1 graphing the V set

global out "/Users/russellmorton/Desktop/Coursework/Fall 2017/ECON 601-603/ECON 603"


clear

set obs 50000
g obs = [_n]
g v_1 = 10/50000 * (obs)

g v_2 = 4 + sqrt(26-v_1^2) if 5 <= v_1 & v_1 <= sqrt(26)
replace v_2 = sqrt(16 - (v_1 - sqrt(26))^2) if sqrt(26) <= v_1 & v_1 <= sqrt(26)+4
replace v_2 = 0 if v_1 >= sqrt(26)+4

g v_2_alt = 10/50000 * (obs)
g v_1_alt = 4 + sqrt(26-v_2_alt^2) if 5 <= v_2_alt & v_2_alt <= sqrt(26)
replace v_1_alt = sqrt(16 - (v_2_alt - sqrt(26))^2) if sqrt(26) <= v_2_alt & v_2_alt <= sqrt(26)+4
replace v_1_alt = 0 if v_2_alt >= sqrt(26)+4

twoway (scatter v_2 v_1, msize(vtiny)) (scatter v_2_alt v_1_alt, msize(vtiny)),  ///
	title("ECON 603 Question 1: V set") ///
	xtitle("Quantity of Good 1") ytitle("Quantity of Good 2") legend(off) 

graph export "$out/PS4 Q1 V Set Graph.pdf", as (pdf) replace
