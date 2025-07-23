CLASS zcx_54_excecution_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS raise_exception_1 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_51_exception1_lgl_c367_cv.

    METHODS raise_exception_2 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_52_exception2_lgl_c367_cv.

    METHODS raise_exception_3 IMPORTING io_previous TYPE REF TO cx_root OPTIONAL
                              RAISING   zcx_53_exception3_lgl_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcx_54_excecution_lgl_c367_cv IMPLEMENTATION.
  METHOD raise_exception_1.
    RAISE EXCEPTION TYPE zcx_51_exception1_lgl_c367_cv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.

  METHOD raise_exception_2.
    RAISE EXCEPTION TYPE zcx_52_exception2_lgl_c367_cv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.

  METHOD raise_exception_3.
    RAISE EXCEPTION TYPE zcx_53_exception3_lgl_c367_cv
      EXPORTING
        previous = io_previous.
  ENDMETHOD.

ENDCLASS.
