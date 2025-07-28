*& Report  ZPRG_WHILE_LOOP
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zprg_while_loop.

DATA lv_input(20) TYPE n VALUE 10.

WHILE lv_input LT 15.

  WRITE: / 'The output' , lv_input.
  lv_input = lv_input + 1.

ENDWHILE.