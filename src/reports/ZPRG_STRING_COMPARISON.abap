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

*****CO (Contains Only)***********

DATA : lv_string1(20) TYPE c VALUE 'system'.
DATA : lv_string2(30) TYPE c VALUE 'system Application Product'.

IF lv_string1 co lv_string2 .
  WRITE: 'True', sy-fdpos.
  ELSE.
      WRITE: 'False', sy-fdpos.

ENDIF.

**Output: TRUE 20***

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

***OUTPUT: FALSE 6, Because at the point of 6th in v2 the letter z didn't found in v2***

Here systemz is not present in the 2nd varriable. Because it's CO( Contains Only)

DATA : lv_string1(30) TYPE c VALUE 'System application producTT'.
DATA : lv_string2(30) TYPE c VALUE 'System Application Product'.

IF lv_string1 co lv_string2 .
  WRITE: 'True', sy-fdpos.

  ELSE.
      WRITE: 'False', sy-fdpos.

ENDIF.

***OUTPUT: FALSE 25, Because at the point of 25th or in whole v2 the letter T didn't found in v2***

* System will check the whole varriable length and each letter whether all letters present in 2nd varriable or not. here capital T is not present in the 2nd varriable so output is false.
Though small or capital doesn't matter but has to be present in "CO" string operation case.


********CN (Contains not only)***********
***Exact opposite of CO********

DATA : lv_string1(20) TYPE c VALUE 'System '.
DATA : lv_string2(30) TYPE c VALUE 'System Application Product'.

IF lv_string1 CN lv_string2 .
  WRITE:  sy-fdpos.

ELSE.
  WRITE:  sy-fdpos.

ENDIF.

***Result will be 20, because the condition is true and will go for 2nd condion and find false so shows v1's result.

***In CO if the condition is TRUE it shows the Varriable 1's length and in CN if the condition is False then it shows Varriable 1's length.


**for instance,***


DATA : lv_string1(20) TYPE c VALUE 'Systemz '.
DATA : lv_string2(30) TYPE c VALUE 'System Application Product'.

IF lv_string1 CN lv_string2 .
  WRITE:  sy-fdpos.

ELSE.
  WRITE:  sy-fdpos.

ENDIF.

***here output will be 6 becuase z is not in varriable 2 in the position of 6.***

****CA(Contain any)****

DATA : lv_string11(20) TYPE c VALUE 'Test@1234'.
DATA : lv_string12(20) TYPE c VALUE '0123456789'.

IF lv_string11 CA lv_string12.
  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

***Output is 5 becuase matched in the position of 5.***

**If any letters in var1 and var2 do not match, the output will be the length of var1.***

DATA : lv_string11(20) TYPE c VALUE 'Test@abc'.
DATA : lv_string12(20) TYPE c VALUE '0123456789'.

IF lv_string11 CA lv_string12.
  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

***Output is 8***

***CA is case sensitive***

DATA : lv_string11(20) TYPE c VALUE 'Test@abc'.
DATA : lv_string12(20) TYPE c VALUE '0123456789'.
DATA : lv_string13(20) TYPE c VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

IF lv_string11 CA lv_string13.
  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

***Output is 0 becuase the letter position is var1 is 0 which matched to var3***

DATA : lv_string11(20) TYPE c VALUE 'test@abc'.
DATA : lv_string12(20) TYPE c VALUE '0123456789'.
DATA : lv_string13(20) TYPE c VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

IF lv_string11 CA lv_string13.
  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

**Output will show the length of the v1 becuase it's case sensitive and doesn't match to var3.

***NA(Contains not any)***

DATA : lv_string11(10) TYPE c VALUE 'Test@1234'.
DATA : lv_string12(10) TYPE c VALUE '0123456789'.
DATA : lv_string13(29) TYPE c VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

IF lv_string11 NA lv_string12.

  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

**Output is 5, first matching charachter***

ATA : lv_string11(10) TYPE c VALUE 'Test@abcd'.
DATA : lv_string12(10) TYPE c VALUE '0123456789'.
DATA : lv_string13(29) TYPE c VALUE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.

IF lv_string11 NA lv_string12.

  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

***Output is 10, length of v1 becuase no same charachter found in v2.***

REPORT ZPRG_STRING_COMPARISON2.

*Conatins String (CS)

DATA : lv_string1(30) TYPE c VALUE 'System Application Product'.
DATA : lv_string2(10) TYPE c VALUE 'System'.

IF lv_string1 CS lv_string2.

  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

*Output will show the first matching string which is 0**

**if the result is false then will show the length of the v1***, for instance***

*Conatins String (CS)

DATA : lv_string1(30) TYPE c VALUE 'System Application Product'.
DATA : lv_string2(10) TYPE c VALUE 'Welcome'.

IF lv_string1 CS lv_string2.

  WRITE: sy-fdpos.
  ELSE.
    WRITE: sy-fdpos.

ENDIF.

*** Output is showing th length of the v1 which is 30***

**CS is not case sensitive**

