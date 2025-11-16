CLASS zcl_58_singleton_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
 CREATE PRIVATE .

  PUBLIC SECTION.

    DATA: time TYPE timn.

    METHODS: constructor.

    CLASS-METHODS:
      get_instance
        RETURNING VALUE(ro_instance) TYPE REF TO zcl_58_singleton_lgl_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: lo_instance TYPE REF TO zcl_58_singleton_lgl_c367_cv.
ENDCLASS.



CLASS ZCL_58_SINGLETON_LGL_C367_CV IMPLEMENTATION.


  METHOD get_instance.

    IF lo_instance IS NOT BOUND.
      lo_instance = NEW #( ).
    ENDIF.
*Primera y única instancia generada
    ro_instance = lo_instance.

  ENDMETHOD.


  METHOD constructor.
    me->time = cl_abap_context_info=>get_system_time( ).
  ENDMETHOD.
ENDCLASS.
