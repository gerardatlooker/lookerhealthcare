connection: "lookerdata"

include: "/z_pharma_dv360/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
include: "/z_pharma_dv360/*.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: performance_temp {
  view_label: " Performance"

  join: blended_results {
    relationship: many_to_one
    sql_on:
          ${performance_temp.advertiser} = ${blended_results.advertiser}
      AND ${performance_temp.audience_list} = ${blended_results.audience_list}
      ;;
  }

  join: first_party_inventory_temp {
    relationship: many_to_one
    sql_on:
          ${performance_temp.advertiser} = ${first_party_inventory_temp.advertiser}
      AND ${performance_temp.audience_list} = ${first_party_inventory_temp.audience_list}
      ;;
  }

  join: google_inventory_temp {
    relationship: many_to_one
    sql_on:
          ${performance_temp.advertiser} = ${google_inventory_temp.advertiser}
      AND ${performance_temp.audience_list} = ${google_inventory_temp.audience_list}
      ;;
  }

  join: third_party_inventory_temp {
    relationship: many_to_one
    sql_on:
          ${performance_temp.advertiser} = ${third_party_inventory_temp.advertiser}
      AND ${performance_temp.audience_list} = ${third_party_inventory_temp.audience_list}
      ;;
  }

  ## Security Parameter
  access_filter: {
    field: advertiser
    user_attribute: allowed_advertiser
  }
}

### Permission Set

access_grant: can_see_sensitive_data {
  user_attribute: can_see_sensitive_data
  allowed_values: ["yes"]
}

access_grant: only_regular_advanced_users {
  user_attribute: user_type
  allowed_values: ["Regular","Advanced"]
}

access_grant: only_advanced_users {
  user_attribute: user_type
  allowed_values: ["Advanced"]
}
