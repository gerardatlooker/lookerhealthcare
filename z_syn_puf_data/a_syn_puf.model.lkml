connection: "lookerdata"

include: "/z_syn_puf_data/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "*.dashboard.lookml"   # include a LookML dashboard called my_dashboard

label: "Cohort Exercise"

explore: condition_occurrence {
  label: "Cohort Exercise"
  join: concept {
    relationship: many_to_one
    sql_on: ${condition_occurrence.condition_concept_id} = ${concept.concept_id} ;;
  }

  join: concept_ancestor {
    relationship: one_to_many
    sql_on: ${concept.concept_id} = ${concept_ancestor.descendant_concept_id} ;;
  }

  join: person {
    relationship: many_to_one
    sql_on: ${condition_occurrence.person_id} = ${person.person_id} ;;
  }

  join: observation_period {
    relationship: many_to_one
    sql_on:
          ${condition_occurrence.person_id} = ${observation_period.person_id}
      AND ${condition_occurrence.condition_start_raw} >= ${observation_period.observation_period_start_raw}
      AND ${condition_occurrence.condition_start_raw} <= ${observation_period.observation_period_end_raw}
      ;;
    sql_where:
          ${condition_occurrence.condition_start_raw} >= date_add(${observation_period.observation_period_start_raw}, INTERVAL 180 day)
      AND date_add(${condition_occurrence.condition_start_raw}, INTERVAL 0 day) <= ${observation_period.observation_period_end_raw}
    ;;
  }

  join: primary_events {
    view_label: "*Cohort Filters"
    relationship: many_to_one
    type: inner
    sql_on:
          ${condition_occurrence.person_id} = ${primary_events.person_id}
      AND ${condition_occurrence.visit_occurrence_id} = ${primary_events.visit_occurrence_id}
      ;;
    sql_where: ${primary_events.ordinal_rank} = 1 ;;
  }

  join: all_inclusions {
    from: inclusion_0
    view_label: "*Cohort Filters"
    relationship: many_to_one
    sql_on: ${condition_occurrence.person_id} = ${all_inclusions.person_id}
      ;;
  }

  join: cross_join {
    view_label: "*Cohort Filters"
    relationship: one_to_one
    sql:  ;;
  }

  join: care_site {
    relationship: many_to_one
    sql_on: ${person.care_site_id} = ${care_site.care_site_id} ;;
  }

  join: provider {
    relationship: many_to_one
    sql_on: ${condition_occurrence.provider_id} = ${provider.provider_id} ;;
  }

  always_filter: {
    filters: [condition_start_date: "2010-06-04"]
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
