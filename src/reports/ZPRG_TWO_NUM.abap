" Program: ZPRG_TWO_NUM
" Purpose: Practice Calculation of two numbers in ABAP
" Created on: 2025-07-28
" Author: Farzana Akter

*&---------------------------------------------------------------------*
*& Report  ZPRG_TWO_NUM
*&---------------------------------------------------------------------*

REPORT zprg_two_num.

DATA: lv_input1(2) TYPE n VALUE 10,  "First Input.
      lv_input2(2) TYPE n VALUE 20,  "Second Input.
      lv_output(3) TYPE n.           "Third Input.

lv_output = lv_input1 + lv_input2.  "Processing Logic

WRITE : 'The Result is' ,lv_output,                     "To Display the Output
 / lv_input1,
 / lv_input2.
