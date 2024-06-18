*&---------------------------------------------------------------------*
*& Report ZYT_DENEME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYT_DENEME.


DATA: gt_main     TYPE  zyt_dialog_main_screen occurs 0 with header line,
      gs_main     TYPE zyt_dialog_main_screen.

"gt_main-matnr = '123'.

select * from vbap into CORRESPONDING FIELDS OF table gt_main.

LOOP AT gt_main.
write: gt_main-matnr.
ENDLOOP.
