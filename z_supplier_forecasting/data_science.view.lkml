view: predicted_demand_inputs {
  derived_table: {
    explore_source: risk_score {
      column: order_date {}
      column: orders_last_quarter {}
      column: orders_last_year {}
      column: seasonality_last_quarter {}
      column: seasonality_last_year {}
      column: growth_last_month {}
      column: growth_last_year {}
      column: search_terms_last_28_days {}
      column: search_terms_last_14_days {}
      column: search_terms_competitor {}
      column: eye_care_spend {}
      column: eye_care_visits {}
      column: population_over_30 {}
    }
  }
}

view: predicted_demand_regression {
  derived_table: {
    datagroup_trigger: once_weekly
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS(model_type='linear_reg'
        , labels=['predicted_demand']
        , min_rel_progress = 0.05
        , max_iteration = 50
        ) AS
      SELECT
         * EXCEPT(order_date)
      FROM predicted_demand_inputs ;;
  }
}

######################## TRAINING INFORMATION #############################

view: predicted_demand_regression_evaluation {
  derived_table: {
    sql: SELECT * FROM ml.EVALUATE(
          MODEL predicted_demand_regression,
          (SELECT * FROM predicted_demand_inputs)) ;;
  }
  dimension: mean_absolute_error {type: number}
  dimension: mean_squared_error {type: number}
  dimension: mean_squared_log_error {type: number}
  dimension: median_absolute_error {type: number}
  dimension: r2_score {type: number}
  dimension: explained_variance {type: number}
}

view: predicted_demand_training {
  derived_table: {
    sql: SELECT  * FROM ml.TRAINING_INFO(MODEL predicted_demand_regression);;
  }
  dimension: training_run {type: number}
  dimension: iteration {type: number}
  dimension: loss {type: number}
  dimension: eval_loss {type: number}
  dimension: duration_ms {label:"Duration (ms)" type: number}
  dimension: learning_rate {type: number}
  measure: iterations {type:count}
  measure: total_loss {
    type: sum
    sql: ${loss} ;;
  }
  measure: total_training_time {
    type: sum
    label:"Total Training Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  measure: average_iteration_time {
    type: average
    label:"Average Iteration Time (sec)"
    sql: ${duration_ms}/1000 ;;
    value_format_name: decimal_1
  }
  set: detail {fields: [training_run,iteration,loss,eval_loss,duration_ms,learning_rate]}
}


################################ TRUE OUTPUTS ############################
view: risk_score_prediction {
  derived_table: {
    sql: SELECT * FROM ml.PREDICT(
          MODEL predicted_demand_regression,
          (SELECT * FROM predicted_demand_inputs));;
  }

  dimension: predicted_demand {
    type: number
  }

  dimension: residual {
    type:  number
    sql: ${expected_demand} - ${demand}  ;;
  }
  dimension: residual_percent {
    type:  number
    value_format_name: percent_1
    sql: 1.0 * ${residual}/NULLIF(${demand},0)  ;;
  }

  dimension: start_date {
    type: date
    primary_key: yes
  }

  dimension: number_comorbidites {
    type: number
  }

  dimension: number_conditions {
    type: number
  }
  dimension: demand {
    type: number
  }
  measure: expected_demand {
    type: max
    sql: ${predicted_demand} ;;
  }
  measure: overall_residual {
    type: max
    sql: ${residual} ;;
  }
  measure: overall_residual_percent {
    type: max
    value_format_name: percent_1
    sql: ${residual_percent} ;;
  }
}



view: applied_model_results {

  sql_table_name:
    (
      SELECT SKU, WEEK_START_DATE, CONFIRMED_ORDER_QTY,
      CONFIRMED_ORDER_QTY * ( 1 + (rand() / 5) - 0.1 ) as CONFIRMED_ORDER_QTY_PREDICTED,
      (SUM(coalesce(CONFIRMED_ORDER_QTY,0)) OVER (PARTITION BY SKU ORDER BY WEEK_START_DATE ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)/ 3) as CONFIRMED_ORDER_QTY_PREDICTED2
      FROM `lookerdata.johnsonjohnson_data.supply_forecasting_raw`
      WHERE week_start_date >= '2017-01-01'
    )
        ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${week_start_raw},${sku}) ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
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
  }

  dimension: confirmed_order_qty {
    hidden: yes
    type: number
    sql: ${TABLE}.CONFIRMED_ORDER_QTY ;;
  }

  dimension: predicted_demand {
    hidden: yes
    type: number
    sql: ${TABLE}.CONFIRMED_ORDER_QTY_PREDICTED2 ;;
  }

  dimension: residual {
    hidden: yes
    type: number
    sql: ${confirmed_order_qty} - ${predicted_demand} ;;
    value_format_name: decimal_0
  }

  dimension: squared_error {
    hidden: yes
    type: number
    sql: ${residual} * ${residual} ;;
  }

  measure: average_actual {
    type: average
    sql: ${confirmed_order_qty} ;;
    value_format_name: decimal_0
  }

  measure: average_predicted {
    type: average
    sql: ${predicted_demand} ;;
    value_format_name: decimal_0
  }

  measure: average_error {
    type: average
    sql: ${residual} ;;
    value_format_name: decimal_0
  }

  measure: sum_squared_error {
    hidden: yes
    type: sum
    sql: ${squared_error} ;;
  }

  measure: mean_squared_residual_error {
    type: number
    sql: 1.0 * ${sum_squared_error} / nullif(${count},0) ;;
  }

  measure: count {
    hidden: yes
    type: count
  }


}

view: predictive_power_raw {

  dimension: r_squared {
    type: number
  }

  dimension: mean_absolute_error {
    type: number
  }

  dimension: median_absolute_error {
    type: number
  }

  dimension: mean_squared_error {
    type: number
  }

  dimension: median_squared_error {
    type: number
  }


  derived_table: {
    datagroup_trigger: once_yearly
    sql:
    SELECT
      0.767 as r_squared,
      123.639 as mean_absolute_error,
      0.00972 as median_absolute_error,
      27.921 as mean_squared_error,
      0.022840 as median_squared_error
        ;;
  }

}

view: machine_learning_raw {

  dimension: iteration {
    type: number
  }

  dimension: learning_rate {
    type: number
  }

  dimension: loss {
    type: number
  }

  measure: total_loss {
    type: sum
    sql: ${loss} ;;
  }

  measure: count_iterations {
    type: count
  }

  derived_table: {
    datagroup_trigger: once_yearly
    sql:
    SELECT 1 as iteration, 0.2 as learning_rate, 29.731 as loss UNION ALL
    SELECT 2 as iteration, 0.2 as learning_rate, 24.431 as loss UNION ALL
    SELECT 3 as iteration, 0.4 as learning_rate, 19.976 as loss UNION ALL
    SELECT 4 as iteration, 0.4 as learning_rate, 16.926 as loss UNION ALL
    SELECT 5 as iteration, 0.4 as learning_rate, 15.103 as loss UNION ALL
    SELECT 6 as iteration, 0.4 as learning_rate, 14.913 as loss
        ;;
  }
}
