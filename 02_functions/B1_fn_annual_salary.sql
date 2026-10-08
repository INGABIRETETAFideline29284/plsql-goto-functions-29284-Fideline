CREATE OR REPLACE FUNCTION fn_annual_salary (
    p_employee_id IN employees.employee_id%TYPE
)
RETURN NUMBER
IS
    v_monthly_salary employees.monthly_salary%TYPE;
    v_annual_salary NUMBER;
BEGIN

    SELECT monthly_salary
    INTO v_monthly_salary
    FROM employees
    WHERE employee_id = p_employee_id;

    v_annual_salary := v_monthly_salary * 12;

    RETURN v_annual_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;

    WHEN OTHERS THEN
        RAISE;
END;

