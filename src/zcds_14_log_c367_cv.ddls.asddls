@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones con parametros'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}


define view entity ZCDS_14_LOG_C367_CV
  with parameters
    pCountryCode : land1

  as select from /dmo/travel as Travel

  association [1..1] to ZCDS_13_LOG_C367_CV as _Agency on _Agency.AgencyId = $projection.AgencyId

{
  key travel_id                                                                  as TravelId,
      Travel.agency_id                                                           as AgencyId,
      _Agency( pCountryCode: 'US' ).Name                                         as AgencyName2,
      _Agency( pCountryCode: $parameters.pCountryCode )[City = 'Stuttgart'].Name as AgencyName
}
