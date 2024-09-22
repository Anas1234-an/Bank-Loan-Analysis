select * from Bank_loan_data
select count(id) AS Total_Loan_Applications from Bank_loan_data

select count(id) AS MTD_Total_Loan_Applications from Bank_loan_data
where Month (issue_date)= 12 AND YEAR (issue_date) = 2021

select count(id) AS PMTD_Total_Loan_Applications from Bank_loan_data
where Month (issue_date)= 11 AND YEAR (issue_date) = 2021

select sum(loan_amount) AS Total_Funded_Amount From Bank_loan_data

select sum(loan_amount) AS MTD_Total_Funded_Amount From Bank_loan_data
where month(issue_date) = 12 AND Year (issue_date) = 2021

select sum(loan_amount) AS PMTD_Total_Funded_Amount From Bank_loan_data
where month(issue_date) = 11 AND Year (issue_date) = 2021

select sum(total_payment) AS Total_amount_received From Bank_loan_data
where month(issue_date) = 12 and Year (issue_date) = 2021

select AVG(int_rate) AS Avg_Interest_Rate from Bank_loan_data

select ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate from Bank_loan_data
where month(issue_date) = 12 and YEAR (issue_date) = 2021

select ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate from Bank_loan_data
where month(issue_date) = 11 and YEAR (issue_date) = 2021

select ROUND(AVG(dti),4) * 100 AS Avg_DTI from Bank_loan_data

select ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI from Bank_loan_data
where month(issue_date) = 12 AND YEAR(issue_date) = 2021

select loan_status from Bank_loan_data

select
	(count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	count(id) AS Good_loan_percentage
	from Bank_loan_data

select count(id) AS Good_loan_Applications from Bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'current'

select SUM(loan_amount) AS Good_loan_Funded_Amount from Bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'current'

select
(count(case when loan_status = 'Charged Off' then id END) * 100.0)/
count(id) AS Bad_loan_percentage
from Bank_loan_data

select count(id) AS Bad_loan_application from Bank_loan_data
where loan_status = 'charged off'

select SUM(loan_amount) AS Bad_loan_Funded_amount from Bank_loan_data
where loan_status = 'charged off'

select SUM(total_payment) AS Bad_loan_Funded_amount from Bank_loan_data
where loan_status = 'charged off'

select 
loan_status,
count(id) AS Total_loan_applications,
sum(total_payment) AS Total_amount_received,
sum(loan_amount) AS Total_funded_amount,
AVG(int_rate * 100) AS Interest_rate,
Avg(dti*100) AS DTI
From Bank_loan_data
group by loan_status

select
	month(issue_date) AS Month_Number,
	Datename(month, issue_date) AS Month_Name,
	count(id) AS Total_loan_applications,
	sum(loan_amount) as Total_funded_amount,
	sum(total_payment) AS Total_received_amount
	From Bank_loan_data
group by month(issue_date),Datename(month, issue_date)
order by month(issue_date)

select
term,
count(id) AS Total_loan_applications,
sum(loan_amount) AS Total_funded_amount,
sum(total_payment) AS Total_recieved_amount
From Bank_loan_data
group by term
order by term

select
home_ownership,
count(id) AS Total_loan_applications,
sum(loan_amount) AS Total_funded_amount,
sum(total_payment) AS Total_recieved_amount
From Bank_loan_data
group by home_ownership 
order by home_ownership