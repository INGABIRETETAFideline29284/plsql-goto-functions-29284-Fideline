SET SERVEROUTPUT ON;

BEGIN

    DBMS_OUTPUT.PUT_LINE('===== PAYROLL VALIDATION =====');

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 1: ' || fn_validate_payroll(1)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 2: ' || fn_validate_payroll(2)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 3: ' || fn_validate_payroll(3)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 4: ' || fn_validate_payroll(4)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 5: ' || fn_validate_payroll(5)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Payroll ID 6: ' || fn_validate_payroll(6)
    );

END;
