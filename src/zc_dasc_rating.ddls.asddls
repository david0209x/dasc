@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ratings'
@Metadata.allowExtensions: true
define view entity ZC_DASC_Rating as projection on Zi_DASC_Rating
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  /* Associations */
  _Movie: redirected to parent ZC_DASC_Movie

}
