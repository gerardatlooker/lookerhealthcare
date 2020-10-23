view: cross_join {
  parameter: passing_score {
    type: number
    default_value: "70"
  }

  parameter: value_per_incremental_passing_scores {
    type: number
    default_value: "1000000"
  }
}

view: scores_by_tpi {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: ndt_safe_fact_table {
      column: tpi_category {}
      column: percent_passed_measures {}
      column: date_month {}
      column: submission_id {}
      column: state {}
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${tpi_category},${date_month},${submission_id},${state}) ;;
  }
  dimension: tpi_category {
    hidden: yes
  }
  dimension: percent_passed_measures {
    hidden: yes
    type: number
  }
  dimension: date_month {
    hidden: yes
    type: date_month
  }
  dimension: submission_id {
    hidden: yes
    type: number
  }
  dimension: state {
    hidden: yes
  }
  dimension: tpi_passed {
    group_label: "Passed (Yes / No)"
    label: " TPI: Passed"
    type: yesno
    sql: ${percent_passed_measures} = 1 ;;
    html:
    {% if value == 'Yes' %} <p style="color: green; font-size:100%">PASS</p>
    {% else %} <p style="color: red; font-size:100%">FAIL</p>
    {% endif %} ;;
  }
  measure: count {
    group_label: "TPI"
    label: "Count TPIs Submitted"
    type: count
    drill_fields: [fact_table_final.drill*]
  }
  measure: count_passed_tpis {
    group_label: "TPI"
    label: "Count TPIs Passed"
    type: count
    filters: [tpi_passed: "Yes"]
    drill_fields: [fact_table_final.drill*]
  }
  measure: count_failed_measures {
    group_label: "TPI"
    label: "Count TPIs Failed"
    type: number
    sql: ${count} - ${count_passed_tpis} ;;
    drill_fields: [fact_table_final.drill*]
  }
  measure: percent_passed_tpis {
    group_label: "TPI"
    label: "% TPIs Passed"
    type: number
    sql: 1.0 * ${count_passed_tpis} / nullif(${count},0) ;;
    drill_fields: [fact_table_final.drill*]
    value_format_name: percent_1
  }

}

view: scores_by_system {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: ndt_safe_fact_table {
      column: percent_passed_tpis { field: scores_by_tpi.percent_passed_tpis }
      column: date_month {}
      column: submission_id {}
      column: state {}
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${date_month},${submission_id},${state}) ;;
  }
  dimension: percent_passed_tpis {
    hidden: yes
    type: number
  }
  dimension: date_month {
    hidden: yes
    type: date_month
  }
  dimension: submission_id {
    hidden: yes
    type: number
  }
  dimension: state {
    hidden: yes
  }
  dimension: system_passed {
    group_label: "Passed (Yes / No)"
    label: " System: Passed"
    type: yesno
    sql: ${percent_passed_tpis} > ( {% parameter cross_join.passing_score %} / 100 );;
    html:
    {% if value == 'Yes' %} <p style="color: green; font-size:100%">PASS</p>
    {% else %} <p style="color: red; font-size:100%">FAIL</p>
    {% endif %} ;;
  }
#   dimension: test {
#     group_label: "Passed (Yes / No)"
#     label: " System: Passed"
#     type: yesno
#     sql: ${percent_passed_tpis} > ( {% parameter cross_join.passing_score %} / 100 );;
#     html:
#     {% if value == 'Yes' %} <p style="color: green; font-size:200%;">PASS</p>
#     {% else %} <p style="color: red; font-size:200%">FAIL</p>
#     {% endif %} ;;
#   }
}

