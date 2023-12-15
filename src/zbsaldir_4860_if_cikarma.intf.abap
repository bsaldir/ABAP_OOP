interface ZBSALDIR_4860_IF_CIKARMA
  public .


  class-data INSTANCE type DEC07 .

  class-methods CIKARMA
    importing
      !IV_DEC1 type DEC07
      !IV_DEC2 type DEC07
    returning
      value(RV_SONUC) type DEC07 .
endinterface.
