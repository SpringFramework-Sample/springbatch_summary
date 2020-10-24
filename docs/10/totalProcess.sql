SELECT JOB_INSTANCE_ID, JOB_NAME from BATCH_JOB_INSTANCE where JOB_NAME = ? and JOB_KEY = ?
SELECT JOB_INSTANCE_ID, JOB_NAME from BATCH_JOB_INSTANCE I1 where I1.JOB_NAME = ? and I1.JOB_INSTANCE_ID in (SELECT max(I2.JOB_INSTANCE_ID) from BATCH_JOB_INSTANCE I2 where I2.JOB_NAME = ?)
SELECT JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, CREATE_TIME, LAST_UPDATED, VERSION, JOB_CONFIGURATION_LOCATION from BATCH_JOB_EXECUTION E where JOB_INSTANCE_ID = ? and JOB_EXECUTION_ID in (SELECT max(JOB_EXECUTION_ID) from BATCH_JOB_EXECUTION E2 where E2.JOB_INSTANCE_ID = ?)
SELECT JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING from BATCH_JOB_EXECUTION_PARAMS where JOB_EXECUTION_ID = ?

SELECT JOB_INSTANCE_ID, JOB_NAME from BATCH_JOB_INSTANCE where JOB_NAME = ? and JOB_KEY = ?
SELECT JOB_INSTANCE_ID, JOB_NAME from BATCH_JOB_INSTANCE where JOB_NAME = ? and JOB_KEY = ?
SELECT JOB_INSTANCE_ID, JOB_NAME from BATCH_JOB_INSTANCE where JOB_NAME = ? and JOB_KEY = ?

INSERT into BATCH_JOB_INSTANCE(JOB_INSTANCE_ID, JOB_NAME, JOB_KEY, VERSION) values (?, ?, ?, ?)
INSERT into BATCH_JOB_EXECUTION(JOB_EXECUTION_ID, JOB_INSTANCE_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, VERSION, CREATE_TIME, LAST_UPDATED, JOB_CONFIGURATION_LOCATION) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
INSERT into BATCH_JOB_EXECUTION_PARAMS(JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING) values (?, ?, ?, ?, ?, ?, ?, ?)
INSERT into BATCH_JOB_EXECUTION_PARAMS(JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING) values (?, ?, ?, ?, ?, ?, ?, ?)
INSERT INTO BATCH_JOB_EXECUTION_CONTEXT (SHORT_CONTEXT, SERIALIZED_CONTEXT, JOB_EXECUTION_ID) VALUES(?, ?, ?)

SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?
SELECT COUNT(*) FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID = ?

UPDATE BATCH_JOB_EXECUTION set START_TIME = ?, END_TIME = ?,  STATUS = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, CREATE_TIME = ?, LAST_UPDATED = ? where JOB_EXECUTION_ID = ? and VERSION = ?

SELECT  SE.STEP_EXECUTION_ID, SE.STEP_NAME, SE.START_TIME, SE.END_TIME, SE.STATUS, SE.COMMIT_COUNT, SE.READ_COUNT, SE.FILTER_COUNT, SE.WRITE_COUNT, SE.EXIT_CODE, SE.EXIT_MESSAGE, SE.READ_SKIP_COUNT, SE.WRITE_SKIP_COUNT, SE.PROCESS_SKIP_COUNT, SE.ROLLBACK_COUNT, SE.LAST_UPDATED, SE.VERSION, JE.JOB_EXECUTION_ID, JE.START_TIME, JE.END_TIME, JE.STATUS, JE.EXIT_CODE, JE.EXIT_MESSAGE, JE.CREATE_TIME, JE.LAST_UPDATED, JE.VERSION from BATCH_JOB_EXECUTION JE, BATCH_STEP_EXECUTION SE where       SE.JOB_EXECUTION_ID in (SELECT JOB_EXECUTION_ID from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ?)      and SE.JOB_EXECUTION_ID = JE.JOB_EXECUTION_ID       and SE.STEP_NAME = ? order by SE.START_TIME desc, SE.STEP_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, CREATE_TIME, LAST_UPDATED, VERSION, JOB_CONFIGURATION_LOCATION from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ? order by JOB_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING from BATCH_JOB_EXECUTION_PARAMS where JOB_EXECUTION_ID = ?
SELECT STEP_EXECUTION_ID, STEP_NAME, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED, VERSION from BATCH_STEP_EXECUTION where JOB_EXECUTION_ID = ? order by STEP_EXECUTION_ID

