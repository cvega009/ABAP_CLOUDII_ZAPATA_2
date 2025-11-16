CLASS zcl_invoice_gen_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INVOICE_GEN_LGL_C367_CV IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( cl_abap_context_info=>get_user_technical_name(  )  ).

    DELETE FROM: zusers_c367_cv, zinvoice_c367_cv.

    MODIFY zusers_c367_cv FROM TABLE @( VALUE #(
                                                 ( user_id = cl_abap_context_info=>get_user_technical_name(  )
                                                   plant   = '1010'
                                                   invoice_id = '1'
                                                   first_name = 'First Name 1'
                                                   last_name  = 'Last Name 1' )
                                                 ( user_id = cl_abap_context_info=>get_user_technical_name(  )
                                                   invoice_id = '2'
                                                   first_name = 'First Name 2'
                                                   last_name  = 'Last Name 2' )
                                                 ( user_id = 'CB9980002003'
                                                   invoice_id = '3'
                                                   first_name = 'First Name 3'
                                                   last_name  = 'Last Name 3' )
                                                 ( user_id = 'CB9980002004'
                                                   invoice_id = '4'
                                                   first_name = 'First Name 4'
                                                   last_name  = 'Last Name 4' )
                                                 ( user_id = 'CB9980002005'
                                                   invoice_id = '5'
                                                   first_name = 'First Name 5'
                                                   last_name  = 'Last Name 5' )
                                                  ) ).


    MODIFY zinvoice_c367_cv FROM TABLE @( VALUE #(
                                                 ( invoice_id = '1'
                                                   plant   = '1010'
                                                   created_by = cl_abap_context_info=>get_user_technical_name(  )
                                                   customer = 'Coca-Cola'
                                                   amount = '2000'
                                                   currency_key = 'USD'
                                                    )
                                                 ( invoice_id = '2'
                                                 plant   = '1020'
                                                   created_by = cl_abap_context_info=>get_user_technical_name(  )
                                                   customer = 'Pepsi'
                                                   amount = '3000'
                                                   currency_key = 'USD'
                                                    )
                                                 ( invoice_id = '3'
                                                 plant   = '1030'
                                                   created_by = 'CB9980002003'
                                                   customer = 'Nestle'
                                                   amount = '5000'
                                                   currency_key = 'USD'
                                                    )
                                                 ( invoice_id = '4'
                                                 plant   = '1050'
                                                   created_by = 'CB9980002004'
                                                   customer = 'Pringles'
                                                   amount = '1000'
                                                   currency_key = 'USD'
                                                    )
                                                 ( invoice_id = '5'
                                                 plant   = '1020'
                                                   created_by = 'CB9980002005'
                                                   customer = 'Milka'
                                                   amount = '2000'
                                                   currency_key = 'EUR'
                                                    )
                                                  ) ).

  ENDMETHOD.
ENDCLASS.
