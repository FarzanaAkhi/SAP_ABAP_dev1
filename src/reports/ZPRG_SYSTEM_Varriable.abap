REPORT ZPRG_SYSTEM_VARRIABLE.
*Name Of the Logon User
WRITE: 'The name of the User', sy-uname.

DO 10 TIMES.
  WRITE: / sy-index, sy-tabix.

ENDDO.

WRITE : / 'The Date is', sy-datum.
WRITE : / 'The time is', sy-uzeit.