CLASS zdemo_cntr_backend_sel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdemo_cntr_backend_sel IMPLEMENTATION.
 METHOD if_rap_query_provider~select.

 TRY.
data(lo_client_proxy) = zdemo_cntr_backend_hlpr=>get_client_proxy(  ).
 catch Zctnr_bckdn_serv_cons into data(oref).
 endtry.
 TRY.
 DATA(lo_read_request) = lo_client_proxy->create_resource_for_entity_set( 'A_BUSINESSPARTNER' )->create_request_for_read( ).
 """Request Count
 IF io_request->is_total_numb_of_rec_requested( ).
 lo_read_request->request_count( ).
 ENDIF.
 """Request Data
 IF io_request->is_data_requested( ).
 """Request Paging
 DATA(ls_paging) = io_request->get_paging( ).
 IF ls_paging->get_offset( ) >= 0.
 lo_read_request->set_skip( ls_paging->get_offset( ) ).
 ENDIF.
 IF ls_paging->get_page_size( ) <>
if_rap_query_paging=>page_size_unlimited.
 lo_read_request->set_top( ls_paging->get_page_size( ) ).
 ENDIF.
 ENDIF.
 """Execute the Request
 DATA(lo_response) = lo_read_request->execute( ).
 """Set Count
 IF io_request->is_total_numb_of_rec_requested( ).
 io_response->set_total_number_of_records( lo_response->get_count( ) ).
 ENDIF.
 IF io_request->is_data_requested( ).
 data: lt_contr_full type standard table of zcontr_bcknd_cust,
       lt_contr_locl type standard table of zcontr_bcknd,
       lt_remote_bp type standard table of ZA_BUSINESSPARTNER23DEDC3B0C,
       lt_remote_bpid type standard table of ZA_BUSINESSPARTNERADCB7D7BB07C,
       lt_remote_bpaddr type standard table of ZA_BUPAIDENTIFICATION.
       lo_response->get_business_data( IMPORTING et_business_data =
lt_remote_bp ).
        io_response->set_data( lt_contr_full ).
 ENDIF.
CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
ENDTRY.
 ENDMETHOD.
ENDCLASS.
