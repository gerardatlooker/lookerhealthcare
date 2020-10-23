connection: "lookerdata"

include: "/z_supplier_forecasting/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: supply_forecasting_raw {
  label: " Forecasting Data"
  view_label: "  Forecasting Data"

## Trend Analysis

  query: trend_analysis {
    description: "Trend Analysis"
    # group_label: "Time"
    dimensions: [week_start_month]
    measures: [sum_ordered]
    sort: {field:week_start_month  desc:no}
  }

## SKU mapping

  join: sku_buckets {
    relationship: many_to_one
    sql_on: ${supply_forecasting_raw.sku} = ${sku_buckets.sku} ;;
  }

## Std Dev by Quarter

  join: average_std_dev_per_quarter_per_sku {
    relationship: many_to_one
    sql_on:
          ${supply_forecasting_raw.sku} = ${average_std_dev_per_quarter_per_sku.sku}
      AND ${supply_forecasting_raw.week_start_quarter} = ${average_std_dev_per_quarter_per_sku.week_start_quarter}
    ;;
  }

## Data Science

  join: applied_model_results {
    view_label: " Data Science"
    relationship: one_to_one
    sql_on:
            ${supply_forecasting_raw.sku} = ${applied_model_results.sku}
        AND ${supply_forecasting_raw.week_start_raw} = ${applied_model_results.week_start_raw}
      ;;
  }

## Recency

  join: subtract_30_back_90_days {
    view_label: "Recency - Last 90 Days"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${subtract_30_back_90_days.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${subtract_30_back_90_days.week_start_raw}, INTERVAL 30 DAY) AND DATE_ADD(${subtract_30_back_90_days.week_start_raw}, INTERVAL 120 DAY)
      ;;
  }

  join: subtract_30_back_365_days {
    view_label: "Recency - Last 365 Days"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${subtract_30_back_365_days.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${subtract_30_back_365_days.week_start_raw}, INTERVAL 30 DAY) AND DATE_ADD(${subtract_30_back_365_days.week_start_raw}, INTERVAL 395 DAY)
      ;;
  }

## Seasonality

  join: same_month_last_year {
    view_label: "Seaonality - Same Month Last Year"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${same_month_last_year.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${same_month_last_year.week_start_raw}, INTERVAL 350 DAY) AND DATE_ADD(${same_month_last_year.week_start_raw}, INTERVAL 380 DAY) ;;
  }

  join: same_quarter_last_year {
    view_label: "Seaonality - Same Quarter Last Year"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${same_quarter_last_year.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${same_quarter_last_year.week_start_raw}, INTERVAL 320 DAY) AND DATE_ADD(${same_quarter_last_year.week_start_raw}, INTERVAL 410 DAY) ;;
  }

## Growth

  join: last_month {
    view_label: "Growth - Last Month"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${last_month.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${last_month.week_start_raw}, INTERVAL 30 DAY) AND DATE_ADD(${last_month.week_start_raw}, INTERVAL 60 DAY)
      ;;
  }

  join: two_months_ago {
    view_label: "Growth - Two Months Ago"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${two_months_ago.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${two_months_ago.week_start_raw}, INTERVAL 60 DAY) AND DATE_ADD(${two_months_ago.week_start_raw}, INTERVAL 90 DAY)
      ;;
  }

  join: last_month_last_year {
    view_label: "Growth - Last Month Last Year"
    from: supply_forecasting_raw
    relationship: one_to_many
    sql_on:
            ${supply_forecasting_raw.sku} = ${last_month_last_year.sku}
        AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${last_month_last_year.week_start_raw}, INTERVAL 395 DAY) AND DATE_ADD(${last_month_last_year.week_start_raw}, INTERVAL 425 DAY)
      ;;
  }

  join: cross_join {
    view_label: "Growth - % Change"
    relationship: one_to_one
    sql_on: 1 = 1  ;;
  }
#
# ## Search
#
#   join: two_weeks_ago {
#     sql_where: ${two_weeks_ago.week_start_raw} >= '2017-01-15' ;;
#     view_label: "Search - 2 Weeks Prior"
#     from: supply_forecasting_raw
#     relationship: one_to_one
#     sql_on:
#             ${supply_forecasting_raw.sku} = ${two_weeks_ago.sku}
#         AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${two_weeks_ago.week_start_raw}, INTERVAL 11 DAY) AND DATE_ADD(${two_weeks_ago.week_start_raw}, INTERVAL 17 DAY)
#       ;;
#   }
#
#   join: four_weeks_ago {
#     sql_where: ${four_weeks_ago.week_start_raw} >= '2017-01-28' ;;
#     view_label: "Search - 4 Weeks Prior"
#     from: supply_forecasting_raw
#     relationship: one_to_one
#     sql_on:
#             ${supply_forecasting_raw.sku} = ${four_weeks_ago.sku}
#         AND ${supply_forecasting_raw.week_start_raw} BETWEEN DATE_ADD(${four_weeks_ago.week_start_raw}, INTERVAL 25 DAY) AND DATE_ADD(${four_weeks_ago.week_start_raw}, INTERVAL 31 DAY)
#       ;;
#   }
}

explore: predictive_power_raw {}
explore: machine_learning_raw {}

############ Caching Logic ############

persist_with: once_weekly

### PDT Timeframes

datagroup: once_daily {
  max_cache_age: "24 hours"
  sql_trigger: SELECT current_date() ;;
}

datagroup: once_weekly {
  max_cache_age: "168 hours"
  sql_trigger: SELECT extract(week from current_date()) ;;
}

datagroup: once_monthly {
  max_cache_age: "720 hours"
  sql_trigger: SELECT extract(month from current_date()) ;;
}

datagroup: once_yearly {
  max_cache_age: "9000 hours"
  sql_trigger: SELECT extract(year from current_date()) ;;
}
