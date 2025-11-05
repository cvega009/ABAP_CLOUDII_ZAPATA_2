@EndUserText.label: 'Entidad personalizada - Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_QUERY_PROV_LOG_C367_CV'
define custom entity ZCDS_20_LOG_C367_CV
  // with parameters parameter_name : parameter_type
{
  key travel_id   : /dmo/travel_id;
      agency_id   : /dmo/agency_id;
      customer_id : /dmo/customer_id;

}
