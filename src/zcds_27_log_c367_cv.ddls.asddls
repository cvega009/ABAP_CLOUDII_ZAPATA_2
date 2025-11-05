@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección – Child Interface'
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_27_LOG_C367_CV
  as projection on ZCDS_25_LOG_C367_CV
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      /* Associations */
      _Customer,
      _Travel : redirected to parent ZCDS_26_LOG_C367_CV
}
