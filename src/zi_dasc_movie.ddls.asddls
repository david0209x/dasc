@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movies'
define root view entity ZI_DASC_Movie as select from zabap_movie_a
composition [0..*] of Zi_DASC_Rating as _Rating
association to ZC_DASC_Rating_AVG as Rating_AVG on $projection.MovieUuid = Rating_AVG.UUID
{
  key movie_uuid as MovieUuid,
  title as Title,
  genre as Genre,
  publishing_year as PublishingYear,
  runtime_in_min as RuntimeInMin,
  @Semantics.imageUrl: true
  image_url as TitleUrl,
  @Semantics.dateTime: true
  created_at as CreatedAt,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  last_changed_at as LastChangedAt,
  last_changed_by as LastChangedBy,

  
  _Rating,
  Rating_AVG.Rating_AVG
}
