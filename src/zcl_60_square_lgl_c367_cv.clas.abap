CLASS zcl_60_square_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zif_11_geometri_lgl_c367_cv.

    ALIASES draw_shape FOR zif_11_geometri_lgl_c367_cv~draw_figure.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_60_square_lgl_c367_cv IMPLEMENTATION.
  METHOD draw_shape.
    rv_shape = 'Square'.
  ENDMETHOD.
ENDCLASS.
