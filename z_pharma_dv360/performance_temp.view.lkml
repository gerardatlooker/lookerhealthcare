# view: performance_temp {
#   sql_table_name: `jnj-1p-aud-impact-looker.data.performance_temp`
#     ;;
#
#   dimension: advertiser {
#     type: string
#     sql: ${TABLE}.Advertiser ;;
#   }
#
#   dimension: advertiser_id {
#     type: number
#     sql: ${TABLE}.Advertiser_ID ;;
#   }
#
#   dimension: audience_list {
#     type: string
#     sql: ${TABLE}.Audience_List ;;
#   }
#
#   dimension: audience_list_id {
#     type: number
#     sql: ${TABLE}.Audience_List_ID ;;
#   }
#
#   dimension: audience_list_type {
#     type: string
#     sql: ${TABLE}.Audience_List_Type ;;
#   }
#
#   dimension: clicks {
#     type: number
#     sql: ${TABLE}.Clicks ;;
#   }
#
#   dimension: impressions {
#     type: number
#     sql: ${TABLE}.Impressions ;;
#   }
#
#   dimension: insertion_order {
#     type: string
#     sql: ${TABLE}.Insertion_Order ;;
#   }
#
#   dimension: insertion_order_id {
#     type: number
#     sql: ${TABLE}.Insertion_Order_ID ;;
#   }
#
#   dimension: partner_currency {
#     type: string
#     sql: ${TABLE}.Partner_Currency ;;
#   }
#
#   dimension: total_conversions {
#     type: number
#     sql: ${TABLE}.Total_Conversions ;;
#   }
#
#   dimension: total_media_cost__partner_currency_ {
#     type: number
#     sql: ${TABLE}.Total_Media_Cost__Partner_Currency_ ;;
#   }
#
# ################
# ### Derived Dimensions
# ################
#
#   dimension: party_type  {
#     type: string
#     sql:
#         CASE
#           WHEN SUBSTR(REGEXP_EXTRACT(Insertion_Order, r'\+([^+]+)_'),0,2) = '1P' THEN 'First Party'
#           WHEN SUBSTR(REGEXP_EXTRACT(Insertion_Order, r'\+([^+]+)_'),0,2) = '2P' THEN 'Second Party'
#           ELSE 'Third Party'
#         END
#     ;;
#     }
#
# ################
# ### Measures
# ################
#
#     measure: count {
#       type: count
#       drill_fields: []
#     }
#
#     measure: total_media_cost {
#       type: sum
#       sql: ${media_cost__partner_currency_} ;;
#       value_format_name: usd_0
#     }
#     measure: total_impressions {
#       type: sum
#       sql: ${impressions} ;;
#     }
#     measure: total_clicks {
#       type: sum
#       sql: ${clicks} ;;
#     }
#     measure: total_conversions {
#       type: sum
#       sql: ${conversions} ;;
#     }
#
# }
