view: drug_strength {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.drug_strength`
    ;;

  dimension: amount_unit_concept_id {
    type: number
    sql: ${TABLE}.amount_unit_concept_id ;;
  }

  dimension: amount_value {
    type: number
    sql: ${TABLE}.amount_value ;;
  }

  dimension: box_size {
    type: number
    sql: ${TABLE}.box_size ;;
  }

  dimension: denominator_unit_concept_id {
    type: number
    sql: ${TABLE}.denominator_unit_concept_id ;;
  }

  dimension: denominator_value {
    type: number
    sql: ${TABLE}.denominator_value ;;
  }

  dimension: drug_concept_id {
    type: number
    sql: ${TABLE}.drug_concept_id ;;
  }

  dimension: ingredient_concept_id {
    type: number
    sql: ${TABLE}.ingredient_concept_id ;;
  }

  dimension: invalid_reason {
    type: string
    sql: ${TABLE}.invalid_reason ;;
  }

  dimension: numerator_unit_concept_id {
    type: number
    sql: ${TABLE}.numerator_unit_concept_id ;;
  }

  dimension: numerator_value {
    type: number
    sql: ${TABLE}.numerator_value ;;
  }

  dimension_group: valid_end {
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
    sql: ${TABLE}.valid_end_date ;;
  }

  dimension_group: valid_start {
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
    sql: ${TABLE}.valid_start_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
