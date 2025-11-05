@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección – Contrato Transaccional Query - Hija'
//@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_29_LOG_C367_CV
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
      _Travel : redirected to parent ZCDS_28_LOG_C367_CV
}
