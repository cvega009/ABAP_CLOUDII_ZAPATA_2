@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Proyección–Contrato Transaccional Query'
//@Metadata.ignorePropagatedAnnotations: true

define root view entity ZCDS_28_LOG_C367_CV
  provider contract transactional_query
  as projection on ZCDS_24_LOG_C367_CV
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
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
      _Booking : redirected to composition child ZCDS_29_LOG_C367_CV,
      _Customer
}
