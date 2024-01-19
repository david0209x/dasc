@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ratings'
define view entity Zi_DASC_Rating as select from zabap_rating_a 
association to parent ZI_DASC_Movie as _Movie on $projection.MovieUuid = _Movie.MovieUuid
{
  key rating_uuid as RatingUuid,
  movie_uuid as MovieUuid,
  user_name as UserName,
  case when rating>5 then 5 else rating end as Rating,
  @Semantics.dateTime: true
  rating_date as RatingDate,
  _Movie
}
