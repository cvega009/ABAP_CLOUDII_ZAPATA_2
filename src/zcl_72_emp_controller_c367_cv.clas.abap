CLASS zcl_72_emp_controller_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      set_model IMPORTING io_model TYPE REF TO zcl_70_emp_model_lgl_c367_cv,
      get_model RETURNING VALUE(ro_model) TYPE REF TO zcl_70_emp_model_lgl_c367_cv,

      set_view IMPORTING io_view TYPE REF TO zcl_71_emp_view_lgl_c367_cv,
      get_view RETURNING VALUE(ro_view) TYPE REF TO zcl_71_emp_view_lgl_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: model TYPE REF TO zcl_70_emp_model_lgl_c367_cv,
          view  TYPE REF TO zcl_71_emp_view_lgl_c367_cv.

ENDCLASS.



CLASS ZCL_72_EMP_CONTROLLER_C367_CV IMPLEMENTATION.


  METHOD get_model.
    ro_model = me->model.
  ENDMETHOD.


  METHOD set_model.
    me->model = io_model.
  ENDMETHOD.


  METHOD get_view.
    ro_view = me->view.
  ENDMETHOD.


  METHOD set_view.
    me->view = io_view.
  ENDMETHOD.
ENDCLASS.
