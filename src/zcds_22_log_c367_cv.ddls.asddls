@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS para modelo Jerárquico'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_22_LOG_C367_CV
  as select from zemploy_c367_cv

  //association [0..1] to ZCDS_22_LOG_C367_CV  as _Manager on _Manager.employee = $projection.Manager
  association [0..1] to ZCDS_22_LOG_C367_CV as _Manager on _Manager.Employee = $projection.Manager
{
  key employee as Employee,
      manager  as Manager,
      name     as Name,
      _Manager
}
