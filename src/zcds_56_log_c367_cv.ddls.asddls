@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_56_LOG_C367_CV
  as select from /dmo/booking
{
  key travel_id                    as TravelId,
  key booking_id                   as BookingId,
      booking_date                 as BookingDate,
      customer_id                  as CustomerId,
      carrier_id                   as CarrierId,
      connection_id                as ConnectionId,
      flight_date                  as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price                 as FlightPrice,

      @EndUserText.label: 'Price with Discount'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_C367_CV'
      cast( 0 as abap.curr(16,2) ) as DiscountedPrice,
      currency_code                as CurrencyCode
}
