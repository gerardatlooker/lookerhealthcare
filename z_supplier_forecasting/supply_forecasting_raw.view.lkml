view: supply_forecasting_raw {
  sql_table_name: ( SELECT * FROM `lookerdata.johnsonjohnson_data.supply_forecasting_raw` WHERE week_start_date >= '2017-01-01' )
    ;;

###############
### Original Dimensions
###############

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${week_start_raw},${sku}) ;;
  }

  dimension: brand {
    hidden: yes
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: confirmed_order_qty {
    hidden: yes
    type: number
    sql: ${TABLE}.CONFIRMED_ORDER_QTY ;;
  }

  dimension: fiscal_full {
    type: string
    sql: concat(${fiscal_year},'-',${fiscal_month}) ;;
  }

  dimension: fiscal_year {
    type: string
    sql: substr(cast(${TABLE}.FISCAL_MONTH as string),0,4) ;;
  }

  dimension: fiscal_month {
    type: string
    sql: substr(cast(${TABLE}.FISCAL_MONTH as string),5,2) ;;
  }

  dimension: shipped_qty {
    hidden: yes
    type: number
    sql: ${TABLE}.SHIPPED_QTY ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
    drill_fields: [week_start_month, week_start_week]
    action: {
      label: "Text Brand Rep for Support"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.zappier.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Phone Number"
        required: yes
        default: "703-555-8240"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi Ted - We had a lot of issues with your {{ value }} SKU. Please text me back ASAP."
      }
    }
    action: {
      label: "Create Support Ticket"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.servicenow.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        type: select
        name: "Team"
        option: {
          name: "Brand Support"
        }
        option: {
          name: "Training Support"
        }
        option: {
          name: "Other"
        }
        required: yes
        default: "Brand Support"
      }
      form_param: {
        type: select
        name: "Priority"
        option: {
          name: "P1 - High"
        }
        option: {
          name: "P2 - Medium"
        }
        option: {
          name: "P3 - Low"
        }
        required: yes
        default: "P1 - High"
      }
      form_param: {
        name: "Ticket Description"
        type: textarea
        required: yes
        default:
        "Hi IT team - We had a lot of issues with the {{ value }} SKU. We need help."
      }
    }
  }

  dimension_group: week_start {
    type: time
    timeframes: [
      raw,
      week,
      week_of_year,
      month,
      month_name,
      quarter,
      quarter_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.WEEK_START_DATE ;;
    drill_fields: [sku]
  }

  dimension: x {
    hidden: yes
    type: number
    sql: ${TABLE}.x ;;
  }

###############
### Derived Dimensions
###############

  parameter: map_level {
    type: unquoted
    default_value: "national"
    allowed_value: {
      label: "National View"
      value: "national"
    }
    allowed_value: {
      label: "State View"
      value: "state"
    }
    allowed_value: {
      label: "Metro View"
      value: "metro"
    }
  }

  dimension: standard_deviations_from_mean {
    hidden: yes
    type: number
    sql: 1.0 * abs(${confirmed_order_qty} - ${average_std_dev_per_quarter_per_sku.sum_ordered_per_week}) / nullif(${average_std_dev_per_quarter_per_sku.std_dev},0) ;;
  }

  dimension: search_traffic_sku_national_28 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 200 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_state_28 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 100 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_metro_28 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 50 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_national_14 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 80 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_state_14 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 40 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_metro_14 {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 25 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_national_14_competitor {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 150 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_state_14_competitor {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 70 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: search_traffic_sku_metro_14_competitor {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 55 )) / 20 ;;
    value_format_name: decimal_0
  }

  dimension: eye_spend_national {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 80 )) ;;
    value_format_name: usd_0
  }

  dimension: eye_spend_state {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 40 )) ;;
    value_format_name: usd_0
  }

  dimension: eye_spend_metro {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 25 )) ;;
    value_format_name: usd_0
  }

  dimension: eye_visits_national {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 80 )) / 5 ;;
    value_format_name: decimal_0
  }

  dimension: eye_visits_state {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 40 )) / 5 ;;
    value_format_name: decimal_0
  }

  dimension: eye_visits_metro {
    hidden: yes
    type: number
    sql: (( ${confirmed_order_qty} / 2000 ) + ( rand() * 25 )) / 5 ;;
    value_format_name: decimal_0
  }

