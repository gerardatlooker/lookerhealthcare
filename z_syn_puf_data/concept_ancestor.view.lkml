view: concept_ancestor {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.concept_ancestor`
    ;;

  dimension: ancestor_concept_id {
    type: number
    sql: ${TABLE}.ancestor_concept_id ;;
  }

  dimension: descendant_concept_id {
    type: number
    sql: ${TABLE}.descendant_concept_id ;;
  }

  dimension: max_levels_of_separation {
    type: number
    sql: ${TABLE}.max_levels_of_separation ;;
  }

  dimension: min_levels_of_separation {
    type: number
    sql: ${TABLE}.min_levels_of_separation ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
