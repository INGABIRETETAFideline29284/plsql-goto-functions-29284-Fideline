SET SERVEROUTPUT ON;

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    e.monthly_salary,
    fn_annual_salary(e.employee_id) AS annual_salary,
    fn_years_of_service(e.employee_id) AS years_of_service,
    fn_dept_name(e.department_id) AS department_name,
    fn_calculate_tax(e.monthly_salary) AS calculated_tax
FROM employees e
ORDER BY e.employee_id;
