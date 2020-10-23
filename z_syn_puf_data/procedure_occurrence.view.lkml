view: procedure_occurrence {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.procedure_occurrence`
    ;;
  drill_fields: [procedure_occurrence_id]

  dimension: procedure_occurrence_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.procedure_occurrence_id ;;
  }

  dimension: modifier_concept_id {
    type: number
    sql: ${TABLE}.modifier_concept_id ;;
  }

  dimension: modifier_source_value {
    type: string
    sql: ${TABLE}.modifier_source_value ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.person_id ;;
  }

  dimension: procedure_concept_id {
    type: number
    sql: ${TABLE}.procedure_concept_id ;;
  }

  dimension_group: procedure_dat {
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
    sql: ${TABLE}.procedure_dat ;;
  }

  dimension_group: procedure_datetime {
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
    sql: CAST(${TABLE}.procedure_datetime AS TIMESTAMP) ;;
  }

  dimension: procedure_source_concept_id {
    type: number
    sql: ${TABLE}.procedure_source_concept_id ;;
  }

  dimension: procedure_source_value {
    type: string
    sql: ${TABLE}.procedure_source_value ;;
  }

  dimension: procedure_type_concept_id {
    type: number
    sql: ${TABLE}.procedure_type_concept_id ;;
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
    drill_fields: [procedure_occurrence_id, provider.provider_id, provider.provider_name, person.person_id]
  }
}
