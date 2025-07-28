*& Report  ZPRG_CONDITIONAL_IF_ELSE
*&
*&---------------------------------------------------------------------*
REPORT zprg_conditional_if_else.
*DATA lv_input(2) TYPE n VALUE 10.
**Checking the If condition
*
*IF lv_input = 10.
*  WRITE: 'The Output is' , lv_input.
*
*ENDIF.

*Checking the If condition with wrong value

"DATA lv_input(2) TYPE n VALUE 2.


*"IF lv_input = 10.
*"  WRITE: 'The Output is' , lv_input.
*
*"ENDIF.

*Checking the If Else condition

DATA lv_input(2) TYPE n VALUE 5.


IF lv_input = 1.
  WRITE: 'The Output is' , lv_input.
ELSEIF lv_input = 2 .
  WRITE: 'The Output is' , lv_input.
ELSEIF lv_input = 3 .
  WRITE: 'The Output is' , lv_input.
ELSE.
  WRITE: 'Wrong Input'.

ENDIF.