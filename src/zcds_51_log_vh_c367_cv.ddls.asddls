@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH - Use on RAP BO'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZCDS_51_LOG_VH_C367_CV
  as select from /dmo/customer
  association [1..1] to ZCDS_49_LOG_C367_CV as _Country on _Country.Country = $projection.CountryCode

{
  key customer_id   as CustomerId,
      first_name    as FirstName,
      last_name     as LastName,
      title         as Title,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress,
      _Country
}
