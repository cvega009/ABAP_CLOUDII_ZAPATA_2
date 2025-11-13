@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Virtual Element - Projection Root Entity'
//@Metadata.ignorePropagatedAnnotations: true

define root view entity ZCDS_58_LOG_C367_CV
  provider contract transactional_query
  as projection on ZCDS_57_LOG_C367_CV
{
  key     TravelId,
  key     BookingId,
          BookingDate,
          CustomerId,
          CarrierId,
          ConnectionId,
          FlightDate,
          FlightPrice,
          @EndUserText.label: 'Price with Discount'
          @Semantics.amount.currencyCode: 'CurrencyCode'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VIRTUAL_C367_CV'
  virtual DiscountedPrice : abap.curr( 16, 2 ),
          CurrencyCode
}
