CLASS zcl_01_exec_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_01_EXEC_LGL_C367_CV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Model - View - Controller
    DATA: lv_name TYPE string VALUE 'Juan Lopez',
          lv_role TYPE string VALUE 'ABAP Developer'.

    DATA(lo_model) = NEW zcl_70_emp_model_lgl_c367_cv(
      iv_name = lv_name
      iv_role = lv_role ).

    DATA(lo_view) = NEW zcl_71_emp_view_lgl_c367_cv( ).

    DATA(lo_controller) = NEW zcl_72_emp_controller_c367_cv( ).

    lo_controller->set_model( lo_model ).
    lo_controller->set_view( lo_view ).

    lo_controller->get_view( )->display_employee(
      iv_name = lo_model->get_name( )
      iv_role = lo_model->get_role( )
      io_out  = out ).

**********************************************************************
**Observador
*    DATA(go_processes) = NEW zcl_66_processes_lgl_c367_cv(  ).
*    DATA(go_sales_dep) = NEW zcl_69_sales_dep_lgl_c367_cv(  ).
*    DATA(go_billing_dep) = NEW zcl_68_billing_dep_lgl_c367_cv(  ).
*
*    SET HANDLER go_sales_dep->on_modified_state FOR go_processes.
*    SET HANDLER go_billing_dep->on_modified_state FOR go_processes.
*
**Set new state
*    go_processes->set_state( iv_state = 'NEWSALES01 - Product 12345 - Laptop HP Sold' ).
*
*    out->write( go_processes->get_state(  ) ).
*    out->write( go_sales_dep->state ).
*    out->write( go_billing_dep->state ).
*
*    go_processes->set_state( iv_state = 'NEWSALES02 - Product 67890 - Laptop HP Sold' ).
*
*    out->write( go_processes->get_state(  ) ).
*    out->write( go_sales_dep->state ).
*    out->write( go_billing_dep->state ).

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
