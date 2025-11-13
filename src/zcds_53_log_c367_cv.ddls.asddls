@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Scarla Function - Use'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_53_LOG_C367_CV
  as select from /dmo/carrier
{
  key carrier_id                                      as CarrierId,
      name                                            as Name,
      currency_code                                   as CurrencyCode,
      ZSF_01_VAL_01_C367_CV( pAirline => carrier_id ) as VAT
}
