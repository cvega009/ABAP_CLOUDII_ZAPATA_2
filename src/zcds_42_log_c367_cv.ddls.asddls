@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Invoices'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_42_LOG_C367_CV
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
