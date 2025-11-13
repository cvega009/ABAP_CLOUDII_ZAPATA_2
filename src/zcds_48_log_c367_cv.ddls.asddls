@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Searchable'
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
@VDM.viewType: #BASIC

//From the Heard and McDonald Islands

//0.0 - Error
//0.1
//0.2
//0.3
//...
//0.8
//0.9
//1.0 - Exact

define view entity ZCDS_48_LOG_C367_CV
  as select from zcountrt_c367_cv
  association [0..1] to I_Language          as _Languaje on _Languaje.Language = $projection.Languaje
  association [0..1] to ZCDS_49_LOG_C367_CV as _Country  on _Country.Country = $projection.Country

{
      @ObjectModel.foreignKey.association: '_Country'
  key land1   as Country,
      @ObjectModel.foreignKey.association: '_Languaje'
      @Semantics.language: true
  key spras   as Languaje,


      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      @Search.defaultSearchElement: true
      landx50 as CountryName,
      natio   as NationalityName,
      natio50 as NationalityLongName,
      landx   as CountryShortName,

      _Languaje,
      _Country

}
