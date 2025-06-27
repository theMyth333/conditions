@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Preference Condition'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_PreferenceCondition
  as select from zzmyth_condition as PreferenceCondition
{
  key    product            as Product,
  key    com_code           as CommodityCode,
  key    cnumber            as ConditionNumber,
         agreement          as Agreement,
         ccondition         as PreferenceCondition,
         description        as Description,
         from_date          as ValidFrom,
         to_date            as Validto,
         cond_apply         as ConditionApply,
         @Semantics.systemDateTime.localInstanceLastChangedAt: true
         local_last_changed as LocalLastChanged,
         @Semantics.systemDateTime.lastChangedAt: true
         last_changed       as LastChanged

}
