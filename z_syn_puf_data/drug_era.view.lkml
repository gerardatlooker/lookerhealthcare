view: drug_era {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.drug_era`
    ;;
  drill_fields: [drug_era_id]

  dimension: drug_era_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.drug_era_id ;;
  }

  dimension: drug_concept_id {
    type: number
    sql: ${TABLE}.drug_concept_id ;;
  }

  dimension_group: drug_era_end {
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
    sql: ${TABLE}.drug_era_end_date ;;
  }

  dimension_group: drug_era_start {
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
    sql: ${TABLE}.drug_era_start_date ;;
  }

  dimension: drug_exposure_count {
    type: number
    sql: ${TABLE}.drug_exposure_count ;;
  }

  dimension: gap_days {
    type: number
    sql: ${TABLE}.gap_days ;;
  }

  dimension: person_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.person_id ;;
  }

  measure: count {
    type: count
    drill_fields: [drug_era_id, person.person_id]
  }
}
