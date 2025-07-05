CLASS zcl_44_comp_friend_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_44_comp_friend_lgl_c367_cv IMPLEMENTATION.
  METHOD get_helper.
    "La clase que recibe la amistad tiene acceso a los componentes definidos
    DATA(lo_components) = NEW zcl_43_components_lgl_c367_cv(  ).
    CLEAR: lo_components->mo_helper->ms_first_cl.
    DATA(ls_first) = lo_components->mo_helper->get_first(  ).

  ENDMETHOD.

ENDCLASS.
