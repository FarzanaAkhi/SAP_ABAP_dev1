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

