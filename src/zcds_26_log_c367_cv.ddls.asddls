@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección – Contrato Transaccional Interfaz'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_26_LOG_C367_CV
  provider contract transactional_interface
  as projection on ZCDS_24_LOG_C367_CV
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZCDS_27_LOG_C367_CV,
      _Customer
}
