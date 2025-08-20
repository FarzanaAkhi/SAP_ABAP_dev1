**Some Notes: Structure is a collection of columns and we have to create a structure of file column. for instance,
** need an internal table of 10 columns, so we need to create a structure of 10 columns.

REPORT ZPRG_INTERNALTABLE_CHECK.
****Create a structure type to declear the internal table****

TYPES : BEGIN OF lty_data,
        ono TYPE ZDEONO_28, " ono - Data object, ZDEONO_28 - Data type
        PM TYPE  ZDEPM_28,
        END OF lty_data.  // Structure of 2 columns//

*DATA: lv_ono(10) TYPE N.
*DATA: lv_ono(10) TYPE ZDEONO_28.

DATA: lt_data TYPE TABLE OF lty_data. "lt_data (internal table, which stores data)- data object, lty_data - Data type (Structured) because it's complex data"

**Declear work area

DATA: lwa_data TYPE lty_data.

** We can create structured data type through se11 transaction or through code.**

** structured data type creating through code**

REPORT ZPRG_INTERNALTABLE_CHECK.

TYPES : BEGIN OF lty_data,
        ono TYPE ZDEONO_28, " ono - Data object, ZDEONO_28 - Data type
        PM TYPE  ZDEPM_28,
        END OF lty_data.

*DATA: lv_ono(10) TYPE N.
*DATA: lv_ono(10) TYPE ZDEONO_28.

DATA: lt_data TYPE TABLE OF lty_data. "lt_data- data object
DATA: lwa_data TYPE lty_data.
DATA: lt_data TYPE TABLE OF ZSTYPE_ORDER. // Same structure name as I created through se11 transaction//
DATA: lwa_data TYPE ZSTYPE_ORDER.

**Differnece between creating structured data type through coding and through se11 transaction***

Coding : I can  not reuse the code created structured data type in anyother program. Becuase it's local to this program.
Se11 transaction : If I create another program and want to reuse the internal table/ structured data type which made through se11 transaction, I can do that**
**Because se11 transaction has a global scope** Global Scope : Can use end number of programs**

** Internal Table : Keyword is Type Table of**
*Work area always stores single records at runtime**


***Table type to declear the internal table**

TYPES : BEGIN OF lty_data,
        ono TYPE ZDEONO_28, " ono - Data object, ZDEONO_28 - Data type
        PM TYPE  ZDEPM_28,
        END OF lty_data.
       
TYPES: ltty_data TYPE TABLE OF lty_data.
       
DATA: lt_data TYPE TABLE OF lty_data. "lt_data- data object
DATA: lwa_data TYPE lty_data.
DATA: lt_data TYPE TABLE OF ZSTYPE_ORDER.
DATA: lwa_data TYPE ZSTYPE_ORDER.
DATA: lt_data TYPE ltty_data.
DATA: lwa_data TYPE lty_data. " Work area never uses table type, only structre type"
DATA: lt_data TYPE ZTSTYPE_ORDER. // Same table I have created through se11 already//

***Important Notes***

Internal Table Operations

Append – It is used to insert data at the last of the internal table.

Delete – It is used to delete the records from the internal table.

Modify – It is used to modify the records of the internal table.

Loop – It is used to read the records one by one from the internal table.

Read table – It is used to read the first matching record from the internal table.

Clear, Refresh – It is used to clear the contents of the internal table.

Collect – It is used to make sum of amount values based upon unique character values.


** Internal table operation: Append**

TYPES : BEGIN OF lty_data,
        ono TYPE ZDEONO_28, " ono - Data object, ZDEONO_28 - Data type
        PM TYPE  ZDEPM_28,
        END OF lty_data.
        
DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.

lwa_data-ono = 1.
lwa_data-pm = 'C'.
APPEND lwa_data to lt_data.
CLEAR : lwa_data.

lwa_data-ono = 1.
lwa_data-pm = 'D'.
APPEND lwa_data to lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'C'.
APPEND lwa_data to lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'D'.
APPEND lwa_data to lt_data.
CLEAR : lwa_data.

lwa_data-ono = 3.
lwa_data-pm = 'C'.
APPEND lwa_data to lt_data.
CLEAR : lwa_data.


