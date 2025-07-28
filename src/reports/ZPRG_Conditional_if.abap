" Program: ZPRG_CONDITIONAL_IF
" Purpose: Practice Calculation of two numbers in ABAP
" Created on: 2025-07-28
" Author: Farzana Akter

*& Report  ZPRG_CONDITIONAL_IF
*&
*&--------------------------------

REPORT ZPRG_CONDITIONAL_IF.
data lv_input1(2) type c.
lv_input1 = 40.
*signle if
if lv_input1 = 30.
  write 'In single if'.
  write: 'value is assigned'.
endif.
*if with else
if lv_input1 = '10'.
  write: 'value is assigned'.
else.
  write: / 'another value is assigned'   .
endif.
* If with multiple if i.e elseif
if lv_input1 = '40'.
  write: /  'value is 40'.
elseif lv_input1 = '30'.
 message:  'value is 30' type 'I'.
endif.