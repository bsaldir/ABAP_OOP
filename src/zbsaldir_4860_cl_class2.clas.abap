CLASS zbsaldir_4860_cl_class2 DEFINITION
  PUBLIC
  INHERITING FROM zbsaldir_4860_cl_class1
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS call
      IMPORTING
        !iv_dec1  TYPE dec07
        !iv_dec2  TYPE dec07
      CHANGING
        !cv_sonuc TYPE dec07 .
  PROTECTED SECTION.
    METHODS bolme REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBSALDIR_4860_CL_CLASS2 IMPLEMENTATION.


  METHOD bolme.
    CALL METHOD super->bolme
      EXPORTING
        iv_dec1  = iv_dec1
        iv_dec2  = iv_dec2
      CHANGING
        cv_sonuc = cv_sonuc
      EXCEPTIONS
        zero     = 1                " 0 a bölünme
        OTHERS   = 2.
    IF sy-subrc EQ 1.
      RAISE zero.
    ENDIF.


    TRY.
        cv_sonuc = iv_dec1 / iv_dec2.
      CATCH cx_sy_zerodivide.
        RAISE zero.
    ENDTRY.

  ENDMETHOD.


  METHOD call.

    bolme(
      EXPORTING
        iv_dec1  = iv_dec1
        iv_dec2  = iv_dec2
      CHANGING
        cv_sonuc = cv_sonuc
      EXCEPTIONS
        zero     = 1                " 0 a bölünme
        others   = 2
    ).
    IF SY-SUBRC <> 0.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
