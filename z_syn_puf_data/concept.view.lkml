view: concept {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.concept`
    ;;
  drill_fields: [concept_id]

  dimension: concept_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.concept_id ;;
  }

  dimension: concept_class_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.concept_class_id ;;
  }

  dimension: concept_code {
    type: string
    sql: ${TABLE}.concept_code ;;
  }

  dimension: concept_name {
    type: string
    sql: ${TABLE}.concept_name ;;
  }

  dimension: domain_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.domain_id ;;
  }

  dimension: invalid_reason {
    type: string
    sql: ${TABLE}.invalid_reason ;;
  }

  dimension: standard_concept {
    type: string
    sql: ${TABLE}.standard_concept ;;
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

  dimension: vocabulary_id {
    type: string
    sql: ${TABLE}.vocabulary_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      concept_id,
      concept_name,
      domain.domain_id,
      domain.domain_name,
      concept_class.concept_class_name,
      concept_class.concept_class_id
    ]
  }
}
