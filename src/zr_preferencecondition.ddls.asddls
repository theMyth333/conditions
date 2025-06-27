@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Preference Condition'
@Metadata.ignorePropagatedAnnotations: true

define root view entity ZR_PreferenceCondition
  as select from ZI_PreferenceCondition
{
  key   Product,
  key   CommodityCode,
  key   ConditionNumber,
        Agreement,
        PreferenceCondition,
        Description,
        ValidFrom,
        Validto,
        ConditionApply,
        LocalLastChanged,
        LastChanged
}
