CLASS zcl_warning_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS product_sold EXPORTING VALUE(ev_client) TYPE string.
    METHODS notify_department RETURNING VALUE(rv_log) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_warning_c367_cv IMPLEMENTATION.
  METHOD notify_department.
    RAISE EVENT product_sold EXPORTING ev_client = 'Anonymous client'.
    rv_log = 'Event raised'.
  ENDMETHOD.

ENDCLASS.