*Contains CO***

DATA: lv_string1(5) TYPE c VALUE 'Madam'.

DATA: lv_string2(5) TYPE c VALUE 'damaM'.

IF lv_string1 CO lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output is 5, length of v1** Because condition is TRUE.

**CS(Contains String)**

DATA: lv_string1(5) TYPE c VALUE 'Madam'.

DATA: lv_string2(5) TYPE c VALUE 'damaM'.

IF lv_string1 CS lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** CS opposite of CO and Output is 5, length of v1 becuase condition is false.** Not case sensitive**

**NS(Contains No String)***

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE 'system'.

IF lv_string1 NS lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Not case sensitive** output is Flase, 0, so will show the first charachter of v2**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE 'welcome'.

IF lv_string1 NS lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output is TRUE, so will return the length of v1**

**CP(Contains Pattern)**
// Here '*' means all / or any . So if we use * at the begining then system will assume any ocharachter or all string

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*App*'.

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** Output is 7, Because it's TRUE and first matching character's position will show as output"


DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE 'App*'. // Removed * from the begining, so system will see that string has started with System not App and as * is after App so it will think after app any number of character//

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output will be False and will show the length of V1**
**Not case Sensitive**

Notes for CP( Contains Pattern):  * - Match any sequence of charachter
                                  + - Match any single charachter
                                  # - Interpret the next charachter, Called escape Character

**Now '#'**
Usage : 1. Can be used to make a search case sensitive.
2. The wildcard characters * and +
3. The escape character itself

*Examples (Can be used to make a search case sensitive.)*
DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*#app*'.

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output will show False and length of v1, becuase when we used # it specify the case sensitiveness, 
as the Application starts with capital A, so when we added # with star it dedicatedly specified the character**

**Examples(The wildcard characters * and +)**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*#**'. // Here * after # is character *, not symbol//

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** So output is False bbecause ethere is no * in the string** 
*But if we add * in the first string then the output will be TRUE and will show offset of first matching character position of v1*

*Examples(The escape character itself)*

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*##*'. //here 2nd # is character #, not symbol//

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

***Now '+'***
Notes : Match Any single character

**CP +**

DATA: lv_string1(5) TYPE c VALUE 'ABCDE'.

DATA: lv_string2(5) TYPE c VALUE 'AB+DE'.

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

***Output is TRUE and will return the position of the first matching Character so, 0.**

**Removing character after +**

DATA: lv_string1(5) TYPE c VALUE 'ABCDE'.

DATA: lv_string2(5) TYPE c VALUE 'AB+'. // After + there is no other character //

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output is False becuase + works only one character. So output will return the length of v1 which is 5**

** Addicing '*' after +**

DATA: lv_string1(5) TYPE c VALUE 'ABCDE'.

DATA: lv_string2(5) TYPE c VALUE 'AB+*'.

IF lv_string1 CP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Output is TRUE and will return 0 becuase '*' represents all**// we can add + for all single characters//

*** NP(Contains no pattern)*** Opposite of CP**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*App*'.

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** Output is FALSE and will go for else part cause the v2 string is containg pattern of v1, 
**so will return first position character of v2 that is in v1, result is 7**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE 'App*'. // Removed first '*'. 

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Here output is TRUE because first string is not containing the 2nd string. 
*So it will return the length of first string**, output is 30.

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*Welcome*'.

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Here also output is TRUE because first string is not containing the 2nd string. 
*So it will return the length of first string**, output is 30.

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '#App*'. // Here after '#', it will interpret the next charachter as it is, and '*' interpret any seq of charachter//

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** Output is FALSE and will go for else part cause the v2 string is containg pattern of v1, 
**so will return first position character of v2 that is in v1, result is 7**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '#app*'. // '#' contains the case sensitivity, here app is with small a//

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

**Here also output is TRUE because first string is not containing the 2nd string. 
*So it will return the length of first string**, output is 30.


***** NP(Contains no pattern)*** Opposite of CP '+' and '#'**
* '*' means sequence of charachter but '_' means any single character**
**Now look for specific +, specific * and specific # itself.**

DATA: lv_string1(30) TYPE c VALUE 'System Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*#**'. //" here * first star is sequence of character, 2nd * will act as a single character, character * itself because before that # is present. //

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** Output is TRUE becuase first string is not containing the 2nd string. **
**Bucause we are looking for contains no pattern, so output will return the length of first string which is 30**


** Now false result Example***

DATA: lv_string1(30) TYPE c VALUE 'System* Application Product'.

DATA: lv_string2(10) TYPE c VALUE '*#**'. " here * first star is sequence of character, 2nd * will act as a single character, character * itself because before that # is present, so * is present in v1 string.

IF lv_string1 NP lv_string2.
  WRITE : sy-fdpos.
ELSE.
  WRITE:sy-fdpos.
ENDIF.

** Output is False becuase first string is containing the 2nd string and we are looking for not pattern,**
** So output will go to else part and will return the first matching character position which is 6***