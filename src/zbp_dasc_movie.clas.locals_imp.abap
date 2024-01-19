CLASS lhc_zi_dasc_rating DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS DeterminUserName FOR DETERMINE ON SAVE
      IMPORTING keys FOR Zi_DASC_Rating~DeterminUserName.

ENDCLASS.

CLASS lhc_zi_dasc_rating IMPLEMENTATION.

  METHOD DeterminUserName.

  MODIFY entity in local mode ZI_DASC_RATING
  Update Fields ( UserName )
  WITH VALUE #( for key in keys ( %tky = key-%tky username = sy-uname ) ).

  ENDMETHOD.

ENDCLASS.

*********************************************************************************************************
"neue Klasse
*********************************************************************************************************
CLASS lhc_zi_dasc_movie DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PUBLIC SECTION.

  PRIVATE SECTION.

    METHODS validategenre FOR VALIDATE ON SAVE IMPORTING keys FOR ZI_DASC_Movie~validategenre.
    METHODS rateMovie FOR MODIFY IMPORTING keys FOR ACTION ZI_DASC_Movie~rateMovie.

ENDCLASS.

CLASS lhc_zi_dasc_movie IMPLEMENTATION.
  METHOD validategenre.
    READ ENTITY IN LOCAL MODE ZI_DASC_Movie FIELDS ( Title Genre ) WITH CORRESPONDING #( keys ) RESULT DATA(Movies).

    LOOP AT Movies INTO DATA(Movie).
      SELECT SINGLE
        FROM ddcds_customer_domain_value( p_domain_name = 'ZABAP_GENRE' )
        FIELDS value_low
        WHERE value_low = @movie-Genre
        " TODO: variable is assigned but never used (ABAP cleaner)
        INTO @DATA(dummy).

      IF sy-subrc <> 0.
        data(message) = new ZCM_DASC_Movie( severity = if_abap_behv_message=>severity-error
         textid = ZCM_DASC_MOVIE=>invallid_genre ).
        APPEND VALUE #( %tky = movie-%tky ) TO failed-zi_dasc_movie.
        APPEND VALUE #( %tky           = movie-%tky
                        %msg           = message
                        %element-Genre = if_abap_behv=>mk-on
                        ) TO reported-zi_dasc_movie.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.


  METHOD rateMovie.

*    MODIFY ENTITY IN LOCAL MODE zi_dasc_rating
*           CREATE FIELDS ( UserName Rating RatingDate )
*           WITH VALUE #( FOR key IN keys
*                         ( MovieUUID  = key-MovieUUID
*                           UserName   = Sy-uname
*                           RatingDate = sy-datum
*                           Rating     = key-%param-rating ) ).

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
