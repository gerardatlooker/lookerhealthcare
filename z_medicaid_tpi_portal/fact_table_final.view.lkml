# explore: fact_table_final {}
view: fact_table_final {
  sql_table_name: `lookerdata.medicaid_tpi_demo.fact_table_final`
    ;;

################
### Original Dimensions
################

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${state},${date_raw},${measure_id},${submission_id}) ;;
  }

  dimension: fk_tpi {
    hidden: yes
    type: string
    sql: concat(${tpi_category},${date_month},${submission_id},${state}) ;;
  }

  dimension: fk_system {
    hidden: yes
    type: string
    sql: concat(${date_month},${submission_id},${state}) ;;
  }

  dimension: fk_system_month {
    hidden: yes
    type: string
    sql: concat(${date_month},${state}) ;;
  }

  dimension: actual_value {
    group_label: "Distance from Threshold"
    type: number
    sql: ${TABLE}.actual_value ;;
  }

  dimension_group: date {
    label: "Submission"
    type: time
    timeframes: [raw, month, quarter, year]
    sql: cast(${TABLE}.date as timestamp) ;;
  }

  dimension: submission_month {
    label: "Submission - Month"
    type: string
    sql: ${date_month} ;;
    link: {
      label: "Submission Details - {{ value }}"
      url: "/dashboards-next/464?Month={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }
    drill_fields: [submission_id]
  }

  dimension: months_customer {
    group_label: "Tenure"
    label: "Tenure on Program: Months"
    type: string
    sql: ${TABLE}.months_customer ;;
  }
  dimension: years_customer {
    group_label: "Tenure"
    label: "Tenure on Program: Years"
    type: string
    sql: ${TABLE}.year_customer ;;
    drill_fields: [months_customer]
  }

  dimension: max {
    group_label: "Distance from Threshold"
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: measure_id {
    hidden: yes
    type: string
    sql: ${TABLE}.measure_id ;;
  }

  dimension: min {
    group_label: "Distance from Threshold"
    type: number
    sql: ${TABLE}.min ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    drill_fields: [submission_month, submission_id]
  }

  dimension: submission_id {
    group_label: "Submission Order"
    label: "Submission #"
    type: string
    sql: concat('#',${TABLE}.submission_id) ;;
    drill_fields: [submission_month]
    action: {
      label: "File ticket - {{ value }}"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Fill ticket on {{value}}"
      }
      form_param: {
        name: "To Team"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default: "Given the anomalies seen in {{value}}, we strongly recommend beginning a new investigation."
      }
    }
  }

  dimension: is_first_submission {
    group_label: "Submission Order"
    type: string
    sql: ${TABLE}.is_first_submission ;;
  }

  dimension: is_final_submission {
    group_label: "Submission Order"
    type: string
    sql: ${TABLE}.is_final_submission ;;
  }

  dimension: tpi_category {
    hidden: yes
    type: string
    sql: ${TABLE}.tpi_category ;;
  }

  dimension: tpi_category_name {
    hidden: yes
    type: string
    sql: ${TABLE}.tpi_category_name ;;
  }

  dimension: tpi_category_show {
    label: "TPI"
    type: string
    sql: concat('TPI ', ${tpi_category}, ': ', ${tpi_category_name}) ;;
    link: {
      label: "Submission Details - {{ value }}"
      url: "/dashboards-next/465?TPI={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }
    action: {
      label: "File ticket - {{ value }}"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Fill ticket on {{value}}"
      }
      form_param: {
        name: "To Team"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default: "Given the anomalies seen in {{value}}, we strongly recommend beginning a new investigation."
      }
    }
    drill_fields: [measure_raw.measure_name, submission_month, submission_id]
  }

################
### Derived Dimensions
################

  dimension: measure_passed {
    group_label: "Passed (Yes / No)"
    label: " Measure: Passed"
    type: yesno
    sql: ${actual_value} BETWEEN ${min} AND ${max} ;;
    html:
        {% if value == 'Yes' %} <p style="color: green; font-size:100%">PASS</p>
        {% else %} <p style="color: red; font-size:100%">FAIL</p>
        {% endif %} ;;
    drill_fields: [measure_raw.measure_name]
    }

  dimension: difference_from_threshold {
    group_label: "Distance from Threshold"
    type: number
    sql:
        case
          when ${actual_value} > ${max} then ${actual_value} - ${max}
          when ${actual_value} < ${min} then ${min} - ${actual_value}
          else 0
        end
    ;;
  }

  dimension: percent_difference_from_threshold {
    group_label: "Distance from Threshold"
    type: number
    sql: 1.0 * (${difference_from_threshold}) / nullif(((${max} + ${min}) / 2),0) ;;
  }

################
### Measures
################

  measure: count {
    group_label: "Measures"
    label: "Count Measures Submitted"
    type: count
    drill_fields: [drill*]
  }

  measure: count_measures {
    group_label: "Measures"
    label: "Count Distinct Measures"
    type: count_distinct
    sql: ${measure_id} ;;
    drill_fields: [drill*]
  }

  measure: count_passed_measures {
    group_label: "Measures"
    label: "Count Measures Passed"
    type: count
    filters: [measure_passed: "Yes"]
    drill_fields: [drill*]
  }

  measure: count_failed_measures {
    group_label: "Measures"
    label: "Count Measures Failed"
    type: number
    sql: ${count} - ${count_passed_measures} ;;
    drill_fields: [drill*]
  }

  measure: percent_passed_measures {
    group_label: "Measures"
    label: "% Measures Passed"
    type: number
    sql: 1.0 * ${count_passed_measures} / nullif(${count},0) ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: average_distance_from_threshold {
    group_label: "Distance from Threshold"
    type: average
    sql: ${difference_from_threshold} ;;
    value_format_name: decimal_1
    drill_fields: [drill*]
  }

  measure: average_percent_distance_from_threshold {
    group_label: "Distance from Threshold"
    type: average
    sql: ${percent_difference_from_threshold} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: pass_rate {
    group_label: "TPI"
    type: average
    sql: ({% parameter cross_join.passing_score %}) / 100 ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: min_value {
    group_label: "Distance from Threshold"
    type: average
    sql: ${min} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: max_value {
    group_label: "Distance from Threshold"
    type: average
    sql: ${max} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: actual_value_value {
    group_label: "Distance from Threshold"
    label: "Actual Value"
    type: average
    sql: ${actual_value} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: count_pk {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
  }

  set: drill {
    fields: [
      submission_month,
      submission_id,
      percent_passed_measures,
      count_passed_measures,
      count_failed_measures
    ]
  }
}
