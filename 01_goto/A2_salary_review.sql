SET SERVEROUTPUT ON;

DECLARE
    v_employee_id employees.employee_id%TYPE := 104;
    v_name VARCHAR2(100);
    v_salary employees.monthly_salary%TYPE;
BEGIN

    SELECT first_name || ' ' || last_name,
           monthly_salary
    INTO v_name,
         v_salary
    FROM employees
    WHERE employee_id = v_employee_id;

    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: ' || TO_CHAR(v_salary, '999,999,999'));

    IF v_salary < 500000 THEN
        GOTO low_salary;

    ELSIF v_salary < 1000000 THEN
        GOTO standard_salary;

    ELSE
        GOTO high_salary;
    END IF;

    <<low_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Review: LOW SALARY');
    DBMS_OUTPUT.PUT_LINE('Action: Salary should be reviewed.');
    GOTO finish;

    <<standard_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Review: STANDARD SALARY');
    DBMS_OUTPUT.PUT_LINE('Action: Salary is within the standard range.');
    GOTO finish;

    <<high_salary>>
    DBMS_OUTPUT.PUT_LINE('Salary Review: HIGH SALARY');
    DBMS_OUTPUT.PUT_LINE('Action: Salary is above the standard range.');

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Salary review completed.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Employee ID ' || v_employee_id || ' was not found.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
