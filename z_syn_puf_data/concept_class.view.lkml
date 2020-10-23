view: concept_class {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.concept_class`
    ;;
  drill_fields: [concept_class_id]

  dimension: concept_class_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.concept_class_id ;;
  }

  dimension: concept_class_concept_id {
    type: number
    sql: ${TABLE}.concept_class_concept_id ;;
  }

  dimension: concept_class_name {
    type: string
    sql: ${TABLE}.concept_class_name ;;
  }

  measure: count {
    type: count
    drill_fields: [concept_class_id, concept_class_name, concept.count]
  }
}
