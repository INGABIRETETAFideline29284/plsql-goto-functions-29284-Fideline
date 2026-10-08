CREATE OR REPLACE FUNCTION fn_calculate_tax (
    p_salary IN NUMBER
)
RETURN NUMBER
IS
    v_tax NUMBER;
BEGIN

    IF p_salary < 0 THEN

        RAISE_APPLICATION_ERROR(
            -20001,
            'Salary cannot be negative.'
        );

    ELSIF p_salary < 500000 THEN

        v_tax := p_salary * 0.05;

    ELSIF p_salary < 1000000 THEN

        v_tax := p_salary * 0.10;

    ELSE

        v_tax := p_salary * 0.15;

    END IF;

    RETURN v_tax;

END;


