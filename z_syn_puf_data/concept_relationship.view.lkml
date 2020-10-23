view: concept_relationship {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.concept_relationship`
    ;;

  dimension: concept_id_1 {
    type: number
    value_format_name: id
    sql: ${TABLE}.concept_id_1 ;;
  }

  dimension: concept_id_2 {
    type: number
    value_format_name: id
    sql: ${TABLE}.concept_id_2 ;;
  }

  dimension: invalid_reason {
    type: string
    sql: ${TABLE}.invalid_reason ;;
  }

  dimension: relationship_id {
    type: string
    sql: ${TABLE}.relationship_id ;;
  }

  dimension_group: valid_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_end_date ;;
  }

  dimension_group: valid_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.valid_start_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
