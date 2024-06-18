*&---------------------------------------------------------------------*
*&  Include           ZYT_DIALOG_SCREEN_FRM
*&---------------------------------------------------------------------*

FORM get_main_data.

  SELECT matnr
         vbeln
         werks
         posnr
  FROM vbap
  INTO CORRESPONDING FIELDS OF TABLE gt_main.


ENDFORM.

FORM get_material_info.

  SELECT maktx    "Malzeme tanımı
         FROM makt
         INTO CORRESPONDING FIELDS OF TABLE gt_makt
         WHERE matnr = zyt_dialog_main_screen-matnr.



ENDFORM.

FORM get_production_info.

  SELECT werks    "Malzeme tanımı
         FROM t001w
         INTO CORRESPONDING FIELDS OF TABLE gt_t001w
         WHERE werks = zyt_dialog_main_screen-werks.

ENDFORM.

FORM main_siparis_data.

  SELECT vbeln
         posnr
         werks
         matnr
    FROM vbap
    INTO CORRESPONDING FIELDS OF TABLE gt_main
    WHERE matnr = zyt_dialog_main_screen-matnr
    AND werks = zyt_dialog_main_screen-werks.

IF sy-subrc ne 0.
MESSAGE 'Uygun sipariş bulunamadı!' type 'S' DISPLAY LIKE 'E'.
ENDIF.

  SORT gt_main.

ENDFORM.

FORM subscreen1.
  DATA: lv_kunnr TYPE vbak-kunnr,
        lv_name1 TYPE kna1-name1.

  SELECT charg
         arktx
         kwmeng
         vrkme
      FROM vbap UP TO 1 ROWS
      INTO CORRESPONDING FIELDS OF TABLE gt_vbap
         WHERE vbap~vbeln EQ zyt_dialog_main_screen-vbeln
         AND vbap~posnr EQ zyt_dialog_main_screen-posnr
         AND vbap~werks EQ zyt_dialog_main_screen-werks.

  SELECT SINGLE kunnr FROM vbak
    WHERE vbeln EQ @zyt_dialog_main_screen-vbeln
    INTO @lv_kunnr.

  SELECT SINGLE name1 FROM kna1
    WHERE kunnr EQ @lv_kunnr
    INTO @lv_name1.

  LOOP AT gt_vbap INTO gs_vbap.
    zyt_dialog_subscreen_siparis-kunnr  = lv_kunnr.
    zyt_dialog_subscreen_siparis-name1  = lv_name1.
    zyt_dialog_subscreen_siparis-charg  = gs_vbap-charg.
    zyt_dialog_subscreen_siparis-arktx  = gs_vbap-arktx.
    zyt_dialog_subscreen_siparis-kwmeng = gs_vbap-kwmeng.
    zyt_dialog_subscreen_siparis-vrkme  = gs_vbap-vrkme.
  ENDLOOP.

ENDFORM.

FORM subscreen2.
  DATA: lv_kunnr TYPE likp-kunnr,
        lv_name1 TYPE kna1-name1.

  SELECT vbeln
         lgort
         lfimg
         posnr
         meins
    FROM lips UP TO 1 ROWS
    INTO CORRESPONDING FIELDS OF TABLE gt_lips
           WHERE lips~vbeln EQ zyt_dialog_main_screen-vbeln
           AND lips~posnr EQ zyt_dialog_main_screen-posnr
           AND werks EQ zyt_dialog_main_screen-werks.

  SELECT SINGLE kunnr FROM likp
      WHERE vbeln EQ @zyt_dialog_main_screen-vbeln
      INTO @lv_kunnr.

  SELECT SINGLE name1 FROM kna1
    WHERE kunnr EQ @lv_kunnr
    INTO @lv_name1.



  LOOP AT gt_lips INTO gs_lips.
    zyt_dialog_subscreen_teslimat-vbeln = gs_lips-vbeln.
    zyt_dialog_subscreen_teslimat-lgort = gs_lips-lgort.
    zyt_dialog_subscreen_teslimat-lfimg = gs_lips-lfimg.
    zyt_dialog_subscreen_teslimat-kunnr = lv_kunnr.
    zyt_dialog_subscreen_teslimat-posnr = gs_lips-posnr.
    zyt_dialog_subscreen_teslimat-meins = gs_lips-meins.
    zyt_dialog_subscreen_teslimat-name1 = lv_name1.
  ENDLOOP.



ENDFORM.


FORM subscreen3.
  DATA: lv_kunrg TYPE kunrg,
        lv_kunnr TYPE likp-kunnr,
        lv_name1 TYPE kna1-name1.

  SELECT vbeln
         fkimg
         posnr
         vrkme FROM vbrp UP TO 1 ROWS
    INTO CORRESPONDING FIELDS OF TABLE gt_vbrp
           WHERE vbeln EQ zyt_dialog_main_screen-vbeln
           AND posnr EQ zyt_dialog_main_screen-posnr
           AND werks EQ zyt_dialog_main_screen-werks.

  SELECT SINGLE kunrg FROM vbrk
        WHERE vbeln EQ @zyt_dialog_main_screen-vbeln
        INTO  @lv_kunrg.

  lv_kunnr = lv_kunrg.

  SELECT SINGLE name1 FROM kna1
        WHERE kunnr EQ @lv_kunnr
        INTO @lv_name1.

  LOOP AT gt_vbrp INTO gs_vbrp.
    zyt_dialog_subscreen_fatura-vbeln  = gs_vbrp-vbeln.
    zyt_dialog_subscreen_fatura-fkimg  = gs_vbrp-fkimg.
    zyt_dialog_subscreen_fatura-kunrg  = lv_kunrg.
    zyt_dialog_subscreen_fatura-posnr  = gs_vbrp-posnr.
    zyt_dialog_subscreen_fatura-vrkme  = gs_vbrp-vrkme.
    zyt_dialog_subscreen_fatura-name1  = lv_name1.
  ENDLOOP.

