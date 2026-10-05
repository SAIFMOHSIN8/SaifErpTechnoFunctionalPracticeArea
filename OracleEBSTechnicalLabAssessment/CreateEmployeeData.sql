-- Create the employee table

CREATE TABLE XX_SAIF_EMPLOYEE
(
    EMPLOYEE_ID      NUMBER PRIMARY KEY,
    EMPLOYEE_NAME    VARCHAR2(100) NOT NULL,
    DEPARTMENT_ID    NUMBER NOT NULL,
    DEPARTMENT_NAME  VARCHAR2(100) NOT NULL,
    JOB_TITLE        VARCHAR2(100),
    SALARY           NUMBER(10,2),
    HIRE_DATE        DATE
);

-- Insert sample employee data

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (101, 'Ahmed Ali', 10, 'Finance', 'Accountant', 850, DATE '2024-01-15');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (102, 'Sara Khan', 10, 'Finance', 'Financial Analyst', 950, DATE '2023-09-01');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (103, 'Omar Khalid', 10, 'Finance', 'Finance Officer', 780, DATE '2022-06-12');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (104, 'Mohammed Said', 20, 'Human Resources', 'HR Officer', 800, DATE '2024-03-10');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (105, 'Fatma Hassan', 20, 'Human Resources', 'HR Specialist', 900, DATE '2022-11-20');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (106, 'Mariam Salim', 20, 'Human Resources', 'Recruitment Officer', 820, DATE '2023-07-14');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (107, 'Ali Rashid', 30, 'Sales', 'Sales Executive', 1000, DATE '2023-05-05');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (108, 'Aisha Salim', 30, 'Sales', 'Sales Coordinator', 850, DATE '2024-02-12');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (109, 'Yusuf Nasser', 30, 'Sales', 'Sales Manager', 1350, DATE '2021-10-18');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (110, 'Noura Hamad', 40, 'Information Technology', 'System Administrator', 1100, DATE '2022-04-25');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (111, 'Khalid Mansoor', 40, 'Information Technology', 'Software Developer', 1200, DATE '2023-01-09');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (112, 'Layla Ahmed', 40, 'Information Technology', 'Support Engineer', 950, DATE '2024-05-01');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (113, 'Hassan Juma', 50, 'Procurement', 'Procurement Officer', 880, DATE '2023-08-21');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (114, 'Reem Abdullah', 50, 'Procurement', 'Buyer', 920, DATE '2022-12-11');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (115, 'Salim Hamood', 60, 'Operations', 'Operations Officer', 900, DATE '2024-01-30');

INSERT INTO XX_SAIF_EMPLOYEE
VALUES (116, 'Amal Rashid', 60, 'Operations', 'Operations Supervisor', 1150, DATE '2021-09-17');

COMMIT;

-- Check department totals

SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    COUNT(*) AS EMPLOYEE_COUNT,
    SUM(SALARY) AS TOTAL_SALARY,
    AVG(SALARY) AS AVERAGE_SALARY
FROM XX_SAIF_EMPLOYEE
GROUP BY DEPARTMENT_ID, DEPARTMENT_NAME
ORDER BY DEPARTMENT_ID;

