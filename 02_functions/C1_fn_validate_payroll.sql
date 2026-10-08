CREATE OR REPLACE FUNCTION fn_validate_payroll (
    p_payroll_id IN payroll.payroll_id%TYPE
)
RETURN VARCHAR2
IS
    v_employee_id     payroll.employee_id%TYPE;
    v_basic_salary    payroll.basic_salary%TYPE;
    v_tax_amount      payroll.tax_amount%TYPE;
    v_net_salary      payroll.net_salary%TYPE;

    v_employee_salary employees.monthly_salary%TYPE;
    v_expected_tax    NUMBER;
    v_expected_net    NUMBER;
BEGIN

    SELECT employee_id,
           basic_salary,
           tax_amount,
           net_salary
    INTO   v_employee_id,
           v_basic_salary,
           v_tax_amount,
           v_net_salary
    FROM payroll
    WHERE payroll_id = p_payroll_id;

    SELECT monthly_salary
    INTO   v_employee_salary
    FROM employees
    WHERE employee_id = v_employee_id;

    IF v_basic_salary <> v_employee_salary THEN
        RETURN 'INVALID - Basic salary is incorrect';
    END IF;

    v_expected_tax := fn_calculate_tax(v_basic_salary);

    IF v_tax_amount <> v_expected_tax THEN
        RETURN 'INVALID - Tax amount is incorrect';
    END IF;

    v_expected_net := v_basic_salary - v_expected_tax;

    IF v_net_salary <> v_expected_net THEN
        RETURN 'INVALID - Net salary is incorrect';
    END IF;

    RETURN 'VALID - Payroll record is correct';


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        RETURN 'INVALID - Payroll record not found';

    WHEN OTHERS THEN
        RETURN 'ERROR - ' || SQLERRM;

END;
