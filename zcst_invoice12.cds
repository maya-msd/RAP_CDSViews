@AbapCatalog.sqlViewName: 'ZSQL_INVOICE12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Analytics View with Parameter'

define view zcst_invoice12
  with parameters
    ctry : land1
  as select from kna1
{
  key kunnr,
      name1,
      name2,
      concat_with_space(name1, name2, 2) as full_name,
      ort01,
      length(ort01)                      as city_length,
      land1,
      case land1
        when 'DE' then 'D'
        when 'JP' then 'J'
        when 'AU' then 'A'
        when 'US' then 'U'
        when 'FR' then 'F'
        when 'IN' then 'I'
        else 'Other'
      end                                as country_code,
      pstlz,
      regio
}
where
  land1 = $parameters.ctry;
