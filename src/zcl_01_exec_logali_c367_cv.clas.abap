CLASS zcl_01_exec_logali_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_01_exec_logali_c367_cv IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(lo_manage_cntr) = NEW zcl_46_manage_cntr_lgl_c367_cv(  ).
*    DATA lx_auth TYPE REF TO zcx_45_auth_lgl_c367_cv.


    DATA: lv_result TYPE i,
          lv_num1   TYPE i VALUE 10,
          lv_num2   TYPE i.

    TRY.
*        lo_manage_cntr->check_user( sy-uname ).

        TRY.
            lv_result = lv_num1 + lv_num2.
            lv_result = lv_num1 / lv_num2.
            lv_result = lv_num1 - lv_num2.

          CATCH zcx_45_auth_lgl_c367_cv INTO DATA(lx_auth).
            "handle exception
            out->write( lx_auth->get_text(  ) ).

          CATCH cx_a4c_bc_exception.

          CLEANUP.
            out->write( |Cleanup 1...Result:{ lv_result }| ).

        ENDTRY.

      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
        out->write( lx_zerodivide->get_text(  ) ).

        lv_num2 = 2.
        RETRY.
      CLEANUP.
        out->write( |Cleanup 2...Result:{ lv_result }| ).

    ENDTRY.

    out->write( |FINISH: { lv_result }| ).

*-------------------------------------------------------------------
**3.1. Class-relevant Local Types
*    DATA(go_components) = NEW zcl_43_components_lgl_c367_cv(  ).
*    go_components->get_first( IMPORTING ev_first = DATA(gv_first) ).
*
*-------------------------------------------------------------------
**    "2.9. Manejar eventos para todas las instancias de la clase
**    DATA(go_north_building) = NEW zcl_41_building_lgl_cv(  ).
**    DATA(go_south_building) = NEW zcl_41_building_lgl_cv(  ).
**    DATA(go_east_building)  = NEW zcl_41_building_lgl_cv(  ).
**    DATA(go_west_building)  = NEW zcl_41_building_lgl_cv(  ).
**
**    DATA(go_access) = NEW zcl_42_access_lgl_cv(  ).
**
***    SET HANDLER go_access->on_blocked_entrance FOR go_north_building.
***    SET HANDLER go_access->on_blocked_entrance FOR go_south_building.
***    SET HANDLER go_access->on_blocked_entrance FOR go_east_building.
***    SET HANDLER go_access->on_blocked_entrance FOR go_west_building.
**
***    SET HANDLER go_access->on_blocked_entrance FOR ALL INSTANCES.
**
**    go_north_building->entry = 'NORTH'.
**    go_north_building->close_entry(  ).
**
**    go_south_building->entry = 'SOUTH'.
**    go_south_building->close_entry(  ).
**
**    go_east_building->entry = 'EAST'.
**    go_east_building->close_entry(  ).
**
**    go_west_building->entry = 'WEST'.
**    go_west_building->close_entry(  ).
**
**    out->write( zcl_42_access_lgl_cv=>table_blocked_entries ).

  ENDMETHOD.

ENDCLASS.
