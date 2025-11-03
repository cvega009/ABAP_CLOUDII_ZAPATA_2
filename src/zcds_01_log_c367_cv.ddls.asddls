@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Core Data Service'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@ObjectModel.semanticKey: [ 'AirlineId', 'ConnectionId', 'FlightDate' ]
define view entity ZCDS_01_log_c367_cv
  as select from /dmo/flight
{
  key carrier_id                                                  as AirlineId,
  key connection_id                                               as ConnectionId,
  key flight_date                                                 as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Price'
      price                                                       as Price,
      currency_code                                               as CurrencyCode,

      'USD'                                                       as CurrencyDocument,
      '20300101'                                                  as DateString,

      cast( '20300101' as abap.dats )                             as DateDate,

      plane_type_id                                               as PlaneTypeId,
      seats_max                                                   as SeatsMax,
      seats_occupied                                              as SeatsOccupied,

      1.2                                                         as FloatingPointElement,

      fltp_to_dec(1.2 as abap.dec( 4, 2 ))                        as DecimalElement,

      cast( cast( 'E' as abap.lang ) as sylangu preserving type ) as LaguajeElement
}
