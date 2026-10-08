SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== B1: ANNUAL SALARY =====');

    DBMS_OUTPUT.PUT_LINE(
        'Employee 101 Annual Salary = ' ||
        TO_CHAR(fn_annual_salary(101), '999,999,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Employee 102 Annual Salary = ' ||
        TO_CHAR(fn_annual_salary(102), '999,999,999')
    );
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== B2: YEARS OF SERVICE =====');

    DBMS_OUTPUT.PUT_LINE(
        'Employee 101 Years of Service = ' ||
        fn_years_of_service(101)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Employee 106 Years of Service = ' ||
        fn_years_of_service(106)
    );
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== B3: TAX CALCULATOR =====');

    DBMS_OUTPUT.PUT_LINE(
        'Tax on 450000 = ' ||
        TO_CHAR(fn_calculate_tax(450000), '999,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Tax on 650000 = ' ||
        TO_CHAR(fn_calculate_tax(650000), '999,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Tax on 1200000 = ' ||
        TO_CHAR(fn_calculate_tax(1200000), '999,999')
    );
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== B4: DEPARTMENT NAME =====');

    DBMS_OUTPUT.PUT_LINE(
        'Department 10 = ' ||
        fn_dept_name(10)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Department 20 = ' ||
        fn_dept_name(20)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Department 30 = ' ||
        fn_dept_name(30)
    );
END;