ENDFORM.

FORM next.

  PERFORM main_siparis_data.

  IF gv_index_total = 0.
    LOOP AT gt_main INTO gs_main.
      gv_index_total = gv_index_total + 1.
    ENDLOOP.
  ENDIF.
  IF gv_index < gv_index_total.
    gv_index = gv_index + 1.
    READ TABLE gt_main INTO gs_main INDEX gv_index.
    zyt_dialog_main_screen-vbeln = gs_main-vbeln.
    zyt_dialog_main_screen-posnr = gs_main-posnr.
    zyt_dialog_main_screen-werks = gs_main-werks.
  ENDIF.

  CONCATENATE gv_index gv_index_total INTO gv_indexnum SEPARATED BY '/'.

ENDFORM.

FORM previous.

  PERFORM main_siparis_data.

  IF gv_index_total = 0.
    LOOP AT gt_main INTO gs_main.
      gv_index_total = gv_index_total + 1.
    ENDLOOP.
  ENDIF.

  IF gv_index >= 2.
    gv_index = gv_index - 1.

    READ TABLE gt_main INTO gs_main INDEX gv_index.
    zyt_dialog_main_screen-vbeln = gs_main-vbeln.
    zyt_dialog_main_screen-posnr = gs_main-posnr.
    zyt_dialog_main_screen-werks = gs_main-werks.
  ENDIF.

  CONCATENATE gv_index gv_index_total INTO gv_indexnum SEPARATED BY '/'.

ENDFORM.

Form current.

    PERFORM main_siparis_data.

  IF gv_index_total = 0.
    LOOP AT gt_main INTO gs_main.
      gv_index_total = gv_index_total + 1.
    ENDLOOP.
  ENDIF.

    gv_index = 1.

    READ TABLE gt_main INTO gs_main INDEX gv_index.
    zyt_dialog_main_screen-vbeln = gs_main-vbeln.
    zyt_dialog_main_screen-posnr = gs_main-posnr.
    zyt_dialog_main_screen-werks = gs_main-werks.


  CONCATENATE gv_index gv_index_total INTO gv_indexnum SEPARATED BY '/'.

  endform.

FORM save.


  gs_siparis_custom-matnr  = zyt_dialog_main_screen-matnr.
  gs_siparis_custom-vbeln  = zyt_dialog_main_screen-vbeln.
  gs_siparis_custom-posnr  = zyt_dialog_main_screen-posnr.
  gs_siparis_custom-arktx  = zyt_dialog_subscreen_siparis-arktx.
  gs_siparis_custom-charg  = zyt_dialog_subscreen_siparis-charg.
  gs_siparis_custom-kunnr  = zyt_dialog_subscreen_siparis-kunnr.
  gs_siparis_custom-kwmeng = zyt_dialog_subscreen_siparis-kwmeng.
  gs_siparis_custom-name1  = zyt_dialog_subscreen_siparis-name1.
  gs_siparis_custom-vrkme  = zyt_dialog_subscreen_siparis-vrkme.

  INSERT zyt_siparis_pool FROM gs_siparis_custom. CLEAR gs_siparis_custom.

  MESSAGE 'Kayıt atıldı.' TYPE 'S'.

ENDFORM.

FORM clear.

  CLEAR: zyt_dialog_main_screen-matnr,
         zyt_dialog_main_screen-maktx,
         zyt_dialog_main_screen-name1,
         zyt_dialog_main_screen-posnr,
         zyt_dialog_main_screen-vbeln,
         zyt_dialog_main_screen-werks,

         gv_indexnum,
         gv_index,
         gv_index_total.

*** Tabstrip clear.

  CLEAR: zyt_dialog_subscreen_siparis-arktx,
         zyt_dialog_subscreen_siparis-charg,
         zyt_dialog_subscreen_siparis-kunnr,
         zyt_dialog_subscreen_siparis-kwmeng,
         zyt_dialog_subscreen_siparis-name1,
         zyt_dialog_subscreen_siparis-vrkme,

         zyt_dialog_subscreen_teslimat-kunnr,
         zyt_dialog_subscreen_teslimat-lfimg,
         zyt_dialog_subscreen_teslimat-lgort,
         zyt_dialog_subscreen_teslimat-meins,
         zyt_dialog_subscreen_teslimat-name1,
         zyt_dialog_subscreen_teslimat-posnr,
         zyt_dialog_subscreen_teslimat-vbeln,

         zyt_dialog_subscreen_fatura-fkimg,
         zyt_dialog_subscreen_fatura-kunrg,
         zyt_dialog_subscreen_fatura-name1,
         zyt_dialog_subscreen_fatura-posnr,
         zyt_dialog_subscreen_fatura-vbeln,
         zyt_dialog_subscreen_fatura-vrkme.

ENDFORM.
