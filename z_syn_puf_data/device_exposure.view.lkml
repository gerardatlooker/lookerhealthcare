view: device_exposure {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.device_exposure`
    ;;
  drill_fields: [device_exposure_id]

  dimension: device_exposure_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.device_exposure_id ;;
  }

  dimension: device_concept_id {
    type: number
    sql: ${TABLE}.device_concept_id ;;
  }

  dimension_group: device_exposure_end {
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
    sql: ${TABLE}.device_exposure_end_date ;;
  }

  dimension_group: device_exposure_end_datetime {
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
    sql: CAST(${TABLE}.device_exposure_end_datetime AS TIMESTAMP) ;;
  }

  dimension_group: device_exposure_start {
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
    sql: ${TABLE}.device_exposure_start_date ;;
  }

  dimension_group: device_exposure_start_datetime {
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
    sql: CAST(${TABLE}.device_exposure_start_datetime AS TIMESTAMP) ;;
  }

  dimension: device_source_concept_id {
    type: number
    sql: ${TABLE}.device_source_concept_id ;;
  }

  dimension: device_source_value {
    type: string
    sql: ${TABLE}.device_source_value ;;
  }

  dimension: device_type_concept_id {
    type: number
    sql: ${TABLE}.device_type_concept_id ;;
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}.person_id ;;
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.provider_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unique_device_id {
    type: string
    sql: ${TABLE}.unique_device_id ;;
  }

  dimension: visit_detail_id {
    type: number
    sql: ${TABLE}.visit_detail_id ;;
  }

  dimension: visit_occurrence_id {
    type: number
    sql: ${TABLE}.visit_occurrence_id ;;
  }

  measure: count {
    type: count
    drill_fields: [device_exposure_id]
  }
}
