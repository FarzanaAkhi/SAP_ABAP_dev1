**Some Notes: Structure is a collection of columns and we have to create a structure of file column. for instance,
** need an internal table of 10 columns, so we need to create a structure of 10 columns.

REPORT ZPRG_INTERNALTABLE_CHECK.
**Create a structure**

TYPES : BEGIN OF lty_data,
        ono TYPE ZDEONO_28, " ono - Data object, ZDEONO_28 - Data type
        PM TYPE  ZDEPM_28,
        END OF lty_data.

DATA: lv_ono(10) TYPE N.
DATA: lv_ono(10) TYPE ZDEONO_28.