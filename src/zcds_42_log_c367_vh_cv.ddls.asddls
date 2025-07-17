@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help Definition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

@ObjectModel.representativeKey: 'Country'
@ObjectModel.dataCategory: #VALUE_HELP

@Search.searchable: true
@Consumption.ranked: true

define view entity ZCDS_42_LOG_C367_VH_CV
  as select from zcds_41_log_c367
{
      @Search.fuzzinessThreshold: 0.8
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key Country,
      CountryThreeLetterISOCode,
      CountryThreeDigitISOCode,
      CountryISOCode,
      IsEuropeanMember,
      /* Associations */
      _Text
}
