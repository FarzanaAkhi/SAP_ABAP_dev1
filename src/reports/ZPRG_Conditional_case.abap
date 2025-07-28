*&---------------------------------------------------------------------*
*& Report  ZPRG_CONDITIONAL_WHEN
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zprg_conditional_case.

DATA lv_input(2) VALUE 6.


CASE lv_input .
  WHEN 1.
    WRITE: 'The output is', lv_input.
  WHEN 2.
    WRITE: 'The output is', lv_input.
  WHEN 4.
    WRITE: 'The output is', lv_input.
  WHEN OTHERS.
    WRITE: 'The output is WRONG'.
ENDCASE.