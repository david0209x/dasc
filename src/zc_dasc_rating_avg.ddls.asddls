@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating AVG'

define view entity ZC_DASC_Rating_AVG as select from Zi_DASC_Rating
{
  key MovieUuid as UUID,
  avg(Rating as abap.dec(16,0)) as Rating_AVG
}
group by
  MovieUuid
