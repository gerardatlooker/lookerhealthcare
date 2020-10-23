view: performance {

################
### Original Dimensions
################

  dimension: advertiser {
    type: string
    sql: ${TABLE}.Advertiser ;;
    required_access_grants: [only_regular_advanced_users]
    link: {
      label: "{{ value }} - Deep Dive"
      url: "/dashboards/567?Advertiser={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
    }
    drill_fields: [insertion_order, date_month, party_type]
  }

  dimension: advertiser_id {
    type: number
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: cast(${TABLE}.date as timestamp) ;;
    drill_fields: [insertion_order, advertiser, party_type]
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: insertion_order {
    type: string
    sql: ${TABLE}.Insertion_Order ;;
  }

  # dimension: insertion_order_id {
  #   type: number
  #   sql: ${TABLE}.Insertion_Order_ID ;;
  # }

  dimension: partner_currency {
    type: string
    sql: ${TABLE}.Partner_Currency ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Total_Conversions ;;
  }

  dimension: media_cost__partner_currency_ {
    type: number
    sql: ${TABLE}.Total_Media_Cost__Partner_Currency_ ;;
  }

################
### Derived Dimensions
################

  dimension: party_type  {
    required_access_grants: [only_regular_advanced_users]
    label: "Party"
    type: string
    sql: ${TABLE}.party_type ;;
    drill_fields: [insertion_order, advertiser, date_month]
      # CASE
      #   WHEN SUBSTR(REGEXP_EXTRACT(${insertion_order}, r'\+([^+]+)_'),0,2) = '1P' THEN 'First Party'
      #   WHEN SUBSTR(REGEXP_EXTRACT(${insertion_order}, r'\+([^+]+)_'),0,2) = '2P' THEN 'Second Party'
      #   ELSE 'Third Party'
      # END ;;
  }

################
### Measures
################

    measure: count {
      hidden: yes
      type: count
    }

## All Parties
    measure: total_media_cost {
      group_label: "0 - All Parties"
      type: sum
      sql: ${media_cost__partner_currency_} ;;
      value_format_name: usd_0
      drill_fields: [drill*]
    }
    measure: total_impressions {
      group_label: "0 - All Parties"
      type: sum
      sql: ${impressions} ;;
      drill_fields: [drill*]
    }
    measure: total_clicks {
      group_label: "0 - All Parties"
      type: sum
      sql: ${clicks} ;;
      drill_fields: [drill*]
    }
    measure: total_conversions {
      group_label: "0 - All Parties"
      type: sum
      sql: ${conversions} ;;
      drill_fields: [drill*]
    }

## First Party
  measure: total_media_cost_1P {
    group_label: "1 - First Party"
    type: sum
    sql: ${media_cost__partner_currency_} ;;
    value_format_name: usd_0
    filters: [party_type: "First Party"]
    drill_fields: [drill*]
  }
  measure: total_impressions_1P {
    group_label: "1 - First Party"
    type: sum
    sql: ${impressions} ;;
    filters: [party_type: "First Party"]
    drill_fields: [drill*]
  }
  measure: total_clicks_1P {
    group_label: "1 - First Party"
    type: sum
    sql: ${clicks} ;;
    filters: [party_type: "First Party"]
    drill_fields: [drill*]
  }
  measure: total_conversions_1P {
    group_label: "1 - First Party"
    type: sum
    sql: ${conversions} ;;
    filters: [party_type: "First Party"]
    drill_fields: [drill*]
  }

## Second Party
  measure: total_media_cost_2P {
    group_label: "2 - Second Party"
    type: sum
    sql: ${media_cost__partner_currency_} ;;
    value_format_name: usd_0
    filters: [party_type: "Second Party"]
    drill_fields: [drill*]
  }
  measure: total_impressions_2P {
    group_label: "2 - Second Party"
    type: sum
    sql: ${impressions} ;;
    filters: [party_type: "Second Party"]
    drill_fields: [drill*]
  }
  measure: total_clicks_2P {
    group_label: "2 - Second Party"
    type: sum
    sql: ${clicks} ;;
    filters: [party_type: "Second Party"]
    drill_fields: [drill*]
  }
  measure: total_conversions_2P {
    group_label: "2 - Second Party"
    type: sum
    sql: ${conversions} ;;
    filters: [party_type: "Second Party"]
    drill_fields: [drill*]
  }

## Third Party
  measure: total_media_cost_3P {
    group_label: "3 - Third Party"
    type: sum
    sql: ${media_cost__partner_currency_} ;;
    value_format_name: usd_0
    filters: [party_type: "Third Party"]
    drill_fields: [drill*]
  }
  measure: total_impressions_3P {
    group_label: "3 - Third Party"
    type: sum
    sql: ${impressions} ;;
    filters: [party_type: "Third Party"]
    drill_fields: [drill*]
  }
  measure: total_clicks_3P {
    group_label: "3 - Third Party"
    type: sum
    sql: ${clicks} ;;
    filters: [party_type: "Third Party"]
    drill_fields: [drill*]
  }
  measure: total_conversions_3P {
    group_label: "3 - Third Party"
    type: sum
    sql: ${conversions} ;;
    filters: [party_type: "Third Party"]
    drill_fields: [drill*]
  }

  measure: cpm {
    group_label: "0 - All Parties"
    label: "CPM"
    description: "Cost per mile - total ad spend / 1000 impressions"
    type: number
    sql: 1000.0 * ${total_media_cost} / nullif(${total_impressions},0) ;;
    value_format_name: usd
    drill_fields: [drill*]
  }

  measure: ctr {
    group_label: "0 - All Parties"
    label: "CTR"
    description: "Click-through rate - total clicks / total impressions"
    type: number
    sql: 1.0 * ${total_clicks} / nullif(${total_impressions},0) ;;
    value_format_name: percent_3
    drill_fields: [drill*]
  }

  measure: cpc {
    group_label: "0 - All Parties"
    label: "CPC"
    description: "Cost per click - total cost / total clicks"
    type: number
    sql: 1.0 * ${total_media_cost} / nullif(${total_clicks},0) ;;
    value_format_name: usd
    drill_fields: [drill*]
  }

  set: drill {
    fields: [
      advertiser,
      insertion_order,
      party_type,
      cpm,
      ctr,
      cpc
    ]
  }


}

view: io_performance_temp {
  sql_table_name: `lookerdata.dv360.io_performance_temp`
    ;;
  extends: [performance]

  dimension: audience_list_type {
    type: string
    sql: ${party_type} ;;
  }

  dimension: audience_list_category {
    type: string
    sql: 'N/A';;
  }
}

view: performance_temp {
  sql_table_name: `lookerdata.dv360.performance_temp`
    ;;
  extends: [performance]

  dimension: pk {
    primary_key: yes
    type: string
    sql: concat(${advertiser_id}, ${insertion_order}, ${audience_list_id}) ;;
  }

  dimension: audience_list {
    type: string
    sql: ${TABLE}.audience_list ;;
    link: {
      label: "{{ value }} - Deep Dive"
      url: "/dashboards/568?Audience%20List={{ value | url_encode }}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.looker.com"
    }
  }

  dimension: audience_list_id {
    type: number
    sql: ${TABLE}.Audience_List_ID ;;
  }

  dimension: audience_list_type {
    hidden: yes
    type: string
    sql: ${TABLE}.Audience_List_Type ;;
  }

  dimension: party {
    type: string
    sql: ${party_type} ;;
  }

  dimension: audience_list_category {
    type: string
    sql: ${TABLE}.audience_list_category ;;
#       CASE
#          WHEN ${audience_list} LIKE '%Affinity%' THEN 'Affinity'
#          WHEN ${audience_list} LIKE '%Demographics%' THEN 'Demographics'
#          WHEN ${audience_list} LIKE '%In-Market%' THEN 'In-Market'
#          WHEN ${audience_list} LIKE '%Similar%' THEN 'Similar'
#          ELSE 'Custom'
#       END  ;;
  }

  measure: count_pk {
    type: count_distinct
    sql: ${pk} ;;
  }
  measure: total_count {
    group_label: "0 - All Parties"
    type: count
  }
  measure: total_scripts {
    # group_label: "0 - All Parties"
    type: count
  }
  measure: total_count_1p {
    group_label: "1 - First Party"
    type: count
    filters: [party_type: "First Party"]
  }
  measure: total_count_2p {
    group_label: "2 - Second Party"
    type: count
    filters: [party_type: "Second Party"]
  }
  measure: total_count_3p {
    group_label: "3 - Third Party"
    type: count
    filters: [party_type: "Third Party"]
  }
  measure: total_potential_impressions {
    label: "Headroom (Impressions)"
    type: number
    sql:
      CASE
        WHEN
              (${google_inventory_temp.total_potential_impressions} is null or ${google_inventory_temp.total_potential_impressions} = 0)
          AND (${first_party_inventory_temp.total_potential_impressions} is null or ${first_party_inventory_temp.total_potential_impressions} = 0)
        THEN ${third_party_inventory_temp.total_potential_impressions}
        WHEN (${google_inventory_temp.total_potential_impressions} is null or ${google_inventory_temp.total_potential_impressions} = 0)
        THEN ${first_party_inventory_temp.total_potential_impressions}
        ELSE ${google_inventory_temp.total_potential_impressions}
      END ;;
  }

  dimension: audience_ssn {
    hidden: yes
    type: string
    sql: cast(round(rand() * 10000, 0) as string) ;;
  }

  dimension: audience_ssn_hashed {
    type: number
    description: "Only users with sufficient permissions will see this data"
    sql:
        CASE
          WHEN '{{_user_attributes["can_see_sensitive_data"]}}' = 'yes'
                THEN ${audience_ssn}
                ELSE TO_BASE64(SHA1(${audience_ssn}))
          END ;;
  }


}

view: blended_results {
  derived_table: {
    explore_source: performance_temp {
      column: advertiser {}
      column: audience_list {}
      column: total_count_1p {}
      column: total_count_2p {}
      column: total_count_3p {}
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${advertiser},${audience_list}) ;;
  }
  dimension: advertiser {
    type: number
    hidden: yes
  }
  dimension: audience_list {
    type: number
    hidden: yes
  }
  dimension: total_count_1p {
    type: number
    hidden: yes
  }
  dimension: total_count_2p {
    type: number
    hidden: yes
  }
  dimension: total_count_3p {
    type: number
  }
  dimension: audience_list_type {
    required_access_grants: [only_regular_advanced_users]
    sql:
      CASE
       WHEN ${total_count_1p} > 0 AND ${total_count_2p} = 0 AND ${total_count_3p} = 0 THEN 'First Party'
       WHEN ${total_count_1p} = 0 AND ${total_count_2p} > 0 AND ${total_count_3p} = 0 THEN 'Second Party'
       WHEN ${total_count_1p} = 0 AND ${total_count_2p} = 0 AND ${total_count_3p} > 0 THEN 'Third Party'
      ELSE 'Blended'
      END
    ;;
    drill_fields: [performance_temp.advertiser, performance_temp.insertion_order]
  }
}
