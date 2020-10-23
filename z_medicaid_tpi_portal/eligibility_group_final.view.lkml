view: eligibility_group_final {
  sql_table_name: `lookerdata.medicaid_tpi_demo.eligibility_group_final`
    ;;

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: eligibility_group {
    type: string
    sql: ${TABLE}.eligibility_group ;;
  }

  dimension: people_expected_cms {
    type: number
    sql: ${TABLE}.people_expected_cms ;;
    value_format_name: decimal_0
  }

  dimension: people_expected_state {
    type: number
    sql: ${TABLE}.people_expected_state ;;
    value_format_name: decimal_0
  }

  dimension: percent_invalid {
    type: number
    value_format_name: id
    sql: ${TABLE}.percent_invalid ;;
  }

  dimension: percent_missing {
    type: number
    sql: ${TABLE}.percent_missing ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_cms {
    label: "Count Enrolles (CMS Records)"
    type: average
    sql: ${people_expected_cms} ;;
    value_format_name: decimal_0
  }

  measure: count_state {
    label: "Count Enrolles (State Records)"
    type: average
    sql: ${people_expected_state} ;;
    value_format_name: decimal_0
  }

  measure: difference_in_counts {
    label: "Difference in Counts - State vs. CMS"
    type: number
    sql: ${count_cms} - ${count_state} ;;
    value_format_name: decimal_0
  }

  measure: difference_in_counts_percent {
    label: "Difference (Percent) in Counts - State vs. CMS"
    type: number
    sql: ${difference_in_counts} / ${count_state} ;;
    value_format_name: percent_1
  }

  measure: average_percent_missing {
    label: "% Missing"
    type: average
    sql: ${percent_missing} ;;
    value_format_name: percent_1
  }

  measure: average_percent_invalid {
    label: "% Invalid"
    type: average
    sql: ${percent_invalid} ;;
    value_format_name: percent_1
  }
}
