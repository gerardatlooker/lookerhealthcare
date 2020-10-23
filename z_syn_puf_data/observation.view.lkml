view: observation {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.observation`
    ;;
  drill_fields: [observation_id]

  dimension: observation_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.observation_id ;;
  }

  dimension: observation_concept_id {
    type: number
    sql: ${TABLE}.observation_concept_id ;;
  }

  dimension_group: observation {
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
    sql: ${TABLE}.observation_date ;;
  }

  dimension_group: observation_datetime {
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
    sql: CAST(${TABLE}.observation_datetime AS TIMESTAMP) ;;
  }

  dimension: observation_source_concept_id {
    type: number
    sql: ${TABLE}.observation_source_concept_id ;;
  }

  dimension: observation_source_value {
    type: string
    sql: ${TABLE}.observation_source_value ;;
  }

  dimension: observation_type_concept_id {
    type: number
    sql: ${TABLE}.observation_type_concept_id ;;
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

  dimension: qualifier_concept_id {
    type: number
    sql: ${TABLE}.qualifier_concept_id ;;
  }

  dimension: qualifier_source_value {
    type: string
    sql: ${TABLE}.qualifier_source_value ;;
  }

  dimension: unit_concept_id {
    type: number
    sql: ${TABLE}.unit_concept_id ;;
  }

  dimension: unit_source_value {
    type: string
    sql: ${TABLE}.unit_source_value ;;
  }

  dimension: value_as_concept_id {
    type: number
    sql: ${TABLE}.value_as_concept_id ;;
  }

  dimension: value_as_number {
    type: number
    sql: ${TABLE}.value_as_number ;;
  }

  dimension: value_as_string {
    type: string
    sql: ${TABLE}.value_as_string ;;
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
    drill_fields: [observation_id, provider.provider_id, provider.provider_name, person.person_id]
  }
}
