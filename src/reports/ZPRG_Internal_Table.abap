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