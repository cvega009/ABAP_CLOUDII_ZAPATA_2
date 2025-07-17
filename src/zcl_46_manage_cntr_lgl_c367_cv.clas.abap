CLASS zcl_46_manage_cntr_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS check_user IMPORTING iv_user TYPE syuname
                       RAISING   zcx_45_auth_lgl_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_46_manage_cntr_lgl_c367_cv IMPLEMENTATION.

  METHOD check_user.
    IF sy-uname EQ 'CB9980010902'.
      RAISE EXCEPTION TYPE zcx_45_auth_lgl_c367_cv
        EXPORTING
          textid = zcx_45_auth_lgl_c367_cv=>no_auth
*         previous =
          msgv1  = |{ sy-uname }|
          msgv2  = 'Edit Contract'
*         msgv3  =
*         msgv4  =
        .
    ELSE.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
