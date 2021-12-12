# TechHub_RAP_Demo_002
Table ZDEMO_CONTR
@EndUserText.label : 'Contractor Header Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #NOT_ALLOWED
define table zdemo_contr {
  key client          : abap.clnt not null;
  key contr_key       : sysuuid_x16 not null;
  contractor_id       : zcontractor_id;
  vendor_id           : zvendor_id;
  first_name          : zfirst_name;
  last_name           : zlast_name;
  country             : zcountry;
  start_date          : /dmo/begin_date;
  end_date            : /dmo/end_date;
  status              : zcntr_status;
  external_id         : zcontractor_id;
  created_by          : syuname;
  created_at          : timestampl;
  last_changed_by     : syuname;
  last_changed_at     : timestampl;
  loc_last_changed_at : timestampl;

}


Table ZDEMO_ATTEND
@EndUserText.label : 'Contractor attendance data'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zdemo_attend {
  key client         : abap.clnt not null;
  key attendance_key : sysuuid_x16 not null;
  contractor_key     : sysuuid_x16 not null;
  entry_date         : zentry_date;
  time_in            : ztime_in;
  time_out           : ztime_out;
  created_by         : syuname;
  created_at         : timestampl;
  last_changed_by    : syuname;
  last_changed_at    : timestampl;

}
