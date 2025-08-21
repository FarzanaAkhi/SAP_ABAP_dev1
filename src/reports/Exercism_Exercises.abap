CLASS zcl_hello_world DEFINITION PUBLIC.
  PUBLIC SECTION.
    METHODS hello RETURNING VALUE(result) TYPE string.
ENDCLASS.

CLASS zcl_hello_world IMPLEMENTATION.

  METHOD hello.
    result = 'Hello, World!'.
  ENDMETHOD.

ENDCLASS.


"Exercise 2

"Instructions
Learn the basics about ABAP internal tables.

Your class has an internal table named initial_data. It has three columns: GROUP, NUMBER, and DESCRIPTION.

TYPES group TYPE c LENGTH 1.
TYPES: BEGIN OF initial_type,
         group       TYPE group,
         number      TYPE i,
         description TYPE string,
       END OF initial_type,
       initial_data TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

"Step 1

Step 1
Your first task is to complete the method fill_itab and place 6 records into this table with the following values:

GROUP	   NUMBER  	DESCRIPTION
A	        10	    Group A-2
B        	5	      Group B
A	        6	      Group A-1
C	       22	      Group C-1
A	       13	      Group A-3
C	       500	    Group C-2

"Solution :

METHOD fill_itab.
  " Start clean
  CLEAR initial_data.

  " Put the 6 rows in exactly as requested
  APPEND VALUE #( group = 'A' number = 10  description = 'Group A-2' ) TO initial_data.
  APPEND VALUE #( group = 'B' number = 5   description = 'Group B'   ) TO initial_data.
  APPEND VALUE #( group = 'A' number = 6   description = 'Group A-1' ) TO initial_data.
  APPEND VALUE #( group = 'C' number = 22  description = 'Group C-1' ) TO initial_data.
  APPEND VALUE #( group = 'A' number = 13  description = 'Group A-3' ) TO initial_data.
  APPEND VALUE #( group = 'C' number = 500 description = 'Group C-2' ) TO initial_data.
ENDMETHOD.
