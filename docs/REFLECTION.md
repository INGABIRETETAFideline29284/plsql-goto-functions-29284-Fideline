Introduction

This assignment helped me understand how to use control structures, GOTO statements, functions, and SQL queries. I also learned how different components can be combined to solve practical payroll-related problems.

1.	What I Learned

I learned how to use the GOTO statement to move execution to a labelled section of a block. I also learned that GOTO should be used carefully because excessive use can make a program difficult to read and maintain.
I learned how to rewrite a program without GOTO by using IF, ELSIF, and ELSE statements. This made the program more structured and easier to understand.
I also learned how to create functions using CREATE OR REPLACE FUNCTION. The functions created in this assignment were used to calculate annual salary, years of service, tax, department names, and payroll validation results.
Another important lesson was learning how functions can be called directly inside a SELECT statement. This allowed me to display calculated information together with employee records.

2.	Challenges Faced

One challenge was understanding the correct use of labels and GOTO statements. I had to ensure that the labels were placed correctly within the block.
Another challenge was making sure that the functions returned the correct data types and handled situations where an employee or payroll record did not exist.

3.	How I Solved the Challenges

I solved these problems by checking the syntax carefully and testing each program separately. I also used exception handling such as NO_DATA_FOUND to handle missing records.
For the payroll validation function, I compared the recorded salary, tax, and net salary with the values calculated from the employee's salary and the tax function.

4.	Importance of the Assignment

This assignment showed me how PL/SQL can be used to automate business processes. For example, the payroll validation function can help a company check whether payroll records contain correct salary, tax, and net salary information. It also improved my understanding of reusable functions. Instead of writing the same calculation repeatedly, a function can be created once and called whenever it is needed.

5.	Conclusion

Overall, I learned how to use GOTO, conditional statements, functions, exception handling, and SQL queries together.
The most important lesson I learned is that PL/SQL allows database operations and programming logic to work together. I also learned that clear and structured code is easier to test, understand, and maintain.


