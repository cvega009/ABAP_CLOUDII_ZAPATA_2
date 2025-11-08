@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transient View Entity - Analytical Query'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [#ANALYTICAL_QUERY]

define transient view entity ZCDS_32_LOG_C367_CV
  provider contract analytical_query
  as projection on ZCDS_31_LOG_C367_CV
{
          @AnalyticsDetails.query.axis: #FREE
          SoKey                                                          as SalesOrderKey,
          @AnalyticsDetails.query.axis: #ROWS
          LifecycleStatus,

          @AnalyticsDetails.query.axis: #COLUMNS
          QuantitySum,
          UomSum,

          @ObjectModel.text.element: [ 'CurrencyDescription' ]
          CurrencySum,
          _Currency._Text.CurrencyName                                   as CurrencyDescription : localized,

          @Aggregation.default: #FORMULA
          abap.decfloat34'0.05'                                          as Discount,

          @Aggregation.default: #FORMULA
          @Semantics.quantity.unitOfMeasure: 'AmPerQuanUnit'
          curr_to_decfloat_amount( AmountSum ) / $projection.quantitysum as AmountPerQuantity,
          //  AmountSum,

  virtual AmPerQuanUnit  : dd_cds_calculated_unit,

          @Aggregation.default: #FORMULA
          @Semantics.amount.currencyCode: 'TargetCurrency'
          currency_conversion( amount => curr_to_decfloat_amount( AmountSum ),
          source_currency => CurrencySum,
          target_currency => abap.cuky'EUR',
          exchange_rate_date => CreatedOn )                              as ConvertedAmount,

  virtual TargetCurrency : abap.cuky,

          CreatedBy,
          CreatedOn,
          /* Associations */
          _Currency
}
