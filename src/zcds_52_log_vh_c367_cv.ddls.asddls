@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH - Use on RAP BO on Projection'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZCDS_52_LOG_VH_C367_CV
  provider contract transactional_query
  as projection on ZCDS_51_LOG_VH_C367_CV
{
  key CustomerId,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,

      @ObjectModel.text.element: [ 'CountryName1' ]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition:
      [{ entity: { name: 'ZCDS_50_LOG_VH_C367_CV',
                   element: 'Country' }

       }]
      CountryCode                as CountryCode1,
      _Country._Text.CountryName as CountryName1 : localized,

      @ObjectModel.text.element: [ 'CountryName2' ]
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition:
      [{ entity: { name: 'ZCDS_50_LOG_VH_C367_CV',
                   element: 'Country' },
                   useForValidation: true,
                   additionalBinding: [{ localElement: 'City' , element: 'CityElement' }]

       }]
      CountryCode                as CountryCode2,
      _Country._Text.CountryName as CountryName2 : localized,
      PhoneNumber,
      EmailAddress,
      /* Associations */
      _Country
}
