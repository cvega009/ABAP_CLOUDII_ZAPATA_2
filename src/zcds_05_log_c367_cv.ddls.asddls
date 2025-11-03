@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agregaciones'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_05_log_c367_cv
  as select from ZCDS_06_log_c367_cv
{
  //  key TravelId                            as TravelID,
  //      AgencyId                            as AgencyID,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  min( TotalPrice )                   as MinTotalPrice,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  max( TotalPrice )                   as MaxTotalPrice,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( TotalPrice )                   as SumTotalPrice,

  count( distinct TotalPrice )        as CountDistTotalPrice,

  count( * )                          as CountAllTotalPrice,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  avg( TotalPrice as abap.dec(16, 2)) as AvgTotalPrice,

  CurrencyCode                        as CurrencyCode

}
group by
//  TravelId,
//  AgencyId,
  CurrencyCode;
