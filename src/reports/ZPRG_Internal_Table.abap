**Some Notes: Structure is a collection of columns and we have to create a structure of file column. for instance,
** need an internal table of 10 columns, so we need to create a structure of 10 columns.

REPORT ZPRG_INTERNALTABLE_CHECK.
**Create a structure**

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