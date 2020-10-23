view: vocabulary {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.vocabulary`
    ;;
  drill_fields: [vocabulary_id]

  dimension: vocabulary_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.vocabulary_id ;;
  }

  dimension: vocabulary_concept_id {
    type: number
    sql: ${TABLE}.vocabulary_concept_id ;;
  }

  dimension: vocabulary_name {
    type: string
    sql: ${TABLE}.vocabulary_name ;;
  }

  dimension: vocabulary_reference {
    type: string
    sql: ${TABLE}.vocabulary_reference ;;
  }

  dimension: vocabulary_version {
    type: string
    sql: ${TABLE}.vocabulary_version ;;
  }

  measure: count {
    type: count
    drill_fields: [vocabulary_id, vocabulary_name]
  }
}
