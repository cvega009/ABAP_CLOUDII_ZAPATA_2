@AbapCatalog.viewEnhancementCategory: [#NONE]

@AccessControl: { authorizationCheck: #NOT_ALLOWED,
                  auditing.type: #CUSTOM,
                  auditing.specification: 'LGL'
                }

@EndUserText.label: 'Access Control – Auditoría'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_41_LOG_C367_CV
  as select from zusers_c367_cv
{
  key user_id    as UserId,
  key plant      as Plant,
  key invoice_id as InvoiceId,
      first_name as FirstName,
      last_name  as LastName
}
