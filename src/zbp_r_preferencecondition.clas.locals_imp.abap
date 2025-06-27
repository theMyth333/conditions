CLASS lcl_buffer DEFINITION.
  PUBLIC SECTION.

*    TYPES: BEGIN OF ty_buffer.
*             INCLUDE TYPE ztl_po   AS lv_data.
*    TYPES:   flag TYPE c LENGTH 1,
*           END OF ty_buffer.


    CLASS-DATA mt_buffer TYPE TABLE OF zzmyth_condition.

ENDCLASS.

CLASS lhc_ZR_PreferenceCondition DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_PreferenceCondition RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZR_PreferenceCondition.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZR_PreferenceCondition.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZR_PreferenceCondition.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZR_PreferenceCondition RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZR_PreferenceCondition.

    METHODS ApplyCondtions FOR MODIFY
      IMPORTING keys FOR ACTION ZR_PreferenceCondition~ApplyCondtions RESULT result.

ENDCLASS.

CLASS lhc_ZR_PreferenceCondition IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
    CLEAR lcl_buffer=>mt_buffer.

    SELECT * FROM zzmyth_condition
    FOR ALL ENTRIES IN @entities
    WHERE product = @entities-Product AND
          com_code = @entities-CommodityCode AND
          cnumber = @entities-ConditionNumber
          INTO TABLE @DATA(lt_condition).

    lt_condition[ 1 ]-cond_apply = entities[ 1 ]-ConditionApply.

    APPEND LINES OF lt_condition TO lcl_buffer=>mt_buffer.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<lfs_entity>).
      APPEND VALUE #( %cid = <lfs_entity>-%cid_ref Product = <lfs_entity>-Product CommodityCode = <lfs_entity>-CommodityCode ConditionNumber = <lfs_entity>-ConditionNumber ) TO mapped-zr_preferencecondition.
    ENDLOOP.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD ApplyCondtions.
    CLEAR lcl_buffer=>mt_buffer.

    READ ENTITIES OF ZR_PreferenceCondition IN LOCAL MODE
         ENTITY ZR_PreferenceCondition
         FIELDS ( Product
         CommodityCode
         ConditionNumber
         Agreement
         PreferenceCondition
         Description
         ValidFrom
         Validto
         ConditionApply
         LocalLastChanged
         LastChanged )
         WITH CORRESPONDING #( keys )
         RESULT DATA(lt_conditions)
         FAILED failed.

    SELECT * FROM zzmyth_condition
    FOR ALL ENTRIES IN @keys
    WHERE product = @keys-Product AND
          com_code = @keys-CommodityCode AND
          cnumber = @keys-ConditionNumber
          INTO TABLE @DATA(lt_condition).

    LOOP AT lt_condition ASSIGNING FIELD-SYMBOL(<lfs_condition>).
      <lfs_condition>-cond_apply = abap_true.
      APPEND <lfs_condition> TO lcl_buffer=>mt_buffer.
    ENDLOOP.

    result  = VALUE #( FOR ls_condition IN lt_conditions
                 ( %tky = ls_condition-%tky
                   %param = ls_condition  ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZR_PREFERENCECONDITION DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZR_PREFERENCECONDITION IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
    UPDATE zzmyth_condition FROM TABLE lcl_buffer=>mt_buffer.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
