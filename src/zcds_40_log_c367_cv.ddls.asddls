@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Text'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'Country'
@ObjectModel.supportedCapabilities: [ #SQL_DATA_SOURCE,
                                      #CDS_MODELING_DATA_SOURCE,
                                      #CDS_MODELING_ASSOCIATION_TARGET,
                                      #LANGUAGE_DEPENDENT_TEXT ]

@Search.searchable: true

define view entity ZCDS_40_LOG_C367_CV
  as select from zcountry_t_lgl

  association [0..1] to I_Language       as _Languaje on _Languaje.Language = $projection.Languaje
  association [0..1] to zcds_41_log_c367 as _Country  on _Country.Country = $projection.Country

{
      @ObjectModel.foreignKey.association: '_Country'
  key land1   as Country,
      @ObjectModel.foreignKey.association: '_Languaje'
      @Semantics.language: true
  key spras   as Languaje,

      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Search.defaultSearchElement: true
      @Semantics.text: true
      landx50 as CountryName,

      landx   as CountryShortName,
      natio   as NationalityName,
      natio50 as NationalityLongName,


      _Languaje,
      _Country

}
