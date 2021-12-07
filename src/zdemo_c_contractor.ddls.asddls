@EndUserText.label: 'Contractor Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
  headerInfo: { typeName: 'Contractor', typeNamePlural: 'Contractors', title: { type: #STANDARD, value: 'ContractorID' } } }
@Search.searchable: true
@ObjectModel.semanticKey: ['ContractorId']
define root view entity ZDEMO_C_CONTRACTOR
  provider contract transactional_query
  as projection on ZDEMO_I_CONTRACTOR
{
      @UI.facet: [ { id:              'Contractor',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Contractor',
                     position:        10 },
                     { id:              'Attendance',
                     purpose:         #STANDARD,
                     type:            #LINEITEM_REFERENCE,
                     label:           'Attendance',
                     position:        20 ,
                     targetElement:    '_attendance' } 
                     ]

      @UI.hidden: true
  key ContractorKey,
      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          identification: [ { position: 10, label: 'Contractor ID [1,...,99999999]' } ] }
      @Search.defaultSearchElement: true
      ContractorId,
      @UI: {
      lineItem:       [ { position: 20, importance: #HIGH } ],
      identification: [ { position: 20 } ],
      selectionField: [ { position: 20 } ] }
      VendorId,
      @UI: {
      lineItem:       [ { position: 30, importance: #HIGH } ],
      identification: [ { position: 30 } ],
      selectionField: [ { position: 30 } ] }
       @Search.defaultSearchElement: true
      FirstName,
      @UI: {
      lineItem:       [ { position: 40, importance: #HIGH } ],
      identification: [ { position: 40 } ],
      selectionField: [ { position: 40 } ] }
       @Search.defaultSearchElement: true
      LastName,
      @UI: {
      lineItem:       [ { position: 50, importance: #HIGH } ],
      identification: [ { position: 50 } ],
      selectionField: [ { position: 50 } ] }
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Country', element: 'Country' }}]
      @Search.defaultSearchElement: true
      Country,
      @UI: {
      lineItem:       [ { position: 60, importance: #HIGH } ],
      identification: [ { position: 60 } ],
      selectionField: [ { position: 60 } ] }
      StartDate,
      @UI: {
      lineItem:       [ { position: 70, importance: #HIGH } ],
      identification: [ { position: 70 } ],
      selectionField: [ { position: 70 } ] }
      @Search.defaultSearchElement: true
      EndDate,
      @UI: {
      lineItem:       [ { position: 80, importance: #HIGH } ],
      identification: [ { position: 80 } ],
      selectionField: [ { position: 80 } ] }
      @Search.defaultSearchElement: true
//      @ObjectModel.text.element: ['ZCONTRACTOR_STATUS']
      Status,
      @UI: {
      lineItem:       [ { position: 90, importance: #HIGH } ],
      identification: [ { position: 90 } ],
      selectionField: [ { position: 90 } ] }
      @Search.defaultSearchElement: true
      ExternalId,
      @UI.hidden: true
      CreatedBy,
      @UI.hidden: true
      CreatedAt,
      @UI.hidden: true
      ChangedBy,
      @UI.hidden: true
      ChangedAt,
      /* Associations */
      _attendance : redirected to composition child ZDEMO_C_ATTENDANCE,
      _country
}
