view: observation_period {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.observation_period`
    ;;
  drill_fields: [observation_period_id]

  dimension: observation_period_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.observation_period_id ;;
  }

  dimension_group: observation_period_end {
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
    sql: ${TABLE}.observation_period_end_date ;;
  }

  dimension_group: observation_period_start {
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
    sql: ${TABLE}.observation_period_start_date ;;
  }

  dimension: period_type_concept_id {
    type: number
    sql: ${TABLE}.period_type_concept_id ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.person_id ;;
  }

  measure: count {
    type: count
    drill_fields: [observation_period_id, person.person_id]
  }
}