view: scores_by_system_final {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: ndt_safe_fact_table {
      column: percent_passed_tpis { field: scores_by_tpi.percent_passed_tpis }
      column: date_month {}
      # column: submission_id {}
      column: state {}
      filters: {
        field: ndt_safe_fact_table.is_final_submission
        value: "Yes"
      }
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${date_month},${state}) ;;
  }
  dimension: percent_passed_tpis {
    hidden: yes
    type: number
  }
  dimension: date_month {
    hidden: yes
    type: date_month
  }
  dimension: state {
    hidden: yes
  }
  dimension: system_passed {
    group_label: "Passed (Yes / No)"
    label: "System: Final Submission Passed"
    type: yesno
    sql: ${percent_passed_tpis} > ( {% parameter cross_join.passing_score %} / 100 ) ;;
  }
  measure: count_incremental_passes {
    group_label: "Value"
    label: "# Passed Months"
    description: "Count of times where final submission passed"
    type: count
    filters: [system_passed: "Yes"]
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value {
    group_label: "Value"
    label: "Total Value"
    description: "Total value captured in the system"
    type: number
    sql: ${count_incremental_passes} * {% parameter cross_join.value_per_incremental_passing_scores %} ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: count_distinct_months {
    hidden: yes
    type: count_distinct
    sql: ${date_month} ;;
  }
  measure: track_system_value_per_month {
    group_label: "Value"
    label: "Total Value per Month"
    description: "Total value captured in the system"
    type: number
    sql: 1.0 * ${track_system_value} / nullif(${count_distinct_months},0) ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value_per_year {
    group_label: "Value"
    label: "Total Value per Year"
    description: "Total value captured in the system"
    type: number
    sql: ${track_system_value_per_month} / 12.0 ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value_cumulative {
    group_label: "Value"
    label: "Total Value per Year (Lifetime)"
    description: "Total value captured in the system"
    type: running_total
    sql: ${track_system_value} ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }

}

view: scores_by_system_first {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: ndt_safe_fact_table {
      column: percent_passed_tpis { field: scores_by_tpi.percent_passed_tpis }
      column: date_month {}
      column: state {}
      filters: {
        field: ndt_safe_fact_table.is_first_submission
        value: "Yes"
      }
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${date_month},${state}) ;;
  }
  dimension: percent_passed_tpis {
    hidden: yes
    type: number
  }
  dimension: date_month {
    hidden: yes
    type: date_month
  }
  dimension: state {
    hidden: yes
  }
  dimension: system_passed {
    group_label: "Passed (Yes / No)"
    label: "System: First Submission Passed"
    type: yesno
    sql: ${percent_passed_tpis} > ({% parameter cross_join.passing_score %} / 100 ) ;;
  }
  dimension: system_failed {
    hidden: yes
    type: yesno
    sql: ${percent_passed_tpis} <= ( {% parameter cross_join.passing_score %} / 100 ) ;;
  }
  dimension: pass_only_after_revisions {
    group_label: "Passed (Yes / No)"
    label: "System: First Submission Failed, but Final Submission Passed"
    description: "The first submission failed but the final submission passed"
    type: yesno
    sql: ${system_failed} and ${scores_by_system_final.system_passed} ;;
  }
  measure: count_incremental_passes {
    group_label: "Value (Incremental)"
    label: "# Passed Months (Incremental)"
    description: "Count of months where first submission failed and final passed"
    type: count
    filters: [pass_only_after_revisions: "Yes"]
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value {
    group_label: "Value (Incremental)"
    label: "Total Value (Incremental)"
    description: "Total value captured in the system where first submissions failed and final passed"
    type: number
    sql: ${count_incremental_passes} * {% parameter cross_join.value_per_incremental_passing_scores %} ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: count_distinct_months {
    hidden: yes
    type: count_distinct
    sql: ${date_month} ;;
  }
  measure: track_system_value_per_month {
    group_label: "Value (Incremental)"
    label: "Total Value per Month (Incremental)"
    description: "Total value captured in the system where first submissions failed and final passed"
    type: number
    sql: 1.0 * ${track_system_value} / nullif(${count_distinct_months},0) ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value_per_year {
    group_label: "Value (Incremental)"
    label: "Total Value per Year (Incremental)"
    description: "Total value captured in the system where first submissions failed and final passed"
    type: number
    sql: ${track_system_value_per_month} / 12.0 ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }
  measure: track_system_value_cumulative {
    group_label: "Value (Incremental)"
    label: "Total Value per Year (Lifetime) (Incremental)"
    description: "Total value captured in the system where first submissions failed and final passed"
    type: running_total
    sql: ${track_system_value} ;;
    value_format: "$0.0,,\" M\""
    drill_fields: [fact_table_final.drill*]
  }

}
