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

  SELECT SINGLE FROM zzt_al_not_buff
  FIELDS *
  WHERE vkorg = '1000'
  INTO @DATA(ls_not_buffered).


ENDDO.
