*&---------------------------------------------------------------------*
*&  Include           ZYT_DIALOG_SCREEN_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0101  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
START-OF-SELECTION.

MODULE user_command_0101 INPUT.
  CASE sy-ucomm.

    WHEN '&BACK'.
      SET SCREEN 0.
    WHEN '&ENTER'.

      PERFORM get_material_info.

      LOOP AT gt_makt INTO gs_makt.
        zyt_dialog_main_screen-maktx = gs_makt-maktx .
      ENDLOOP.

      PERFORM get_production_info.

      LOOP AT gt_t001w INTO gs_t001w.
        zyt_dialog_main_screen-name1 = gs_t001w-name1 .
      ENDLOOP.

      PERFORM current.

      PERFORM subscreen1.

      PERFORM subscreen2.

      PERFORM subscreen3.

    WHEN '&TAB1'.
      tab_id-activetab = '&TAB1'.

      PERFORM subscreen1.

    WHEN '&TAB2'.
      tab_id-activetab = '&TAB2'.

      PERFORM subscreen2.

    WHEN '&TAB3'.
      tab_id-activetab = '&TAB3'.

      PERFORM subscreen3.

    WHEN '&NEXT'.

      PERFORM next.

    WHEN '&PREVIOUS'.

      PERFORM previous.

    WHEN '&CURSOR'.

      GET CURSOR FIELD gv_cursor.

      IF gv_cursor EQ 'ZYT_DIALOG_MAIN_SCREEN-VBELN'.

        PERFORM subscreen1.

        PERFORM subscreen2.

        PERFORM subscreen3.

      ENDIF.

    WHEN '&SAVE'.

      PERFORM save.

    WHEN '&CLEAR'.

      PERFORM clear.

    WHEN '&EXIT'.
      SET SCREEN 0.

  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0102  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0102 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0103  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0103 INPUT.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0104  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0104 INPUT.

ENDMODULE.
