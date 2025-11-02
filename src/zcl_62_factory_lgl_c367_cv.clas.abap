CLASS zcl_62_factory_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_shape IMPORTING iv_shape_type        TYPE string
                       RETURNING VALUE(ro_shape_type) TYPE REF TO zif_11_geometri_lgl_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_62_factory_lgl_c367_cv IMPLEMENTATION.
  METHOD get_shape.

    CASE iv_shape_type.
      WHEN 'Circle'.
        ro_shape_type = NEW zcl_59_circle_lgl_c367_cv( ).
      WHEN 'Square'.
        ro_shape_type = NEW zcl_60_square_lgl_c367_cv( ).
      WHEN 'Triangle'.
        ro_shape_type = NEW zcl_61_triangule_lgl_c367_cv( ).
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
