view: death {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.death`
    ;;

  dimension: cause_concept_id {
    type: number
    sql: ${TABLE}.cause_concept_id ;;
  }

  dimension: cause_source_concept_id {
    type: number
    sql: ${TABLE}.cause_source_concept_id ;;
  }

  dimension: cause_source_value {
    type: string
    sql: ${TABLE}.cause_source_value ;;
  }

  dimension_group: death {
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
    sql: ${TABLE}.death_date ;;
  }

  dimension_group: death_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.death_datetime AS TIMESTAMP) ;;
  }

  dimension: death_type_concept_id {
    type: number
    sql: ${TABLE}.death_type_concept_id ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