**In debugging mode each time I executed it always started where I finished last time, so started after the last inserted data**
***Work area takes 1 record at a time**

**Loop at internal Table**
**Loop is an internal table operation, which will read the records of the internal table one by one***
**As many as I have records loop will read that many times**

LOOP AT lt_data INTO lwa_data.
  WRITE: / lwa_data-ono, lwa_data-pm.
ENDLOOP.

**Output is : lt_data:[5x2(22)]Standard Table
** lwa_data: 0000000001C
LWA_DATA-ONO : 0000000001
LWA_DATA-PM: C

*** Then again in the next iteration: LWA_DATA: 0000000002D
LWA_DATA-ONO: 0000000002
LWA_DATA-PM: D

ONO                   pm
0000000001             C 
0000000001             D
0000000002             C
0000000002             D
0000000003             C

*Delete with Where condition**

TYPES : BEGIN OF lty_data,
        ono TYPE zdeono_28, " ono - Data object, ZDEONO_28 - Data type
        pm TYPE  zdepm_28,
        END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.

lwa_data-ono = 1.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 1.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 3.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

Delete lt_data WHERE pm = 'D'.

**Output: 0000000001      C 
          0000000002      C
          0000000003      C ** it Deleted all lt_data ='D' details

** If I put Delete lt_data WHERE pm = 'd', it will not work""

**Delete Specific Index***
*Delete Internal table index**

DELETE lt_data INDEX 3.

**Output: 0000000001      C
          0000000001      D
          0000000002      D
          0000000003      C** It deleted Index 3**

**Modify The Internal Table**

LOOP at lt_data INTO lwa_data.

  if lwa_data-ono = 1.
    lwa_data-pm = 'N'.
    MODIFY lt_data  FROM lwa_data TRANSPORTING pm.
    ENDIF.

  ENDLOOP.

  * output is:
ONO                   pm
0000000001             N
0000000001             N
0000000002             C
0000000002             D
0000000003             C

*Because i asked only to change if workarea is 1 then change PM to N..** TRANSPORTING specify the column.

**READ Table**

TYPES : BEGIN OF lty_data,
        ono TYPE zdeono_28, " ono - Data object, ZDEONO_28 - Data type
        pm TYPE  zdepm_28,
        END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.
DATA: lv_lines TYPE I.

lwa_data-ono = 1.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 1.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 3.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

READ TABLE lt_data INTO lwa_data with KEY ONO = 1.

IF  SY-SUBRC = 0.
  WRITE : / lwa_data-ono, lwa_data-pm.
  else.
    WRITE : / 'Unsuccessful'.

ENDIF.

**Output is 0000000001      C, becuase READ Table always matches the first record**

READ TABLE lt_data INTO lwa_data with KEY ONO = 4. // Changed the order no to 4**

IF  SY-SUBRC = 0.
  WRITE : / lwa_data-ono, lwa_data-pm.
  else.
    WRITE : / 'Unsuccessful'.

ENDIF.

**Output is Unsuccessful, becuase there is no order number 4**

READ TABLE lt_data INTO lwa_data Index 4.
IF  SY-SUBRC = 0.
  WRITE : / lwa_data-ono, lwa_data-pm.

ENDIF.

** Output is 0000000002 D**

**Clear/ Refresh Internal Table**

TYPES : BEGIN OF lty_data,
        ono TYPE zdeono_28, " ono - Data object, ZDEONO_28 - Data type
        pm TYPE  zdepm_28,
        END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.

lwa_data-ono = 1.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 1.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 3.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data. // REFRESH doesn't work for work area, only Clear//

**Clear/ Refresh Internal Table**

CLEAR lt_data.
REFRESH : lt_data

*** Internal Table has now 0 records**

** Describe Table**
DESCRIBE TABLE lt_data LINES lv_lines.  // Decleare DATA: lv_lines TYPE I at the begining.//
DESCRIBE TABLE lt_data LINES lv_lines.
WRITE : / lv_lines.
CLEAR lt_data.

DESCRIBE TABLE lt_data LINES lv_lines.
WRITE : / lv_lines.

**Output will show first 5 and then 0**