connection: "lookerdata"

include: "/z_medicaid_tpi_portal/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

label: "Medicaid TPI Tracker"

explore: fact_table_final {
  label: "Medicaid TPI Tracker"
  view_label: " Tracker Scores"

  sql_always_where:
    {% if fact_table_final.submission_id._in_query %} 1 = 1
    {% elsif fact_table_final.is_first_submission._in_query %} 1 = 1
    {% elsif fact_table_final.is_final_submission._in_query %} 1 = 1
    {% else %} ${fact_table_final.is_final_submission} = 'Yes' {% endif %} ;;

  access_filter: {
    field: state
    user_attribute: medicaid_state
  }

  join: cross_join {
    view_label: " Tracker Scores"
    relationship: one_to_one
    sql:  ;;
  }

  join: scores_by_tpi {
    view_label: " Tracker Scores"
    relationship: many_to_one
    sql_on: ${fact_table_final.fk_tpi} = ${scores_by_tpi.pk} ;;
  }

  join: scores_by_system {
    view_label: " Tracker Scores"
    relationship: many_to_one
    sql_on: ${fact_table_final.fk_system} = ${scores_by_system.pk} ;;
  }

  join: scores_by_system_final {
    view_label: " Tracker Scores"
    relationship: many_to_one
    sql_on: ${fact_table_final.fk_system_month} = ${scores_by_system_final.pk} ;;
  }

  join: scores_by_system_first {
    view_label: " Tracker Scores"
    relationship: many_to_one
    sql_on: ${fact_table_final.fk_system_month} = ${scores_by_system_first.pk} ;;
  }

  join: measure_raw {
    view_label: "Measures"
    relationship: many_to_one
    sql_on: ${fact_table_final.measure_id} = ${measure_raw.measure_id} ;;
  }

#   join: tpi_raw {
#     view_label: "TPI"
#     relationship: one_to_many
#     sql_on: ${measure_raw.tpi_category} = ${tpi_raw.tpi_category} ;;
#   }

  join: measure_dataelement_mapping {
    fields: []
    relationship: many_to_many
    sql_on: ${measure_raw.measure_id} = ${measure_dataelement_mapping.measure_id} ;;
  }

  join: dataelement_final {
    view_label: "Data Elements"
    relationship: many_to_one
    sql_on: ${measure_dataelement_mapping.data_element_id} = ${dataelement_final.data_element_id} ;;
  }

## Turtles

  query: tpi_pass_rate_across_submissions {
    dimensions: [submission_id]
    measures: [scores_by_tpi.count_passed_tpis]
    sort: {
      field:submission_id
      desc:no
    }
  }
  query: measure_pass_rate_across_submissions {
    dimensions: [submission_id]
    measures: [count_passed_measures]
    sort: {
      field:submission_id
      desc:no
    }
  }

}

explore: eligibility_group_final {}

explore: ndt_safe_fact_table {
  from: fact_table_final
  hidden: yes

  join: cross_join {
    view_label: " Tracker Scores"
    relationship: one_to_one
    sql:  ;;
  }

  join: scores_by_tpi {
    view_label: " Tracker Scores"
    relationship: many_to_one
    sql_on: ${ndt_safe_fact_table.fk_tpi} = ${scores_by_tpi.pk} ;;
  }
}


### Caching Logic

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
