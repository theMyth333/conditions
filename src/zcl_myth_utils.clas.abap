CLASS zcl_myth_utils DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_myth_utils IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lt_cond) = VALUE zzmyth_condition(
    client = sy-mandt
    product = '0000001234'
    com_code = '0030012010'
    cnumber = '0000003004'
    agreement = '.DEC4'
    ccondition = 'C3004'
    description = 'A Chemical Reaction, purification, mixing...'
    from_date = '20250101'
    to_date = '20251231'
    cond_apply = ''
    ).

    INSERT INTO zzmyth_condition VALUES lt_cond.
    IF sy-subrc IS INITIAL.
      out->write( 'Success' ).
    ELSE.
      out->write( 'Error' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