INSERT into BATCH_STEP_EXECUTION(STEP_EXECUTION_ID, VERSION, STEP_NAME, JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
INSERT INTO BATCH_STEP_EXECUTION_CONTEXT (SHORT_CONTEXT, SERIALIZED_CONTEXT, STEP_EXECUTION_ID) VALUES(?, ?, ?)
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?

SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_JOB_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE JOB_EXECUTION_ID = ?

SELECT  SE.STEP_EXECUTION_ID, SE.STEP_NAME, SE.START_TIME, SE.END_TIME, SE.STATUS, SE.COMMIT_COUNT, SE.READ_COUNT, SE.FILTER_COUNT, SE.WRITE_COUNT, SE.EXIT_CODE, SE.EXIT_MESSAGE, SE.READ_SKIP_COUNT, SE.WRITE_SKIP_COUNT, SE.PROCESS_SKIP_COUNT, SE.ROLLBACK_COUNT, SE.LAST_UPDATED, SE.VERSION, JE.JOB_EXECUTION_ID, JE.START_TIME, JE.END_TIME, JE.STATUS, JE.EXIT_CODE, JE.EXIT_MESSAGE, JE.CREATE_TIME, JE.LAST_UPDATED, JE.VERSION from BATCH_JOB_EXECUTION JE, BATCH_STEP_EXECUTION SE where       SE.JOB_EXECUTION_ID in (SELECT JOB_EXECUTION_ID from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ?)      and SE.JOB_EXECUTION_ID = JE.JOB_EXECUTION_ID       and SE.STEP_NAME = ? order by SE.START_TIME desc, SE.STEP_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, CREATE_TIME, LAST_UPDATED, VERSION, JOB_CONFIGURATION_LOCATION from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ? order by JOB_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING from BATCH_JOB_EXECUTION_PARAMS where JOB_EXECUTION_ID = ?
SELECT STEP_EXECUTION_ID, STEP_NAME, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED, VERSION from BATCH_STEP_EXECUTION where JOB_EXECUTION_ID = ? order by STEP_EXECUTION_ID

INSERT into BATCH_STEP_EXECUTION(STEP_EXECUTION_ID, VERSION, STEP_NAME, JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
INSERT INTO BATCH_STEP_EXECUTION_CONTEXT (SHORT_CONTEXT, SERIALIZED_CONTEXT, STEP_EXECUTION_ID) VALUES(?, ?, ?)
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_JOB_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE JOB_EXECUTION_ID = ?
SELECT  SE.STEP_EXECUTION_ID, SE.STEP_NAME, SE.START_TIME, SE.END_TIME, SE.STATUS, SE.COMMIT_COUNT, SE.READ_COUNT, SE.FILTER_COUNT, SE.WRITE_COUNT, SE.EXIT_CODE, SE.EXIT_MESSAGE, SE.READ_SKIP_COUNT, SE.WRITE_SKIP_COUNT, SE.PROCESS_SKIP_COUNT, SE.ROLLBACK_COUNT, SE.LAST_UPDATED, SE.VERSION, JE.JOB_EXECUTION_ID, JE.START_TIME, JE.END_TIME, JE.STATUS, JE.EXIT_CODE, JE.EXIT_MESSAGE, JE.CREATE_TIME, JE.LAST_UPDATED, JE.VERSION from BATCH_JOB_EXECUTION JE, BATCH_STEP_EXECUTION SE where       SE.JOB_EXECUTION_ID in (SELECT JOB_EXECUTION_ID from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ?)      and SE.JOB_EXECUTION_ID = JE.JOB_EXECUTION_ID       and SE.STEP_NAME = ? order by SE.START_TIME desc, SE.STEP_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, CREATE_TIME, LAST_UPDATED, VERSION, JOB_CONFIGURATION_LOCATION from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ? order by JOB_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING from BATCH_JOB_EXECUTION_PARAMS where JOB_EXECUTION_ID = ?
SELECT STEP_EXECUTION_ID, STEP_NAME, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED, VERSION from BATCH_STEP_EXECUTION where JOB_EXECUTION_ID = ? order by STEP_EXECUTION_ID

INSERT into BATCH_STEP_EXECUTION(STEP_EXECUTION_ID, VERSION, STEP_NAME, JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
INSERT INTO BATCH_STEP_EXECUTION_CONTEXT (SHORT_CONTEXT, SERIALIZED_CONTEXT, STEP_EXECUTION_ID) VALUES(?, ?, ?)
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_JOB_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE JOB_EXECUTION_ID = ?
SELECT  SE.STEP_EXECUTION_ID, SE.STEP_NAME, SE.START_TIME, SE.END_TIME, SE.STATUS, SE.COMMIT_COUNT, SE.READ_COUNT, SE.FILTER_COUNT, SE.WRITE_COUNT, SE.EXIT_CODE, SE.EXIT_MESSAGE, SE.READ_SKIP_COUNT, SE.WRITE_SKIP_COUNT, SE.PROCESS_SKIP_COUNT, SE.ROLLBACK_COUNT, SE.LAST_UPDATED, SE.VERSION, JE.JOB_EXECUTION_ID, JE.START_TIME, JE.END_TIME, JE.STATUS, JE.EXIT_CODE, JE.EXIT_MESSAGE, JE.CREATE_TIME, JE.LAST_UPDATED, JE.VERSION from BATCH_JOB_EXECUTION JE, BATCH_STEP_EXECUTION SE where       SE.JOB_EXECUTION_ID in (SELECT JOB_EXECUTION_ID from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ?)      and SE.JOB_EXECUTION_ID = JE.JOB_EXECUTION_ID       and SE.STEP_NAME = ? order by SE.START_TIME desc, SE.STEP_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, EXIT_CODE, EXIT_MESSAGE, CREATE_TIME, LAST_UPDATED, VERSION, JOB_CONFIGURATION_LOCATION from BATCH_JOB_EXECUTION where JOB_INSTANCE_ID = ? order by JOB_EXECUTION_ID desc
SELECT JOB_EXECUTION_ID, KEY_NAME, TYPE_CD, STRING_VAL, DATE_VAL, LONG_VAL, DOUBLE_VAL, IDENTIFYING from BATCH_JOB_EXECUTION_PARAMS where JOB_EXECUTION_ID = ?
SELECT STEP_EXECUTION_ID, STEP_NAME, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED, VERSION from BATCH_STEP_EXECUTION where JOB_EXECUTION_ID = ? order by STEP_EXECUTION_ID
INSERT into BATCH_STEP_EXECUTION(STEP_EXECUTION_ID, VERSION, STEP_NAME, JOB_EXECUTION_ID, START_TIME, END_TIME, STATUS, COMMIT_COUNT, READ_COUNT, FILTER_COUNT, WRITE_COUNT, EXIT_CODE, EXIT_MESSAGE, READ_SKIP_COUNT, WRITE_SKIP_COUNT, PROCESS_SKIP_COUNT, ROLLBACK_COUNT, LAST_UPDATED) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
INSERT INTO BATCH_STEP_EXECUTION_CONTEXT (SHORT_CONTEXT, SERIALIZED_CONTEXT, STEP_EXECUTION_ID) VALUES(?, ?, ?)
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?
UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_STEP_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE STEP_EXECUTION_ID = ?
UPDATE BATCH_STEP_EXECUTION set START_TIME = ?, END_TIME = ?, STATUS = ?, COMMIT_COUNT = ?, READ_COUNT = ?, FILTER_COUNT = ?, WRITE_COUNT = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, READ_SKIP_COUNT = ?, PROCESS_SKIP_COUNT = ?, WRITE_SKIP_COUNT = ?, ROLLBACK_COUNT = ?, LAST_UPDATED = ? where STEP_EXECUTION_ID = ? and VERSION = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?

UPDATE BATCH_JOB_EXECUTION_CONTEXT SET SHORT_CONTEXT = ?, SERIALIZED_CONTEXT = ? WHERE JOB_EXECUTION_ID = ?
SELECT VERSION FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID=?
SELECT COUNT(*) FROM BATCH_JOB_EXECUTION WHERE JOB_EXECUTION_ID = ?
UPDATE BATCH_JOB_EXECUTION set START_TIME = ?, END_TIME = ?,  STATUS = ?, EXIT_CODE = ?, EXIT_MESSAGE = ?, VERSION = ?, CREATE_TIME = ?, LAST_UPDATED = ? where JOB_EXECUTION_ID = ? and VERSION = ?