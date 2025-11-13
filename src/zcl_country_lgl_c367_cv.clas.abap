CLASS zcl_country_lgl_c367_cv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_country_lgl_c367_cv IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcountry_c367_cv.

    MODIFY zcountry_c367_cv FROM (

    SELECT Country                   AS land1,
           CountryThreeLetterISOCode AS intca3,
           CountryThreeDigitISOCode  AS intcn3,
           CountryISOCode            AS intca,
           IsEuropeanUnionMember     AS xegld
           FROM I_Country
    ).

    out->write( |Countries...{ sy-dbcnt } rows inserted.| ).

    DELETE FROM zcountrt_c367_cv.

    MODIFY zcountrt_c367_cv FROM (
      SELECT Language AS spras,
             Country AS land1,
             CountryShortName AS landx,
             NationalityName AS natio,
             NationalityLongName AS natio50,
             CountryName AS landx50
             FROM I_CountryText
      ).

    out->write( |Text...{ sy-dbcnt } rows inserted.| ).

  ENDMETHOD.

ENDCLASS.
