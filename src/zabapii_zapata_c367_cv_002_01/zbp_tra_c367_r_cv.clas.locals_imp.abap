CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF travel_status,
        open     TYPE c LENGTH 1 VALUE 'O', " Open
        accepted TYPE c LENGTH 1 VALUE 'A', " Accepted
        rejected TYPE c LENGTH 1 VALUE 'X', " Rejeted
      END OF travel_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Travel RESULT result.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel RESULT result.

    METHODS deductDiscount FOR MODIFY
      IMPORTING keys FOR ACTION Travel~deductDiscount RESULT result.

    METHODS reCalcTotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION Travel~reCalcTotalPrice.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel RESULT result.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~calculateTotalPrice.

    METHODS setStatusToOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Travel~setStatusToOpen.

    METHODS setTravelNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Travel~setTravelNumber.

    METHODS validateAgency FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateAgency.

    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCustomer.

    METHODS validateDateRange FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateDateRange.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD acceptTravel.

*  EML - Entity -Manipulation Language
    MODIFY ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
    ENTITY Travel
    UPDATE
    FIELDS ( OverallStatus )
    WITH VALUE #( FOR key IN keys ( %tky          = key-%tky
                                    OverallStatus = travel_status-accepted  ) ).

    READ ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
    ENTITY Travel
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels ( %tky   = travel-%tky
                                              %param = travel ) ).

  ENDMETHOD.

  METHOD deductDiscount.

    DATA travels_for_update TYPE TABLE FOR UPDATE ztra_c367_r_cv.

*    DATA(keys_valid_discount) = keys.
*
*    LOOP AT keys_valid_discount ASSIGNING FIELD-SYMBOL(<key_valid_discount>)
*         WHERE %param-discount_percent IS INITIAL
*            OR %param-discount_percent > 100
*            OR %param-discount_percent <= 0.
*
*      APPEND VALUE #( %tky = <key_valid_discount>-%tky ) TO failed-travel.
*
*      APPEND VALUE #( %tky = <key_valid_discount>-%tky
*                      %msg = NEW /dmo/cm_flight_messages( textid = /dmo/cm_flight_messages=>discount_invalid
*                                                          severity = if_abap_behv_message=>severity-error )
*                      %op-%action-deductDiscount = if_abap_behv=>mk-on ) TO reported-travel.
*
*      DATA(lv_error) = abap_true.
*
*    ENDLOOP.
*
*    CHECK lv_error NE abap_true.

    READ ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
           ENTITY Travel
           FIELDS ( BookingFee )
           WITH CORRESPONDING #( keys )
           RESULT DATA(travels).

    DATA percentage TYPE decfloat16.

    LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).

      DATA(discount_percentage) = keys[ KEY id %tky = <travel>-%tky ]-%param-discount_percent.
      percentage = discount_percentage / 100.
      DATA(reduced_fee) = <travel>-BookingFee * ( 1 - percentage ).

      APPEND VALUE #( %tky       = <travel>-%tky
                      BookingFee = reduced_fee ) TO travels_for_update.

    ENDLOOP.

    MODIFY ENTITIES OF ztra_c367_r_cv  IN LOCAL MODE
           ENTITY Travel
           UPDATE
           FIELDS ( BookingFee )
           WITH travels_for_update.

    READ ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
          ENTITY Travel
          ALL FIELDS
          WITH CORRESPONDING #( keys )
          RESULT DATA(travels_with_dicount).

    result = VALUE #( FOR travel IN travels_with_dicount ( %tky   = travel-%tky
                                                           %param = travel ) ).

  ENDMETHOD.

  METHOD reCalcTotalPrice.
  ENDMETHOD.

  METHOD rejectTravel.
*  EML - Entity -Manipulation Language
    MODIFY ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
    ENTITY Travel
    UPDATE
    FIELDS ( OverallStatus )
    WITH VALUE #( FOR key IN keys ( %tky          = key-%tky
                                    OverallStatus = travel_status-rejected  ) ).

    READ ENTITIES OF ztra_c367_r_cv IN LOCAL MODE
    ENTITY Travel
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(travels).

    result = VALUE #( FOR travel IN travels ( %tky   = travel-%tky
                                              %param = travel ) ).
  ENDMETHOD.

  METHOD calculateTotalPrice.
  ENDMETHOD.

  METHOD setStatusToOpen.
  ENDMETHOD.

  METHOD setTravelNumber.
  ENDMETHOD.

  METHOD validateAgency.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateDateRange.
  ENDMETHOD.

ENDCLASS.
