SET SERVEROUTPUT ON;

DECLARE
v_input     NUMBER;
    v_factorial NUMBER := 1;

    e_invalid_input EXCEPTION;

BEGIN
    v_input := TO_NUMBER('&input_number');

    IF v_input <= 1 OR v_input != TRUNC(v_input) THEN
        RAISE e_invalid_input;
END IF;

FOR i IN 2..TRUNC(v_input) LOOP
        v_factorial := v_factorial * i;
END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        v_input || '! = ' || v_factorial
    );

EXCEPTION
    WHEN e_invalid_input THEN
        DBMS_OUTPUT.PUT_LINE(
            'ERROR: ENTER A WHOLE NUMBER GREATER THAN 1'
        );

WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE(
            'ERROR: INPUT MUST BE A NUMBER'
        );
END;
/