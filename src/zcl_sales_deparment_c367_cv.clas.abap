CLASS zcl_sales_deparment_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA log TYPE string.

    METHODS on_notify_department FOR EVENT product_sold OF zcl_warning_c367_cv IMPORTING ev_client.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sales_deparment_c367_cv IMPLEMENTATION.
  METHOD on_notify_department.
    log = |Product sold to { ev_client }|.
  ENDMETHOD.

ENDCLASS.
