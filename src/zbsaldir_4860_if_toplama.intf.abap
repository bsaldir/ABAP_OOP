interface ZBSALDIR_4860_IF_TOPLAMA
  public .


  data INSTANCE type DEC07 .

  methods TOPLAMA
    importing
      !IV_DEC1 type DEC07
      !IV_DEC2 type DEC07
    exporting
      !EV_SONUC type DEC07 .
endinterface.
