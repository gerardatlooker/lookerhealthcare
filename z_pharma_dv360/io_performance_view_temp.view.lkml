view: io_performance_view_temp {
  sql_table_name: `lookerdata.dv360.io_performance_view_temp`
    ;;

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: audience_list {
    type: string
    sql: ${TABLE}.audience_list ;;
  }

  dimension: audience_list_category {
    type: string
    sql: ${TABLE}.audience_list_category ;;
  }

  dimension: audience_list_id {
    type: number
    sql: ${TABLE}.audience_list_id ;;
  }

  dimension: audience_list_type {
    type: string
    sql: ${TABLE}.audience_list_type ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: total_media_cost {
    type: number
    sql: ${TABLE}.total_media_cost ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
