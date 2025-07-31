*&---------------------------------------------------------------------*
*& Report  ZPRG_STRINGS_OPERATIONS
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

*Concatenate String Operation

REPORT ZPRG_STRINGS_OPERATIONS.
DATA: lv_input1(10) TYPE C VALUE 'Welcome',
      lv_input2(10) TYPE C VALUE 'To',
      lv_input3(10) TYPE C VALUE 'Home',
      lv_Output TYPE String.

* Split String Operation

DATA: lv_sinput1(10) TYPE C,
      lv_sinput2(10) TYPE C,
      lv_sinput3(10) TYPE C.


CONCATENATE lv_input1 lv_input2 lv_input3 into lv_Output SEPARATED BY '/'.

WRITE: 'The result is:', lv_Output.


SPLIT lv_Output AT '/' INTO lv_sinput1 lv_sinput2 lv_sinput3.

WRITE : /'Result After Split:',/ lv_sinput1, / lv_sinput2,/ lv_sinput3.

*CONDENSE String Operation

DATA: lv_input TYPE String VALUE '  Welcome      To     Home'    .

WRITE:/ 'Before Condense' , lv_input.

CONDENSE lv_input.

WRITE:/ 'After Condense' , lv_input.

*CONDENSE NO GAP

DATA: lv_input TYPE String VALUE '  Welcome      To     Home'    .

*STRLEN STRING Operation

DATA lv_length(2) TYPE N.

lv_length = STRLEN( lv_input ).
WRITE: /'The length before Condense:', lv_length.

WRITE:/ 'Before Condense:' , lv_input.

CONDENSE lv_input.

WRITE:/ 'After Condense:' , lv_input.

lv_length = STRLEN( lv_input ).
WRITE: /'The length before Condense:', lv_length.

CONDENSE lv_input NO-GAPS.

WRITE:/ 'After Condense NO-GAPS:' , lv_input.

lv_length = STRLEN( lv_input ).
WRITE: /'The length before Condense:', lv_length.



*FIND String Operation

DATA lv_input(50) TYPE c VALUE 'System Application product'.

FIND 'System' IN lv_input IGNORING CASE.
IF sy-subrc = 0.

  WRITE:'Successful', sy-subrc.

ELSE.
  WRITE:'UnSuccessful', sy-subrc.

ENDIF.

*Translate Upper and Lower case

DATA : lv_input(50) TYPE c VALUE ' Welcome To Home',
       lv_input1(50) TYPE c VALUE ' welcome to home'.

TRANSLATE lv_input1 TO UPPER CASE.
WRITE:/ lv_input1.

TRANSLATE lv_input TO LOWER CASE.
WRITE: / lv_input.

DATA : lv_input(50) TYPE c VALUE ' Welcome To Home',
       lv_input1(50) TYPE c VALUE ' welcome to home',
       lv_rule(10) TYPE c value 'wWtThH'.

TRANSLATE lv_input USING lv_rule.
WRITE: / 'Output Using Rule:', lv_input.

DATA: lv_input1(10) TYPE c VALUE'012345678',
      lv_input2(10) TYPE c VALUE'012345678',
      lv_input3(10) TYPE c VALUE'012345678'.


SHIFT lv_input1 By 5 places.
WRITE: 'Left:', lv_input1.

SHIFT lv_input2 By 4 places RIGHT.
WRITE: / 'Right:', lv_input2.

SHIFT lv_input1 By 4 places CIRCULAR.
WRITE: / 'Circular:', lv_input3.