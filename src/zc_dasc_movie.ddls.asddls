@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movies'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZC_DASC_Movie as projection on ZI_DASC_Movie

{
  
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.70 
  Title,
  Genre,
  PublishingYear,
  RuntimeInMin,
  TitleUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  Rating_AVG,
  
  _Rating: redirected to composition child ZC_DASC_Rating
}
