*&---------------------------------------------------------------------*
*& Report ZBSALDIR_4860_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbsaldir_4860_p_oop.

PARAMETERS: p_dec1 TYPE dec07,
            p_dec2 TYPE dec07,
            p_dec3 TYPE dec07,
            p_dec4 TYPE dec07.

DATA: go_class1_1 TYPE REF TO zbsaldir_4860_cl_class1,
      go_class1_2 TYPE REF TO zbsaldir_4860_cl_class1,
      go_class2   TYPE REF TO zbsaldir_4860_cl_class2,
      gv_changing TYPE dec07.

CREATE OBJECT: go_class1_1, go_class1_2, go_class2.

go_class1_1->zbsaldir_4860_if_toplama~toplama(
 EXPORTING
   iv_dec1  = p_dec1                 " 7 basamaklı ondalık alan
   iv_dec2  = p_dec2                 " 7 basamaklı ondalık alan
 IMPORTING
   ev_sonuc = DATA(gv_class1_1_toplama) ).                 " 7 basamaklı ondalık alan

go_class1_1->zbsaldir_4860_if_cikarma~cikarma(
 EXPORTING
   iv_dec1  = p_dec1                 " 7 basamaklı ondalık alan
   iv_dec2  = p_dec2                 " 7 basamaklı ondalık alan
 RECEIVING
   rv_sonuc = DATA(gv_class1_1_cikarma) ).                 " 7 basamaklı ondalık alan

go_class1_2->zbsaldir_4860_if_toplama~toplama(
 EXPORTING
   iv_dec1  = p_dec3                 " 7 basamaklı ondalık alan
   iv_dec2  = p_dec4                 " 7 basamaklı ondalık alan
 IMPORTING
   ev_sonuc = DATA(gv_class1_2_toplama) ).                 " 7 basamaklı ondalık alan

go_class1_2->zbsaldir_4860_if_cikarma~cikarma(
 EXPORTING
   iv_dec1  = p_dec3                 " 7 basamaklı ondalık alan
   iv_dec2  = p_dec4                 " 7 basamaklı ondalık alan
 RECEIVING
   rv_sonuc = DATA(gv_class1_2_cikarma) ).                 " 7 basamaklı ondalık alan

go_class2->call(
 EXPORTING
   iv_dec1  = p_dec1                 " 7 basamaklı ondalık alan
   iv_dec2  = p_dec2                 " 7 basamaklı ondalık alan
 CHANGING
   cv_sonuc = gv_changing ).                 " 7 basamaklı ondalık alan

WRITE: 'Class-1_1 toplama sonucu: ' && gv_class1_1_toplama,/.
WRITE: 'Class-1_1 çıkarma sonucu: ' && gv_class1_1_cikarma,/.
WRITE: 'Class-1_1 instances: ' && go_class1_1->zbsaldir_4860_if_cikarma~instance,' ',go_class1_1->zbsaldir_4860_if_toplama~instance,/.
WRITE: 'Class-1_2 toplama sonucu: ' && gv_class1_2_toplama,/.
WRITE: 'Class-1_2 çıkarma sonucu: ' && gv_class1_2_cikarma,/.
WRITE: 'Class-1_2 instances: ' && go_class1_2->zbsaldir_4860_if_cikarma~instance,' ',go_class1_2->zbsaldir_4860_if_toplama~instance,/.
WRITE: 'Class-2 işlem sonucu: ' && gv_changing,/.
