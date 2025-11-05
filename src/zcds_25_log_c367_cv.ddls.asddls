@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entidad raíz – Define Root Entity II'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_25_LOG_C367_CV
  as select from /dmo/booking

  association        to parent ZCDS_24_LOG_C367_CV as _Travel   on _Travel.TravelId = $projection.TravelId

  association [1..1] to /DMO/I_Customer            as _Customer on _Customer.CustomerID = $projection.CustomerId

{
  key travel_id     as TravelId,
  key booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      _Travel,
      _Customer
}
