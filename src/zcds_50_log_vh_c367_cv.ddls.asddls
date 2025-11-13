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
@VDM.viewType: #BASIC

define view entity ZCDS_50_LOG_VH_C367_CV
  as select from ZCDS_49_LOG_C367_CV
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key Country,

      @Search.defaultSearchElement: true
      @Semantics.text: true
      @Search.ranking: #LOW
      //      @UI.hidden: true
      //      @Consumption.filter.hidden: true
      _Text[1:Languaje = $session.system_language].CountryName as Description,
      @Search.defaultSearchElement: true
      CountryThreeLetterISOCode,
      @Search.defaultSearchElement: true
      CountryThreeDigitISOCode,
      
      '' as CityElement,

      /* Associations */
      _Text
}
