view: performance_30d_temp {
  sql_table_name: `lookerdata.dv360.performance_30d_temp`
    ;;

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

  dimension: audience_list_id {
    type: number
    sql: ${TABLE}.Audience_List_ID ;;
  }

  dimension: audience_list_type {
    type: string
    sql: ${TABLE}.Audience_List_Type ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: insertion_order {
    type: string
    sql: ${TABLE}.Insertion_Order ;;
  }

  dimension: insertion_order_id {
    type: number
    sql: ${TABLE}.Insertion_Order_ID ;;
  }

  dimension: partner_currency {
    type: string
    sql: ${TABLE}.Partner_Currency ;;
  }

  dimension: total_conversions {
    type: number
    sql: ${TABLE}.Total_Conversions ;;
  }

  dimension: total_media_cost__partner_currency_ {
    type: number
    sql: ${TABLE}.Total_Media_Cost__Partner_Currency_ ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
