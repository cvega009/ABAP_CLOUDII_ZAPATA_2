@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Categorías de datos analíticos'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Analytics.dataCategory: #CUBE
define view entity ZCDS_31_LOG_C367_CV
  as select from zso_lgl_c367_cv as SalesOrder

  association [0..1] to ZCDS_30_LOG_C367_CV as _Currency on _Currency.Currency = $projection.CurrencySum

{
  key SalesOrder.so_key           as SoKey,
      SalesOrder.lifecycle_status as LifecycleStatus,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencySum'
      SalesOrder.amount_sum       as AmountSum,

      @ObjectModel.foreignKey.association: '_Currency'
      currency_sum                as CurrencySum,

      @DefaultAggregation: #SUM
      @Semantics.quantity.unitOfMeasure: 'UomSum'
      quantity_sum                as QuantitySum,
      uom_sum                     as UomSum,

      @DefaultAggregation: #NONE
      created_by                  as CreatedBy,
      @DefaultAggregation: #NONE
      created_on                  as CreatedOn,
      _Currency

}
