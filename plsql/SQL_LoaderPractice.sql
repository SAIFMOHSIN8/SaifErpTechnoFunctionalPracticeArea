-- Creating the table --

CREATE TABLE SAIF_TEST
(
    ID      NUMBER,
    NAME    VARCHAR2(50),
    COURSE  VARCHAR2(50)
);

-- CREATE SAIF_DATA.dat --

Data-file contents:

    1,'SAIF','ERP'
    2,'ALHARITH','JAVA'
    3,'ALJOLANDA','PYTHON'
    4,'ABDULLAH','CYBER SECURITY'
    5,'ABDULMAJEED','PLSQL'
    6,'IBRAHIM','OCI'
    7,'RAPHINHA','FULLSTACK'

-- CREATE SAIF_CONTROL.ctl --

Control-file contents:

    LOAD DATA
    INFILE '/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US/SAIF_DATA.dat'
    INTO TABLE SAIF_TEST
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY "'"
    (ID, NAME, COURSE)

-- CONNECT TO THE LINUX SERVER USING PUTTY --

Load the Oracle EBS run environment:
    source /u01/install/VISION/EBSapps.env run
    Confirm that SQL*Loader is available:
    which sqlldr

-- RUN SQL*LOADER FROM PUTTY --

sqlldr userid=apps@ebsdb control=/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US/SAIF_CONTROL.ctl

-- VERIFY THE LOADED DATA --

SELECT *
FROM SAIF_TEST
ORDER BY ID;

----------------------------------------
