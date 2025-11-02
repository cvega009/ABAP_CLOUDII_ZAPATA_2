CLASS zcl_67_observer_lgl_c367_cv DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS on_modified_state ABSTRACT
      FOR EVENT modified_state OF zcl_66_processes_lgl_c367_cv
      IMPORTING ev_new_state.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_67_observer_lgl_c367_cv IMPLEMENTATION.
ENDCLASS.
