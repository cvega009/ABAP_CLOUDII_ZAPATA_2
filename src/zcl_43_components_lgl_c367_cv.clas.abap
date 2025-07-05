CLASS zcl_43_components_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_44_comp_friend_lgl_c367_cv.

  PUBLIC SECTION.

    METHODS:
      get_first EXPORTING ev_first TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: ms_second TYPE ty_first.
    DATA: mo_helper TYPE REF TO lcl_helper.
ENDCLASS.

CLASS zcl_43_components_lgl_c367_cv IMPLEMENTATION.
  METHOD get_first.
    DATA: ls_first TYPE ty_first.
    ev_first = me->ms_second-comp1.

    DATA: mo_helper TYPE REF TO lcl_helper2.
    DATA: ls_second TYPE ty_first.
*    mo_helper->

  ENDMETHOD.
ENDCLASS.
