view: relationship {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.relationship`
    ;;
  drill_fields: [reverse_relationship_id]

  dimension: reverse_relationship_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.reverse_relationship_id ;;
  }

  dimension: defines_ancestry {
    type: string
    sql: ${TABLE}.defines_ancestry ;;
  }

  dimension: is_hierarchical {
    type: string
    sql: ${TABLE}.is_hierarchical ;;
  }

  dimension: relationship_concept_id {
    type: number
    sql: ${TABLE}.relationship_concept_id ;;
  }

  dimension: relationship_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.relationship_id ;;
  }

  dimension: relationship_name {
    type: string
    sql: ${TABLE}.relationship_name ;;
  }

  measure: count {
    type: count
    drill_fields: [reverse_relationship_id, relationship_name, relationship.relationship_name, relationship.reverse_relationship_id, relationship.count]
  }
}
