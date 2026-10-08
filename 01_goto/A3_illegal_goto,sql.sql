SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER := 30;
BEGIN

    IF v_number > 0 THEN
        GOTO positive;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Number is zero or negative.');
    GOTO finish;

    <<positive>>
    DBMS_OUTPUT.PUT_LINE('Number is positive.');

    <<finish>>
    DBMS_OUTPUT.PUT_LINE('Program completed.');

END;