###############
### Measures
###############

  measure: sum_ordered {
    type: sum
    sql: ${confirmed_order_qty} ;;
    drill_fields: [drill*]
  }

  measure: sum_shipped {
    type: sum
    sql: ${shipped_qty} ;;
    drill_fields: [drill*]
  }

  measure: sum_gap {
    type: number
    sql: ${sum_shipped} - ${sum_ordered} ;;
    drill_fields: [drill*]
  }

  measure: number_weeks {
    type: count_distinct
    sql: ${week_start_raw} ;;
    drill_fields: [drill*]
  }

  measure: number_weeks_with_sales {
    type: count_distinct
    sql: ${week_start_raw} ;;
    filters: [confirmed_order_qty: ">0"]
    drill_fields: [drill*]
  }

  measure: percent_weeks_with_data {
    type: number
    sql: 1.0 * ${number_weeks_with_sales} / nullif(${number_weeks},0) ;;
    value_format_name: percent_0
    drill_fields: [drill*]
  }

  measure: number_skus {
    type: count_distinct
    sql: ${sku} ;;
    drill_fields: [drill*]
  }

  measure: std_dev {
    type: number
    sql: stddev(${confirmed_order_qty}) ;;
    value_format_name: decimal_1
    drill_fields: [drill*]
  }

  measure: sum_ordered_per_week {
    type: number
    sql: 1.0 * ${sum_ordered} / nullif(${number_weeks},0) ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: variance_from_sum_ordered_per_week {
    label: "Average Standard Deviation from Mean"
    type: average
    sql: pow(${standard_deviations_from_mean},2) ;;
    value_format_name: decimal_2
    drill_fields: [drill*]
  }

  measure: sum_search_traffic_sku_28 {
    label: "Search Traffic (28 Days Prior)"
    type: sum
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} ${search_traffic_sku_national_28}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} ${search_traffic_sku_state_28}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} ${search_traffic_sku_metro_28}
      {% else %} ${search_traffic_sku_national_28}
      {% endif %} ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: sum_search_traffic_sku_14 {
    label: "Search Traffic (14 Days Prior)"
    type: sum
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} ${search_traffic_sku_national_14}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} ${search_traffic_sku_state_14}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} ${search_traffic_sku_metro_14}
      {% else %} ${search_traffic_sku_national_14}
      {% endif %} ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: sum_search_traffic_sku_14_competitor {
    label: "Search Traffic (Competitor) (14 Days Prior)"
    type: sum
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} ${search_traffic_sku_national_14_competitor}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} ${search_traffic_sku_state_14_competitor}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} ${search_traffic_sku_metro_14_competitor}
      {% else %} ${search_traffic_sku_national_14_competitor}
      {% endif %} ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: sum_eye_spend {
    label: "Medicare Spend on Eyes"
    type: sum
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} ${eye_spend_national}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} ${eye_spend_state}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} ${eye_spend_metro}
      {% else %} ${eye_spend_national}
      {% endif %} ;;
    value_format_name: usd_0
    drill_fields: [drill*]
  }

  measure: sum_eye_visits {
    label: "Medicare Visits on Eyes"
    type: sum
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} ${eye_visits_national}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} ${eye_visits_state}
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} ${eye_visits_metro}
      {% else %} ${eye_visits_national}
      {% endif %} ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: percent_population_over_30 {
    label: "% Population over 30"
    type: average
    sql:
      {% if     supply_forecasting_raw.map_level._parameter_value == 'national' %} 0.629312
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'state' %} rand()
      {% elsif  supply_forecasting_raw.map_level._parameter_value == 'metro' %} rand()
      {% else %} ${eye_visits_national}
      {% endif %} ;;
    value_format_name: percent_1
    drill_fields: [drill*]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  measure: count_pk {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
  }

  set: drill {
    fields: [
      week_start_month,
      sku,
      sum_ordered,
      sum_shipped
    ]
  }
}

view: sku_buckets {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: supply_forecasting_raw {
      column: sku {}
      column: sum_ordered_per_week {}
      column: variance_from_sum_ordered_per_week {}
      column: number_weeks_with_sales {}
    }
  }
  dimension: sku {
    primary_key: yes
    hidden: yes
  }
  dimension: sum_ordered_per_week {
    hidden: yes
    type: number
  }
  dimension: sku_category {
    type: tier
    tiers: [1300, 2600, 9000]
    sql: ${sum_ordered_per_week} ;;
    style: integer
    link: {
      label: "{{ value }} - Deep Dive"
      url: "/dashboards/WikEMNaddZ01xqxEpdUGQp?Location=national&SKU%20Bucket={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
    }
  }
  dimension: variance_from_sum_ordered_per_week {
    hidden: yes
    type: number
  }
  dimension: number_weeks_with_sales {
    hidden: yes
    type: number
  }
}

view: average_std_dev_per_quarter_per_sku {
  derived_table: {
    datagroup_trigger: once_yearly
    explore_source: supply_forecasting_raw {
      column: std_dev {}
      column: sku {}
      column: week_start_quarter {}
      column: sum_ordered_per_week {}
    }
  }
  dimension: pk {
    primary_key: yes
    sql: concat(${sku},${week_start_quarter}) ;;
  }
  dimension: std_dev {
    hidden: yes
    type: number
  }
  dimension: sku {
    hidden: yes
  }
  dimension: week_start_quarter {
    hidden: yes
    type: date_quarter
  }
  dimension: sum_ordered_per_week {
    hidden: yes
    type: number
  }
}



view: cross_join {
  sql_table_name: (SELECT 1 as number)  ;;

  measure: growth_last_month_vs_two_months_ago {
    type: number
    sql: 1.0 * (${last_month.sum_ordered_per_week} - ${two_months_ago.sum_ordered_per_week}) / nullif(${two_months_ago.sum_ordered_per_week},0) ;;
    value_format_name: percent_1
  }

  measure: growth_last_month_vs_last_year {
    type: number
    sql: 1.0 * (${last_month.sum_ordered_per_week} - ${last_month_last_year.sum_ordered_per_week}) / nullif(${last_month_last_year.sum_ordered_per_week},0) ;;
    value_format_name: percent_1
  }
}
