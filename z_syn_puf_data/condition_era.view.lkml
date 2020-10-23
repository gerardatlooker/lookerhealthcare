view: condition_era {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.condition_era`
    ;;
  drill_fields: [condition_era_id]

  dimension: condition_era_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.condition_era_id ;;
  }

  dimension: condition_concept_id {
    type: number
    sql: ${TABLE}.condition_concept_id ;;
  }

  dimension_group: condition_era_end {
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
    sql: ${TABLE}.condition_era_end_date ;;
  }

  dimension_group: condition_era_start {
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
    sql: ${TABLE}.condition_era_start_date ;;
  }

  dimension: condition_occurrence_count {
    type: number
    sql: ${TABLE}.condition_occurrence_count ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  measure: count {
    type: count
    drill_fields: [condition_era_id]
  }
}
