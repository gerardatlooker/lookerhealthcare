view: condition_occurrence {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.condition_occurrence`
    ;;
  drill_fields: [condition_occurrence_id]

  dimension: condition_occurrence_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.condition_occurrence_id ;;
  }

  dimension: condition_concept_id {
    type: number
    sql: ${TABLE}.condition_concept_id ;;
  }

  dimension_group: condition_end {
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
    sql: ${TABLE}.condition_end_date ;;
  }

  dimension_group: condition_end_datetime {
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
    sql: CAST(${TABLE}.condition_end_datetime AS TIMESTAMP) ;;
  }

  dimension: condition_source_concept_id {
    type: number
    sql: ${TABLE}.condition_source_concept_id ;;
  }

  dimension: condition_source_value {
    type: string
    sql: ${TABLE}.condition_source_value ;;
  }

  dimension_group: condition_start {
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
    sql: ${TABLE}.condition_start_date ;;
  }

  dimension_group: condition_start_datetime {
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
    sql: CAST(${TABLE}.condition_start_datetime AS TIMESTAMP) ;;
  }

  dimension_group: condition_end_revised {
    type: time
    timeframes: [
      raw,
      time,
      date
    ]
    sql: coalesce(cast(${condition_end_raw} as timestamp),timestamp_add(cast(${condition_start_raw} as timestamp), INTERVAL 1 day)) ;;
  }

  dimension: condition_status_concept_id {
    type: number
    sql: ${TABLE}.condition_status_concept_id ;;
  }

  dimension: condition_status_source_value {
    type: string
    sql: ${TABLE}.condition_status_source_value ;;
  }

  dimension: condition_type_concept_id {
    type: number
    sql: ${TABLE}.condition_type_concept_id ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.provider_id ;;
  }

  dimension: stop_reason {
    type: string
    sql: ${TABLE}.stop_reason ;;
  }

  dimension: visit_detail_id {
    type: number
    sql: ${TABLE}.visit_detail_id ;;
  }

  dimension: visit_occurrence_id {
    type: number
    sql: ${TABLE}.visit_occurrence_id ;;
  }

  dimension: condition_length {
    type: number
    sql: date_diff(${condition_end_date},${condition_start_date},day) + 1 ;;
  }

  measure: condition_length_min {group_label: "Box Plot" label: "Condition Length - 1 - Min" type: min sql: ${condition_length} ;; }
  measure: condition_length_25 {group_label: "Box Plot"  label: "Condition Length - 2 - 25th" type: percentile percentile: 85 sql: ${condition_length} ;; }
  measure: condition_length_50 {group_label: "Box Plot"  label: "Condition Length - 3 - Median" type: percentile percentile: 90 sql: ${condition_length} ;; }
  measure: condition_length_75 {group_label: "Box Plot"  label: "Condition Length - 4 - 75th" type: percentile percentile: 95 sql: ${condition_length} ;; }
  measure: condition_length_max {group_label: "Box Plot" label: "Condition Length - 5 - Max" type: max sql: ${condition_length} ;; }

  measure: count {
    type: count
    drill_fields: [condition_occurrence_id]
  }

  measure: count_concept_id {
    type: count_distinct
    sql: ${condition_concept_id} ;;
  }
}
