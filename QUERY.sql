Use database mock_up_data;
/*In order to complete this project, you should be familiar with queries, aggregate functions, and multiple table joins. Ideally, you’ve completed Analze Data with SQL.*/
SELECT *FROM users;
SELECT *FROM progress;

/*First, use SELECT * from both tables and use your knowledge of queries and aggregate functions to get to know the data:
What are the Top 25 schools (.edu domains)?
How many .edu learners are located in New York?
The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?*/
SELECT email_domain,COUNT(*)
FROM users
WHERE email_domain like "%.edu"
Group BY email_domain
ORDER BY COUNT(*)DESC
LIMIT 25;

SELECT City,COUNT(*)
From users
WHERE email_domain like "%.edu" AND city ="New York";

SELECT mobile_app,COUNT(*)
FROM users
WHERE mobile_app = "mobile-user";


/*The data type of the sign_up_at column is DATETIME. It is for storing a date/time value in the database.

Notice that the values are formatted like:

2015-01-01 18:33:52

So the format is:

YYYY-MM-DD HH:MM:SS

SQLite comes with a strftime() function - a very powerful function that allows you to return a formatted date.

It takes two arguments:

strftime(format, column)*/
SELECT sign_up_at,strftime("%H", sign_up_at),Count(*)
FROM users
GROUP BY 2
GROUP BY 2;
/*Join the two tables using JOIN and then see what you can dig out of the data!

Do different schools (.edu domains) prefer different courses?
What courses are the New Yorkers students taking?
What courses are the Chicago students taking?*/

SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_javascript,p.learn_java
FROM users u
LEFT JOIN progress p
ON u.user_id = p.user_id
GROUP BY 1
ORDER BY 1 ASC;

SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_html,p.learn_javascript,p.learn_java
FROM users u
LEFT JOIN Progress p
ON u.user_id = p.user_id
WHERE u.city = "New York"
GROUP BY 1
GROUP BY 1 ASC;

SELECT u.email_domain,p.learn_cpp,p.learn_sql,p.learn_html,p.learn_javascript,p.learn_java
FROM users u
LEFT JOIN PROGRESS P
ON u.user_id = p.user_id
WHERE u.city ="Chicago"
GROUP BY 1
GROUP BY 1 ASC;















