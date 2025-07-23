CLASS zcl_49_bank_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS validate_account IMPORTING iv_card            TYPE string
                                       iv_amount          TYPE i
                                       iv_savings_account TYPE abap_bool OPTIONAL
                             CHANGING  cv_log             TYPE string
                             RAISING   zcx_47_expired_cc_lgl_c367_cv
                                       RESUMABLE(zcx_48_insuffient_lgl_c367_cv).

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_49_bank_lgl_c367_cv IMPLEMENTATION.
  METHOD validate_account.

    cv_log = |{ cv_log }...Checking card validity { cl_abap_char_utilities=>newline }|.

    IF iv_card EQ '1111 2222 3333 4444'.
      RAISE EXCEPTION TYPE zcx_47_expired_cc_lgl_c367_cv
        EXPORTING
          textid = zcx_47_expired_cc_lgl_c367_cv=>card_expired.
    ENDIF.

    cv_log = |{ cv_log }...Checking account balance { cl_abap_char_utilities=>newline }|.

    IF iv_amount GT 50.

      IF iv_savings_account EQ abap_true.
        cv_log = |{ cv_log }...Resumable exception Insufficient Balance { cl_abap_char_utilities=>newline }|.
        RAISE RESUMABLE EXCEPTION TYPE zcx_48_insuffient_lgl_c367_cv
          EXPORTING
            textid = zcx_48_insuffient_lgl_c367_cv=>insuffient_balance.
      ELSE.
        cv_log = |{ cv_log }...Exception Insufficient Balance { cl_abap_char_utilities=>newline }|.
        RAISE EXCEPTION TYPE zcx_48_insuffient_lgl_c367_cv
          EXPORTING
            textid = zcx_48_insuffient_lgl_c367_cv=>insuffient_balance.
      ENDIF.

    ENDIF.


  ENDMETHOD.

ENDCLASS.
