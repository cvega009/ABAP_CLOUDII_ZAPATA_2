CLASS zcl_scalar_functions DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS:
      vat_by_airline FOR SCALAR FUNCTION zsf_01_val_01_c367_cv.

    CLASS-METHODS:
      booking_price_by_country FOR SCALAR FUNCTION zsf_02_book_c367_cv.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_scalar_functions IMPLEMENTATION.
  METHOD vat_by_airline BY DATABASE FUNCTION FOR HDB
                         LANGUAGE SQLSCRIPT
                         OPTIONS READ-ONLY.
    IF pAirline = 'AA' then
        result = 21.00;
    else
        result = 24.00;
    end if;

  endmethod.

  METHOD booking_price_by_country BY DATABASE FUNCTION FOR HDB
                         LANGUAGE SQLSCRIPT
                         OPTIONS READ-ONLY.

    IF pCountryCode = 'US' then result = pBookingPrice * 0.9;
    else
      result = pBookingPrice ;
    end if;

  endmethod.

ENDCLASS.
