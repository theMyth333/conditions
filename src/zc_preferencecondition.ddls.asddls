@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Preference Condition'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_PreferenceCondition
  provider contract transactional_query
  as projection on ZR_PreferenceCondition
{
        @EndUserText.label: 'Product'
  key   Product,
        @EndUserText.label: 'Commodity Code'
  key   CommodityCode,
        @EndUserText.label: 'Number'
  key   ConditionNumber,
        @EndUserText.label: 'Agreement'
        Agreement,
        @EndUserText.label: 'Status'
        PreferenceCondition,
        @EndUserText.label: 'Condition'
        Description,
        @EndUserText.label: 'Valid From'
        ValidFrom,
        @EndUserText.label: 'Valid to'
        Validto,
        @EndUserText.label: 'Is Condition Applied'
        ConditionApply,
        LocalLastChanged,
        LastChanged
}
