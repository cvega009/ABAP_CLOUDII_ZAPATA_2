CLASS zcl_01_exec_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_01_exec_lgl_c367_cv IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************************************************************
*Observador
    DATA(go_processes) = NEW zcl_66_processes_lgl_c367_cv(  ).
    DATA(go_sales_dep) = NEW zcl_69_sales_dep_lgl_c367_cv(  ).
    DATA(go_billing_dep) = NEW zcl_68_billing_dep_lgl_c367_cv(  ).

    SET HANDLER go_sales_dep->on_modified_state FOR go_processes.
    SET HANDLER go_billing_dep->on_modified_state FOR go_processes.

*Set new state
    go_processes->set_state( iv_state = 'NEWSALES01 - Product 12345 - Laptop HP Sold' ).

    out->write( go_processes->get_state(  ) ).
    out->write( go_sales_dep->state ).
    out->write( go_billing_dep->state ).

    go_processes->set_state( iv_state = 'NEWSALES02 - Product 67890 - Laptop HP Sold' ).

    out->write( go_processes->get_state(  ) ).
    out->write( go_sales_dep->state ).
    out->write( go_billing_dep->state ).

**********************************************************************
** Factory Method
*    DATA: lo_shape   TYPE REF TO zif_11_geometri_lgl_c367_cv,
*          lo_factory TYPE REF TO zcl_62_factory_lgl_c367_cv.
*
*    lo_factory = NEW #( ).
*    lo_shape = lo_factory->get_shape( 'Square' ).
*    out->write( lo_shape->draw_figure( ) ).

*------------------------------------------------------------------------------
    "Singleton
*    DATA: go_singleton_1 TYPE REF TO zcl_58_singleton_lgl_c367_cv,
*          go_singleton_2 TYPE REF TO zcl_58_singleton_lgl_c367_cv.
*
*    go_singleton_1 = zcl_58_singleton_lgl_c367_cv=>get_instance(  ).
*    WAIT UP TO 2 SECONDS.
*    go_singleton_2 = zcl_58_singleton_lgl_c367_cv=>get_instance(  ).
*
*    out->write( go_singleton_1->time ).
*    out->write( go_singleton_2->time ).
*
*    go_singleton_1->time = cl_abap_context_info=>get_system_time(  ).
*    out->write( cl_abap_char_utilities=>newline ).
*
*
*    out->write( go_singleton_1->time ).
*    out->write( go_singleton_2->time ).

  ENDMETHOD.

ENDCLASS.
