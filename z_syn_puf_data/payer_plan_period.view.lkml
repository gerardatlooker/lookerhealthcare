view: payer_plan_period {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.payer_plan_period`
    ;;
  drill_fields: [payer_plan_period_id]

  dimension: payer_plan_period_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.payer_plan_period_id ;;
  }

  dimension: family_source_value {
    type: string
    sql: ${TABLE}.family_source_value ;;
  }

  dimension: payer_concept_id {
    type: number
    sql: ${TABLE}.payer_concept_id ;;
  }

  dimension_group: payer_plan_period_end {
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
    sql: ${TABLE}.payer_plan_period_end_date ;;
  }

  dimension_group: payer_plan_period_start {
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
    sql: ${TABLE}.payer_plan_period_start_date ;;
  }

  dimension: payer_source_concept_id {
    type: number
    sql: ${TABLE}.payer_source_concept_id ;;
  }

  dimension: payer_source_value {
    type: string
    sql: ${TABLE}.payer_source_value ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: plan_concept_id {
    type: number
    sql: ${TABLE}.plan_concept_id ;;
  }

  dimension: plan_source_concept_id {
    type: number
    sql: ${TABLE}.plan_source_concept_id ;;
  }

  dimension: plan_source_value {
    type: string
    sql: ${TABLE}.plan_source_value ;;
  }

  dimension: sponsor_concept_id {
    type: number
    sql: ${TABLE}.sponsor_concept_id ;;
  }

  dimension: sponsor_source_concept_id {
    type: number
    sql: ${TABLE}.sponsor_source_concept_id ;;
  }

  dimension: sponsor_source_value {
    type: string
    sql: ${TABLE}.sponsor_source_value ;;
  }

  dimension: stop_reason_concept_id {
    type: number
    sql: ${TABLE}.stop_reason_concept_id ;;
  }

  dimension: stop_reason_source_concept_id {
    type: number
    sql: ${TABLE}.stop_reason_source_concept_id ;;
  }

  dimension: stop_reason_source_value {
    type: string
    sql: ${TABLE}.stop_reason_source_value ;;
  }

  measure: count {
    type: count
    drill_fields: [payer_plan_period_id, person.person_id]
  }
}
