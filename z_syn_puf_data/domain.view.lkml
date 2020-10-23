view: domain {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.domain`
    ;;
  drill_fields: [domain_id]

  dimension: domain_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.domain_id ;;
  }

  dimension: domain_concept_id {
    type: number
    sql: ${TABLE}.domain_concept_id ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.domain_name ;;
  }

  measure: count {
    type: count
    drill_fields: [domain_id, domain_name, concept.count]
  }
}
