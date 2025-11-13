@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Aspecto de usuario'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_44_LOG_C367_CV
  with parameters
    pPlant : abap.char(4)
  as select from zinvoice_c367_cv
{
  key plant        as Plant,
  key invoice_id   as InvoiceId,
      created_by   as CreatedBy,
      customer     as Customer,
      @Semantics.amount.currencyCode: 'CurrencyKey'
      amount       as Amount,
      currency_key as CurrencyKey
}
