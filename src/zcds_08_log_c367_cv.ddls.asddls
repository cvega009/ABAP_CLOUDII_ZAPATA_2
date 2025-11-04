@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categoría de texto'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

--Cantidad de resultados
@ObjectModel.resultSet.sizeCategory: #XS

define view entity ZCDS_08_log_c367_cv
  as select from /dmo/oall_stat_t
{
      @ObjectModel.text.element: [ 'Text' ]
  key overall_status as OverallStatus,
      @Semantics.language: true
  key language       as Language,
      @Semantics.text: true
      text           as Text
}
