-- Create employee salary summary procedure

CREATE OR REPLACE PROCEDURE XX_SAIF_EMP_SALARY_SUMMARY
(
    ERRBUF          OUT VARCHAR2,
    RETCODE         OUT NUMBER,
    P_DEPARTMENT_ID IN  NUMBER
)
IS

    -- Variables for summary values
    V_EMP_COUNT     NUMBER := 0;
    V_TOTAL_SALARY  NUMBER := 0;
    V_AVG_SALARY    NUMBER := 0;

BEGIN

    -- Report heading
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'EMPLOYEE SALARY SUMMARY');
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'Department ID: ' || P_DEPARTMENT_ID);
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, '------------------------------------------------------------');

    -- Display employees from selected department
FOR REC IN
    (
        SELECT
            EMPLOYEE_ID,
            EMPLOYEE_NAME,
            DEPARTMENT_NAME,
            JOB_TITLE,
            SALARY
        FROM XX_SAIF_EMPLOYEE
        WHERE DEPARTMENT_ID = P_DEPARTMENT_ID
        ORDER BY EMPLOYEE_ID
    )
    LOOP

        FND_FILE.PUT_LINE(
            FND_FILE.OUTPUT,
            REC.EMPLOYEE_ID || ' | ' ||
            REC.EMPLOYEE_NAME || ' | ' ||
            REC.DEPARTMENT_NAME || ' | ' ||
            REC.JOB_TITLE || ' | ' ||
            REC.SALARY
        );

END LOOP;


    -- Calculate department summary
SELECT
    COUNT(*),
    NVL(SUM(SALARY), 0),
    NVL(AVG(SALARY), 0)
INTO
    V_EMP_COUNT,
    V_TOTAL_SALARY,
    V_AVG_SALARY
FROM XX_SAIF_EMPLOYEE
WHERE DEPARTMENT_ID = P_DEPARTMENT_ID;


-- Display summary
FND_FILE.PUT_LINE(FND_FILE.OUTPUT, '------------------------------------------------------------');
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'Number of Employees : ' || V_EMP_COUNT);
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'Total Salary        : ' || V_TOTAL_SALARY);
    FND_FILE.PUT_LINE(FND_FILE.OUTPUT, 'Average Salary      : ' || ROUND(V_AVG_SALARY, 2));


    -- Successful completion
    RETCODE := 0;


EXCEPTION

    WHEN OTHERS THEN

        RETCODE := 2;
        ERRBUF := SQLERRM;

        FND_FILE.PUT_LINE(
            FND_FILE.LOG,
            'Error: ' || SQLERRM
        );

END XX_SAIF_EMP_SALARY_SUMMARY;
/

