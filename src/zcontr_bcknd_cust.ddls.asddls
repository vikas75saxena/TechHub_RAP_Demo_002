@EndUserText.label: 'Test Contractor Custom View'
@ObjectModel.query.implementedBy: 'ABAP:ZDEMO_CNTR_BACKEND_SEL'
define custom entity ZCONTR_BCKND_CUST
{
  key contr_key       : sysuuid_x16;
      BusinessPartner : abap.char( 10 );
      FirstName       : abap.char( 40 );
      LastName        : abap.char( 40 );
      HouseNumber     : abap.char( 10 );
      StreetName      : abap.char( 60 );
      CityName        : abap.char( 40 );
      Region          : abap.char( 3 );
      Country         : abap.char( 3 );
      PostalCode      : abap.char( 10 );
      contractor_id       : zcontractor_id;
      vendor_id           : zvendor_id;
      external_id         : zcontractor_id;
      start_date      : /dmo/begin_date;
      end_date        : /dmo/end_date;
      status          : zcontr_status;
      created_by      : syuname;
      created_at      : timestampl;
      last_changed_by : syuname;
      last_changed_at : timestampl;
      CalculatedEtag : abap.string( 0 );
      
}
