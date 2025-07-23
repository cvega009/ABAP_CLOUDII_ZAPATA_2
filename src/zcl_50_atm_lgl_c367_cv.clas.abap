CLASS zcl_50_atm_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS withdraw_money IMPORTING iv_card            TYPE string
                                     iv_amount          TYPE i
                                     iv_savings_account TYPE abap_bool OPTIONAL
                           RETURNING VALUE(rv_log)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_50_atm_lgl_c367_cv IMPLEMENTATION.
  METHOD withdraw_money.

    DATA(lo_bank) = NEW zcl_49_bank_lgl_c367_cv( ).

    TRY.
        lo_bank->validate_account(
          EXPORTING
            iv_card            =  iv_card
            iv_amount          = iv_amount
            iv_savings_account = iv_savings_account
          CHANGING
            cv_log             = rv_log
        ).

        rv_log = |{ rv_log }...Withdraw money from the ATM{ cl_abap_char_utilities=>newline }|.
        rv_log = |{ rv_log }...Operation completed successfully{ cl_abap_char_utilities=>newline }|.

      CATCH               zcx_47_expired_cc_lgl_c367_cv INTO DATA(lx_expired_card).
        rv_log = |{ rv_log }...{ lx_expired_card->get_text(  ) }{ cl_abap_char_utilities=>newline }|.

      CATCH BEFORE UNWIND zcx_48_insuffient_lgl_c367_cv INTO DATA(lx_insufficiente_balance).
        rv_log = |{ rv_log }...{ lx_insufficiente_balance->get_text(  ) }{ cl_abap_char_utilities=>newline }|.


        IF lx_insufficiente_balance->is_resumable EQ abap_true.
          "Withdraw money from the savings account
          rv_log = |{ rv_log }...Resume exception{ cl_abap_char_utilities=>newline }|.
          RESUME.
        ELSE.
          "Insufficient balance on the savings account
        ENDIF.

    ENDTRY.

  ENDMETHOD.

ENDCLASS.
