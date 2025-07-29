*& Report  ZPRG_DO_LOOP
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zprg_do_loop.

DATA lv_input(2) TYPE n VALUE 10.

DO 10 TIMES.
lv_input = lv_input + 1.
CHECK lv_input = 15.
write : 'The Output is ', lv_input.
ENDDO.

* Do Loop First Syntax
*DO 10 TIMES.
*  IF lv_input = 14.
*    CONTINUE.
*  ENDIF.
*  WRITE : / 'The Output is', lv_input.
*  lv_input = lv_input + 1.
*ENDDO.

**Do Loop 2nd Syntax
*
*DO .
*  IF lv_input = 15.
*    EXIT. " Exit Statement helps us to Exit From the current loop
*  ENDIF.
*
*  WRITE : / 'The Output is', lv_input.
*  lv_input = lv_input + 1.
*ENDDO.
REPORT zprg_doloop.
*DATA lv_input TYPE I VALUE 10.
*
*DO 10 TIMES.
*  WRITE: 'The Output is', lv_input.
*  lv_input = lv_input + 1.
*
*ENDDO.

DATA lv_input TYPE i VALUE 10.

DO.
  IF lv_input = 15.
    EXIT.

  ENDIF.
  WRITE: / 'The Output is', lv_input.
  lv_input = lv_input + 1.

ENDDO.

*Continue
DATA lv_input(2) TYPE n VALUE 10.
DO 10 TIMES.
  IF lv_input = 14.
    CONTINUE.

  ENDIF.
    WRITE: / 'The Output is', lv_input.
    lv_input = lv_input + 1.
    ENDDO.

    *Check Statement
DO 10 TIMES.
  lv_input = lv_input + 1.
  CHECK lv_input = 15.
  WRITE: / 'The Output is', lv_input.
  lv_input = lv_input+1.

ENDDO.