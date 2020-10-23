connection: "lookerdata"

# include all the views
include: "*.view*"
# =include: "data_tests.lkml"

# include all the dashboards
# include: "*.dashboard"

explore: ga_sessions {
  hidden: yes
  extends: [ga_sessions_block]
}

explore: ga_sessions_block {
  hidden: yes
  extends: [ga_sessions_base]
  extension: required

  always_filter: {
    filters: {
      field: ga_sessions.partition_date
      value: "7 days ago for 7 days"
      ## Partition Date should always be set to a recent date to avoid runaway queries
    }
  }
}

explore: ga_sessions_base {
  hidden: yes
  persist_for: "1 hour"
  extension: required

  view_name: ga_sessions
  view_label: "Session"

  join: totals {
    view_label: "Session"
    sql: LEFT JOIN UNNEST([${ga_sessions.totals}]) as totals ;;
    relationship: one_to_one
  }

  join: trafficSource {
    view_label: "Session: Traffic Source"
    sql: LEFT JOIN UNNEST([${ga_sessions.trafficSource}]) as trafficSource ;;
    relationship: one_to_one
  }

  join: device {
    view_label: "Session: Device"
    sql: LEFT JOIN UNNEST([${ga_sessions.device}]) as device ;;
    relationship: one_to_one
  }

  join: geoNetwork {
    view_label: "Session: Geo Network"
    sql: LEFT JOIN UNNEST([${ga_sessions.geoNetwork}]) as geoNetwork ;;
    relationship: one_to_one
  }

  join: hits {
    view_label: "Session: Hits"
    sql: LEFT JOIN UNNEST(${ga_sessions.hits}) as hits ;;
    relationship: one_to_many
  }

  join: hits_page {
    view_label: "Session: Hits: Page"
    sql: LEFT JOIN UNNEST([${hits.page}]) as hits_page ;;
    relationship: one_to_one
  }

  join: hits_transaction {
    view_label: "Session: Hits: Transaction"
    sql: LEFT JOIN UNNEST([${hits.transaction}]) as hits_transaction ;;
    relationship: one_to_one
  }

  join: hits_item {
    view_label: "Session: Hits: Item"
    sql: LEFT JOIN UNNEST([${hits.item}]) as hits_item ;;
    relationship: one_to_one
  }

  join: hits_social {
    view_label: "Session: Hits: Social"
    sql: LEFT JOIN UNNEST([${hits.social}]) as hits_social ;;
    relationship: one_to_one
  }

  join: hits_publisher {
    view_label: "Session: Hits: Publisher"
    sql: LEFT JOIN UNNEST([${hits.publisher}]) as hits_publisher ;;
    relationship: one_to_one
  }

  join: hits_appInfo {
    view_label: "Session: Hits: App Info"
    sql: LEFT JOIN UNNEST([${hits.appInfo}]) as hits_appInfo ;;
    relationship: one_to_one
  }

  join: hits_eventInfo{
    view_label: "Session: Hits: Events Info"
    sql: LEFT JOIN UNNEST([${hits.eventInfo}]) as hits_eventInfo ;;
    relationship: one_to_one
  }

  # join: hits_sourcePropertyInfo {
  #   view_label: "Session: Hits: Property"
  #   sql: LEFT JOIN UNNEST([hits.sourcePropertyInfo]) as hits_sourcePropertyInfo ;;
  #   relationship: one_to_one
  #   required_joins: [hits]
  # }

  # join: hits_eCommerceAction {
  #   view_label: "Session: Hits: eCommerce"
  #   sql: LEFT JOIN UNNEST([hits.eCommerceAction]) as  hits_eCommerceAction;;
  #   relationship: one_to_one
  #   required_joins: [hits]
  # }

  join: hits_customDimensions {
    view_label: "Session: Hits: Custom Dimensions"
    sql: LEFT JOIN UNNEST(${hits.customDimensions}) as hits_customDimensions ;;
    relationship: one_to_many
  }
  join: hits_customVariables{
    view_label: "Session: Hits: Custom Variables"
    sql: LEFT JOIN UNNEST(${hits.customVariables}) as hits_customVariables ;;
    relationship: one_to_many
  }
  join: first_hit {
    from: hits
    sql: LEFT JOIN UNNEST(${ga_sessions.hits}) as first_hit ;;
    relationship: one_to_one
    sql_where: ${first_hit.hitNumber} = 1 ;;
    fields: [first_hit.page]
  }
  join: first_page {
    view_label: "Session: First Page Visited"
    from: hits_page
    sql: LEFT JOIN UNNEST([${first_hit.page}]) as first_page ;;
    relationship: one_to_one
  }

  # join: audience_selector {
  #   type: inner
  #   relationship: one_to_one
  #   sql_on:
  #         1=1
  #     and strpos(${hits_page.hostName2}, coalesce(${audience_selector.hostname},${hits_page.hostName2}) )>0
  #     and strpos(${trafficSource.medium},coalesce(${audience_selector.medium},${trafficSource.medium}) )>0
  #     and strpos(${trafficSource.source},coalesce(cast(${audience_selector.source} as string),${trafficSource.source}) )>0
  #     and strpos(${ga_sessions.usertype},coalesce(${audience_selector.usertype},${ga_sessions.usertype}) )>0
  #     and {%condition audience_selector.audience_selection%}audience_selector.audience{%endcondition%}
  #     ;;
  # }


}




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
