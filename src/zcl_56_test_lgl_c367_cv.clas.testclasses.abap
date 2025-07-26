*"* use this source file for your ABAP unit test classes
CLASS ltcl_business_process DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      factorial_local_test FOR TESTING RAISING cx_static_check.

    "Se llama una vez por ciclo de todas las unidades de test que va a tener la clase
    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    "Se llama antes y después de cada unidad de test
    METHODS setup. "Podemos instanciar los objetos que necesitamos
    METHODS teardown. "Podemos limpiar y dejar de usar esas instancias.

    DATA mo_cut TYPE REF TO zcl_55_business_pr_lgl_c367_cv. "CUT --> Class Under TEST

ENDCLASS.


CLASS ltcl_business_process IMPLEMENTATION.

  METHOD factorial_local_test.

    "Given
    DATA(lv_number_ut) = 4.
    DATA lv_factorial_ut TYPE i.

    "When
    mo_cut->get_factorial(
      EXPORTING
        iv_number    = lv_number_ut
      IMPORTING
        ev_factorial = lv_factorial_ut ).


    "Then
    IF  cl_abap_unit_assert=>assert_equals(
        EXPORTING
          act                  = lv_factorial_ut "Esto es lo que tenemos
          exp                  = 24 "Esto es lo que esperabamos, si no coincide -> error
      ) EQ abap_true.

      cl_abap_unit_assert=>fail( 'Factorial process failed' ).

    ENDIF.

  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    me->mo_cut = NEW zcl_55_business_pr_lgl_c367_cv( ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR  mo_cut.
  ENDMETHOD.

ENDCLASS.
