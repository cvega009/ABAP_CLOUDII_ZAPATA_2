@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Scarla Function - Use of Reference'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_54_LOG_C367_CV
  as select from /dmo/booking  as Booking
    inner join   /dmo/customer as Customer on Customer.customer_id = Booking.customer_id
{
  key Booking.travel_id                                            as TravelId,
  key Booking.booking_id                                           as BookingId,
      Booking.booking_date                                         as BookingDate,
      Booking.customer_id                                          as CustomerId,
      Customer.country_code                                        as CountryCode,
      Booking.carrier_id                                           as CarrierId,
      Booking.connection_id                                        as ConnectionId,
      Booking.flight_date                                          as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking.flight_price                                         as FlightPricea,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      ZSF_02_BOOK_C367_CV( pCountryCode => Customer.country_code,
                           pBookingPrice => Booking.flight_price ) as FlightPrice,

      Booking.currency_code                                        as CurrencyCode
}
