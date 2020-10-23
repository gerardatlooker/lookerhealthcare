view: cost {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.cost`
    ;;
  drill_fields: [cost_id]

  dimension: cost_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.cost_id ;;
  }

  dimension: amount_allowed {
    type: number
    sql: ${TABLE}.amount_allowed ;;
  }

  dimension: cost_domain_id {
    type: string
    sql: ${TABLE}.cost_domain_id ;;
  }

  dimension: cost_event_id {
    type: number
    sql: ${TABLE}.cost_event_id ;;
  }

  dimension: cost_type_concept_id {
    type: number
    sql: ${TABLE}.cost_type_concept_id ;;
  }

  dimension: currency_concept_id {
    type: number
    sql: ${TABLE}.currency_concept_id ;;
  }

  dimension: drg_concept_id {
    type: number
    sql: ${TABLE}.drg_concept_id ;;
  }

  dimension: drg_source_value {
    type: string
    sql: ${TABLE}.drg_source_value ;;
  }

  dimension: paid_by_patient {
    type: number
    sql: ${TABLE}.paid_by_patient ;;
  }

  dimension: paid_by_payer {
    type: number
    sql: ${TABLE}.paid_by_payer ;;
  }

  dimension: paid_by_primary {
    type: number
    sql: ${TABLE}.paid_by_primary ;;
  }

  dimension: paid_dispensing_fee {
    type: number
    sql: ${TABLE}.paid_dispensing_fee ;;
  }

  dimension: paid_ingredient_cost {
    type: number
    sql: ${TABLE}.paid_ingredient_cost ;;
  }

  dimension: paid_patient_coinsurance {
    type: number
    sql: ${TABLE}.paid_patient_coinsurance ;;
  }

  dimension: paid_patient_copay {
    type: number
    sql: ${TABLE}.paid_patient_copay ;;
  }

  dimension: paid_patient_deductible {
    type: number
    sql: ${TABLE}.paid_patient_deductible ;;
  }

  dimension: payer_plan_period_id {
    type: number
    sql: ${TABLE}.payer_plan_period_id ;;
  }

  dimension: revenue_code_concept_id {
    type: number
    sql: ${TABLE}.revenue_code_concept_id ;;
  }

  dimension: revenue_code_source_value {
    type: string
    sql: ${TABLE}.revenue_code_source_value ;;
  }

  dimension: total_charge {
    type: number
    sql: ${TABLE}.total_charge ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: total_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.total_paid ;;
  }

  measure: count {
    type: count
    drill_fields: [cost_id]
  }
}
