CLASS zcl_69_sales_dep_lgl_c367_cv DEFINITION INHERITING FROM zcl_67_observer_lgl_c367_cv
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA state TYPE string.
    METHODS: on_modified_state REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_69_sales_dep_lgl_c367_cv IMPLEMENTATION.
  METHOD on_modified_state.
    me->state = ev_new_state.
  ENDMETHOD.

ENDCLASS.
