*&---------------------------------------------------------------------*
*&  Include           ZYT_DIALOG_SCREEN_TOP
*&---------------------------------------------------------------------*

TABLES: vbak,
        likp,
        vbrk,
        vbap,
        lips,
        vbrp,
        makt,
        t001w, " malzeme tanımı

        zyt_siparis_pool, "custom sipariş tablosu

***STRUCTURES
        zyt_dialog_main_screen,
        zyt_dialog_subscreen_siparis,
        zyt_dialog_subscreen_teslimat,
        zyt_dialog_subscreen_fatura.


***STRUCTURES
DATA: gt_main     TYPE TABLE OF zyt_dialog_main_screen,
      gs_main     TYPE zyt_dialog_main_screen,
      gt_siparis  TYPE TABLE OF zyt_dialog_subscreen_siparis,
      gs_siparis  TYPE zyt_dialog_subscreen_siparis,
      gt_teslimat TYPE TABLE OF zyt_dialog_subscreen_teslimat,
      gs_teslimat TYPE zyt_dialog_subscreen_teslimat,
      gt_fatura   TYPE TABLE OF zyt_dialog_subscreen_fatura,
      gs_fatura   TYPE zyt_dialog_subscreen_fatura.


**************************************************  TABSTRIP
************************************************** sipariş tabstrip1 - vbak, vbap, kna1
TYPES: BEGIN OF gty_vbap,
         kunnr  TYPE kunag,
         charg  TYPE charg_d,
         arktx  TYPE arktx,
         kwmeng TYPE kwmeng,
         name1  TYPE name1_gp,
         vrkme  TYPE vrkme,
       END OF gty_vbap.

DATA: gt_vbap TYPE TABLE OF gty_vbap,
      gs_vbap TYPE gty_vbap.
************************************************** teslimat tabstrip2 - likp, lips, kna1
TYPES: BEGIN OF gty_lips,
         vbeln TYPE vbeln_vl,
         lgort TYPE lgort_d,
         lfimg TYPE lfimg,
         kunnr TYPE kunwe,
         posnr TYPE posnr_vl,
         meins TYPE meins,
         name1 TYPE name1_gp,
       END OF gty_lips.


DATA: gt_lips TYPE TABLE OF gty_lips,
      gs_lips TYPE gty_lips.
************************************************** fatura tabstrip3 - vbrk, vbrp, kna1
TYPES: BEGIN OF gty_vbrp,
         vbeln TYPE vbeln_vf,
         fkimg TYPE fkimg,
         kunrg TYPE kunrg,
         posnr TYPE posnr_vf,
         vrkme TYPE vrkme,
         name1 TYPE name1_gp,
       END OF gty_vbrp.


DATA: gt_vbrp TYPE TABLE OF gty_vbrp,
      gs_vbrp TYPE gty_vbrp.

DATA: gt_siparis_custom TYPE TABLE OF ZYT_SIPARIS_POOL,
      gs_siparis_custom TYPE ZYT_SIPARIS_POOL.

DATA: gv_index(5)       TYPE c,
      gv_index_total(5) TYPE c.

DATA: gv_rad1 TYPE xfeld,
      gv_rad2 TYPE xfeld.

DATA: gv_indexnum(10) TYPE c.

DATA: gv_maktx TYPE makt-maktx.

DATA: gt_makt TYPE TABLE OF makt,
      gs_makt TYPE makt.

DATA: gt_t001w TYPE TABLE OF t001w,
      gs_t001w TYPE t001w.

DATA: gv_cursor TYPE char50.
