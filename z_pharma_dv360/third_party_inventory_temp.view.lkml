view: third_party_inventory_temp {
  sql_table_name: `lookerdata.dv360.third_party_inventory_temp`
    ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: concat(${advertiser},${audience_list}) ;;
  }

  dimension: advertiser {
    type: string
    sql: ${TABLE}.Advertiser ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: audience_list {
    type: string
    sql: ${TABLE}.Audience_List ;;
  }

  dimension: audience_list_cost__usd_ {
    type: number
    sql: ${TABLE}.Audience_List_Cost__USD_ ;;
  }

  dimension: audience_list_id {
    type: number
    sql: ${TABLE}.Audience_List_ID ;;
  }

  dimension: potential_impressions {
    type: number
    sql: ${TABLE}.Potential_Impressions ;;
  }

  dimension: unique_cookies_with_impressions {
    type: number
    sql: ${TABLE}.Unique_Cookies_with_Impressions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_potential_impressions {
    type: sum
    sql: ${potential_impressions} ;;
  }
}
