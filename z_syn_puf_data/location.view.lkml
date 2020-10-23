view: location {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.location`
    ;;
  drill_fields: [location_id]

  dimension: location_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: address_1 {
    type: string
    sql: ${TABLE}.address_1 ;;
  }

  dimension: address_2 {
    type: string
    sql: ${TABLE}.address_2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: location_source_value {
    type: string
    sql: ${TABLE}.location_source_value ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [location_id, person.count]
  }
}
