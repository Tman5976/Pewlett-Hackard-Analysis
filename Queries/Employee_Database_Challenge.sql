-- #1.
Select emp_no, first_name, last_name from employees;

-- #2.
Select title, from_date, to_date from titles;

-- #3-6.
Select e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
Into Retirement_title
From employees as e
Inner join titles as t
On e.emp_no = t.emp_no
Where (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
Order by emp_no ASC;

Select * from retirement_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC;

Select * from unique_titles;

-- #15-18.
Select Count(emp_no), title
into retiring_titles
From unique_titles
Group by title
Order by title DESC;

select * From retiring_titles;

-- Deliverable 2
Select Distinct On (emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
Into mentorship
From employees as e
Inner join dept_emp as de
On e.emp_no = de.emp_no
Inner join titles as t
On e.emp_no = t.emp_no
Where (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
Order by emp_no ASC;

Select * From mentorship;