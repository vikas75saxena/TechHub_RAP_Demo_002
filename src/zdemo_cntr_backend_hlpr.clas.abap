CLASS zdemo_cntr_backend_hlpr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS:
   get_client_proxy RETURNING VALUE(ro_client_proxy) TYPE REF TO /iwbep/if_cp_client_proxy
 RAISING Zctnr_bckdn_serv_cons.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zdemo_cntr_backend_hlpr IMPLEMENTATION.
METHOD get_client_proxy.
DATA: lv_url type string,
      ls_textid type scx_t100key.
lv_url = 'https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BUSINESS_PARTNER'.
 TRY.


 DATA(lo_http_client) =
cl_web_http_client_manager=>create_by_http_destination(
cl_http_destination_provider=>create_by_url(
 i_url = lv_url ) ).

 " Error handling
 CATCH cx_http_dest_provider_error INTO DATA(lx_http_dest_provider_error).
 RAISE EXCEPTION TYPE Zctnr_bckdn_serv_cons
 EXPORTING
 textid = ls_textid
 previous = lx_http_dest_provider_error.
 CATCH cx_web_http_client_error INTO DATA(lx_web_http_client_error).
 RAISE EXCEPTION TYPE Zctnr_bckdn_serv_cons
 EXPORTING
 textid = ls_textid
 previous = lx_web_http_client_error.
 ENDTRY.
 TRY.
 ro_client_proxy = cl_web_odata_client_factory=>create_v2_remote_proxy(
 EXPORTING
 iv_service_definition_name = 'ZDEMO_CNTR_BACKEND_BP'
 io_http_client = lo_http_client
 iv_relative_service_root = '/sap/opu/odata/A_BUSINESSPARTNER' ).
 CATCH cx_web_http_client_error INTO lx_web_http_client_error.
 RAISE EXCEPTION TYPE Zctnr_bckdn_serv_cons
 EXPORTING
 textid = ls_textid
 previous = lx_web_http_client_error.
 CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
 RAISE EXCEPTION TYPE Zctnr_bckdn_serv_cons
 EXPORTING
 textid = ls_textid
 previous = lx_gateway.
 ENDTRY.
 ENDMETHOD.
ENDCLASS.
