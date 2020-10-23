# explore: measure_dataelement_mapping {}
view: measure_dataelement_mapping {
  sql_table_name: `lookerdata.medicaid_tpi_demo.measure_dataelement_mapping`
    ;;

################
### Original Dimensions
################

  dimension: pk {
    type: string
    primary_key: yes
    sql: concat(${measure_id},${data_element_id}) ;;
  }

  dimension: data_element_id {
    type: string
    sql: ${TABLE}.data_element_id ;;
  }

  dimension: measure_id {
    type: string
    sql: ${TABLE}.measure_id ;;
  }

################
### Derived Dimensions
################

################
### Measures
################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
  }
}
