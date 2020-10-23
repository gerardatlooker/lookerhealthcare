view: drug_exposure {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.drug_exposure`
    ;;
  drill_fields: [drug_exposure_id]

  dimension: drug_exposure_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.drug_exposure_id ;;
  }

  dimension: days_supply {
    type: number
    sql: ${TABLE}.days_supply ;;
  }

  dimension: dose_unit_source_value {
    type: string
    sql: ${TABLE}.dose_unit_source_value ;;
  }

  dimension: drug_concept_id {
    type: number
    sql: ${TABLE}.drug_concept_id ;;
  }

  dimension_group: drug_exposure_end {
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
    sql: ${TABLE}.drug_exposure_end_date ;;
  }

  dimension_group: drug_exposure_end_datetime {
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
    sql: CAST(${TABLE}.drug_exposure_end_datetime AS TIMESTAMP) ;;
  }

  dimension_group: drug_exposure_start {
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
    sql: ${TABLE}.drug_exposure_start_date ;;
  }

  dimension_group: drug_exposure_start_datetime {
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
    sql: CAST(${TABLE}.drug_exposure_start_datetime AS TIMESTAMP) ;;
  }

  dimension: drug_source_concept_id {
    type: number
    sql: ${TABLE}.drug_source_concept_id ;;
  }

  dimension: drug_source_value {
    type: string
    sql: ${TABLE}.drug_source_value ;;
  }

  dimension: drug_type_concept_id {
    type: number
    sql: ${TABLE}.drug_type_concept_id ;;
  }

  dimension: lot_number {
    type: string
    sql: ${TABLE}.lot_number ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: provider_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.provider_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: refills {
    type: number
    sql: ${TABLE}.refills ;;
  }

  dimension: route_concept_id {
    type: number
    sql: ${TABLE}.route_concept_id ;;
  }

  dimension: route_source_value {
    type: string
    sql: ${TABLE}.route_source_value ;;
  }

  dimension: sig {
    type: string
    sql: ${TABLE}.sig ;;
  }

  dimension: stop_reason {
    type: string
    sql: ${TABLE}.stop_reason ;;
  }

  dimension_group: verbatim_end {
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
    sql: ${TABLE}.verbatim_end_date ;;
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
    drill_fields: [drug_exposure_id, provider.provider_id, provider.provider_name, person.person_id]
  }
}
