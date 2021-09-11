*&---------------------------------------------------------------------*
*& Report zabaplint_loop_buffer
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zabaplint_loop_buffer.

DO 10 TIMES.

  SELECT SINGLE FROM zzt_al_buffered
    FIELDS *
    WHERE vkorg = '1000'
    INTO @DATA(ls_buffered).
  IF sy-subrc = 0.

    SELECT SINGLE FROM zzt_al_not_buff
        FIELDS *
        WHERE vkorg = @ls_buffered-vkorg
        INTO @DATA(ls_not_buffered).
    IF sy-subrc = 0.
      ls_buffered-vkorg = ls_not_buffered-vkorg.
    ENDIF.

  ELSE.

    DATA(ls_new_buffered) = VALUE zzt_al_buffered( mandt = sy-mandt vkorg = '1000' werks = '1000' ).
    INSERT zzt_al_buffered FROM @ls_new_buffered.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.

    DATA(ls_new_not_buffered) = VALUE zzt_al_not_buff( mandt = sy-mandt vkorg = '1000' werks = '1000' ).
    INSERT zzt_al_not_buff FROM @ls_new_not_buffered.
    IF sy-subrc <> 0.
      CONTINUE.
    ENDIF.

  ENDIF.

ENDDO.
