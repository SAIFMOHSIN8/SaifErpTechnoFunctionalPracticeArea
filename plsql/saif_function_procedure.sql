CREATE OR REPLACE FUNCTION saif_fn_test
RETURN VARCHAR2
IS
BEGIN
RETURN 'Test successful';
END;
/

SHOW ERRORS FUNCTION saif_fn_test;

SELECT saif_fn_test AS function_result
FROM dual;


CREATE OR REPLACE PROCEDURE saif_pr_ebs (
    errbuf  OUT VARCHAR2,
    retcode OUT NUMBER
)
IS
BEGIN
    fnd_file.put_line(
        fnd_file.output,
        'WELCOME TO ORACLE EBS PROCEDURE'
    );

    retcode := 0;
    errbuf  := NULL;
END;
/

SHOW ERRORS PROCEDURE saif_pr_ebs;


SELECT object_name,
       object_type,
       status
FROM user_objects
WHERE object_name IN ('SAIF_FN_TEST', 'SAIF_PR_EBS')
ORDER BY object_type;