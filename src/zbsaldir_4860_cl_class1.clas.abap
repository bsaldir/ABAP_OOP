class ZBSALDIR_4860_CL_CLASS1 definition
  public
  create public .

public section.

  interfaces ZBSALDIR_4860_IF_TOPLAMA .
  interfaces ZBSALDIR_4860_IF_CIKARMA .
protected section.

  methods BOLME
    importing
      !IV_DEC1 type DEC07
      !IV_DEC2 type DEC07
    changing
      !CV_SONUC type DEC07
    exceptions
      ZERO .
  PRIVATE SECTION.
ENDCLASS.



CLASS ZBSALDIR_4860_CL_CLASS1 IMPLEMENTATION.


  METHOD bolme.

*    TRY.
*        cv_sonuc = iv_dec1 / iv_dec2.
*      CATCH cx_sy_zerodivide.
*        RAISE zero.
*    ENDTRY.

  ENDMETHOD.


  METHOD zbsaldir_4860_if_cikarma~cikarma.

    rv_sonuc = iv_dec1 - iv_dec2.
    zbsaldir_4860_if_cikarma~instance = rv_sonuc.

  ENDMETHOD.


  METHOD zbsaldir_4860_if_toplama~toplama.

    ev_sonuc = iv_dec1 + iv_dec2.
    zbsaldir_4860_if_toplama~instance = ev_sonuc.

  ENDMETHOD.
ENDCLASS.
