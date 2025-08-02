SY-FDPOS


CA: Contains only
CN: Contains not only
CA: Contains any
NA: Contains not any
CS: Contains String
NS: Contains no String
CP: Contains Pattern
NP: Contains no Pattern

REPORT ZPRG_STRING_COMPARISON.

DATA : lv_string1(20) TYPE c VALUE 'system'.
DATA : lv_string2(30) TYPE c VALUE 'system Application Product'.

IF lv_string1 co lv_string2 .
  WRITE: 'True', sy-fdpos.
  ELSE.
      WRITE: 'False', sy-fdpos.

ENDIF.

* if the word "system" found in the condition, it will show the varriable1's length.
else will show the 2nd varriables length.

For instance ,

REPORT ZPRG_STRING_COMPARISON.

DATA : lv_string1(20) TYPE c VALUE 'systemz'.
DATA : lv_string2(30) TYPE c VALUE 'system Application Product'.

IF lv_string1 co lv_string2 .
  WRITE: 'True', sy-fdpos.
  ELSE.
      WRITE: 'False', sy-fdpos.

ENDIF.

Here systemz is not present in the 2nd varriable. Because it's CO( Contains Only)

DATA : lv_string1(30) TYPE c VALUE 'System application producTT'.
DATA : lv_string2(30) TYPE c VALUE 'System Application Product'.

IF lv_string1 co lv_string2 .
  WRITE: 'True', sy-fdpos.

  ELSE.
      WRITE: 'False', sy-fdpos.

ENDIF.

* System will check the whole varriable length and each letter whether all letters present in 2nd varriable or not. here capital T is not present in the 2nd varriable so output is false.
Though small or capital doesn't matter but has to be present in "CO" string operation case.