CLASS zcl_virtual_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_virtual_c367_cv IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    CASE iv_entity.
      WHEN 'ZCDS_56_LOG_C367_CV' OR 'ZCDS_58_LOG_C367_CV'.

        LOOP AT it_requested_calc_elements INTO DATA(ls_req_cal_elem).

          IF ls_req_cal_elem = 'DISCOUNTEDPRICE'.
            APPEND 'FLIGHTPRICE' TO et_requested_orig_elements.
          ENDIF.

        ENDLOOP.

    ENDCASE.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA: lt_original_data TYPE STANDARD TABLE OF zcds_56_log_c367_cv WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_original_data>).
      <fs_original_data>-DiscountedPrice = <fs_original_data>-FlightPrice -
                                           ( <fs_original_data>-FlightPrice * ( 1 / 10 ) ).
    ENDLOOP.


    ct_calculated_data = CORRESPONDING #( lt_original_data ).

  ENDMETHOD.

ENDCLASS.
