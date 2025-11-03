@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Conversión de importes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_07_log_c367_cv
  with parameters
    pFromCurrency : abap.cuky,
    pToCurrency   : abap.cuky
    
//    @Environment.systemField: #SYSTEM_DATE
//    pDocumentData : abap.dats

  as select from /dmo/travel
{
  key travel_id                                               as TravelID,

      @Semantics.amount.currencyCode: 'OriginalCurrency'
      total_price                                             as OriginalPrice,
      currency_code                                           as OriginalCurrency,

      @Semantics.amount.currencyCode: 'CovertedCurrency'
      currency_conversion( amount => total_price,
                           source_currency => currency_code,
                           target_currency => cast( 'USD' as abap.cuky ), --abap.cuky'USD'
                           exchange_rate_date => begin_date,
                           client => $session.client,
                           error_handling => 'SET_TO_NULL'  ) as CovertedPrice1,

      @Semantics.amount.currencyCode: 'CovertedCurrency'
      currency_conversion( amount => total_price,
                           source_currency => $parameters.pFromCurrency,
                           target_currency => $parameters.pToCurrency,
                           exchange_rate_date => begin_date,
                           client => $session.client,
                           error_handling => 'SET_TO_NULL'  ) as CovertedPrice2,

      $parameters.pToCurrency                                 as CovertedCurrency
}
where
  currency_code = $parameters.pFromCurrency
