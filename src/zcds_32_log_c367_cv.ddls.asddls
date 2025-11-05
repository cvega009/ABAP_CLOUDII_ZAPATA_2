@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transient View Entity - Analytical Query'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]

define transient view entity ZCDS_32_LOG_C367_CV
  provider contract analytical_query
  as projection on ZCDS_31_LOG_C367_CV
{
  @AnalyticsDetails.query.axis: #FREE
  SoKey as  SalesOrderKey,
  @AnalyticsDetails.query.axis: #ROWS
  LifecycleStatus,
  
  @AnalyticsDetails.query.axis: #COLUMNS
  QuantitySum,
  UomSum,

//@ObjectModel.text.element: [ 'CurrencyDescription' ]
  CurrencySum,
//  _Currency._Text.CurrencyName as CurrencyDescription,
  
  @Aggregation.default: #FORMULA
  abap.decfloat34'0.05' as Discount,
  
//    @Aggregation.default: #FORMULA
//    curr_to_decfloat_amount( AmountSum ) / $projection.QuantitySum as AmountPerQuantity,
  
  AmountSum,

  
  CreatedBy,
  CreatedOn,
  /* Associations */
  _Currency
}
