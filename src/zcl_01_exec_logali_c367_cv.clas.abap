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
***-----------------------------------------------------------------------------------
***-----------------------------------------------------------------------------------

    DATA: gv_resultado TYPE i,
          gx_exception TYPE REF TO cx_root.

    TRY.
        gv_resultado = 8 / 0.
      CATCH cx_sy_zerodivide INTO gx_exception.
        out->write( 'Exception handled').
*        RETRY.
    ENDTRY.


***-----------------------------------------------------------------------------------
***-----------------------------------------------------------------------------------
*    DATA(lo_cut) = NEW zcl_57_test_inj_lgl_c367_cv(  ).
*    lo_cut->get_customer( IMPORTING es_customer = DATA(ls_customer) ).
*    out->write( |{ ls_customer-customer_id }-{ ls_customer-country_code }| ).

***-----------------------------------------------------------------------------------
***-----------------------------------------------------------------------------------
**    DATA(lo_business_pr) = NEW zcl_55_business_pr_lgl_c367_cv(  ).
**
**    lo_business_pr->get_factorial( EXPORTING iv_number     = 4
**                                   IMPORTING  ev_factorial = DATA(lv_factorial)  ).
**
**    out->write( lv_factorial ).
**
***-----------------------------------------------------------------------------------
***-----------------------------------------------------------------------------------
*    DATA(lo_execution) = NEW zcx_54_excecution_lgl_c367_cv(  ).
*    TRY.
*        TRY.
*            TRY.
*                lo_execution->raise_exception_1(  ).
*
*              CATCH zcx_51_exception1_lgl_c367_cv INTO DATA(lx_exception1).
*                lo_execution->raise_exception_2( io_previous = lx_exception1 ).
*
*            ENDTRY.
*
*          CATCH zcx_52_exception2_lgl_c367_cv INTO DATA(lx_exception2).
*            lo_execution->raise_exception_3( io_previous = lx_exception2 ).
*        ENDTRY.
*
*      CATCH zcx_53_exception3_lgl_c367_cv INTO DATA(lx_exception3).
*
*        out->write( |{ lx_exception3->get_text(  ) }{ cl_abap_char_utilities=>newline }| ).
*
*        IF lx_exception3->previous IS BOUND.
*          out->write( |{ lx_exception3->previous->get_text( ) }\n| ).
*        ENDIF.
*
*        IF lx_exception3->previous->previous IS BOUND.
*          out->write( |{ lx_exception3->previous->previous->get_text( ) }\n| ).
*
*        ENDIF.
*
*        IF lx_exception3->previous->previous->previous IS BOUND.
*          out->write( |{ lx_exception3->previous->previous->previous->get_text( ) }\n| ).
*        ENDIF.
*
*    ENDTRY.
*
***-----------------------------------------------------------------------------------
***-----------------------------------------------------------------------------------
**    DATA(lo_atm) = NEW zcl_50_atm_lgl_c367_cv( ).
***-----------------------------------------------------------------------------------
***1. Expired Credit Card
**    out->write( 'Use Case: 1. Expired Credit Card').
**
**    out->write( lo_atm->withdraw_money(
**                  iv_card            = '1111 2222 3333 4444'
**                  iv_amount          = 30
***                  iv_savings_account =
**                ) ).
**
***-----------------------------------------------------------------------------------
***2. Insufficient balance in the current account
**    out->write( 'Use Case: 2. Insufficient balance in the current account').
**
**    out->write( lo_atm->withdraw_money(
**                  iv_card            = '1111 2222 3333 5555'
**                  iv_amount          = 100
***                  iv_savings_account =
**                ) ).
**
***-----------------------------------------------------------------------------------
***3. Withdraw money from the savings account
**    out->write( 'Use Case: 3. Withdraw money from the savings account').
**    out->write( lo_atm->withdraw_money(
**                  iv_card            = '1111 2222 3333 5555'
**                  iv_amount          = 100
**                  iv_savings_account = abap_true
**                ) ).
***-------------------------------------------------------------------
***-------------------------------------------------------------------
**    DATA(lo_manage_cntr) = NEW zcl_46_manage_cntr_lgl_c367_cv(  ).
***    DATA lx_auth TYPE REF TO zcx_45_auth_lgl_c367_cv.
**
**
**    DATA: lv_result TYPE i,
**          lv_num1   TYPE i VALUE 10,
**          lv_num2   TYPE i.
**
**    TRY.
***        lo_manage_cntr->check_user( sy-uname ).
**
**        TRY.
**            lv_result = lv_num1 + lv_num2.
**            lv_result = lv_num1 / lv_num2.
**            lv_result = lv_num1 - lv_num2.
**
**          CATCH zcx_45_auth_lgl_c367_cv INTO DATA(lx_auth).
**            "handle exception
**            out->write( lx_auth->get_text(  ) ).
**
**          CATCH cx_a4c_bc_exception.
**
**          CLEANUP.
**            out->write( |Cleanup 1...Result:{ lv_result }| ).
**
**        ENDTRY.
**
**      CATCH cx_sy_zerodivide INTO DATA(lx_zerodivide).
**        out->write( lx_zerodivide->get_text(  ) ).
**
**        lv_num2 = 2.
**        RETRY.
**      CLEANUP.
**        out->write( |Cleanup 2...Result:{ lv_result }| ).
**
**    ENDTRY.
**
**    out->write( |FINISH: { lv_result }| ).

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
