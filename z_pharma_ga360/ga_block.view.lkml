view: ga_sessions_base {
  extension: required

### Original Dimensions

  dimension_group: partition {
    label: "Visit Start"
    timeframes: [raw,second,date,day_of_week,fiscal_quarter,week,month,year,month_name,month_num,week_of_year]
    type: time
    sql: TIMESTAMP_ADD(TIMESTAMP(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))), INTERVAL (date_diff(current_date(), cast('2017-08-01' as date), day)) DAY )  ;;
  }

  dimension_group: visitStart {
    label: "Visit Start"
    type: time
    datatype: epoch
    sql: ${TABLE}.visitStarttime ;;
    timeframes: [raw,time]
    hidden: yes
  }

  dimension: visitorId {
    group_label: "Z"
    label: "Visitor ID"
  }

  dimension: visitId {
    group_label: "ID"
    label: "Visit ID"
  }
  dimension: fullVisitorId {
    group_label: "ID"
    label: "Full Visitor ID"
  }

  dimension: socialEngagementType {
    group_label: "User Information"
    description: "Not Socially Engaged"
    label: "Social Engagement Type"
  }
  dimension: userid {
    group_label: "Z"
    label: "User ID"
  }
  dimension: channelGrouping {
    group_label: "User Information"
    label: "Channel Grouping"
    description: "Affiliate, Direct, Display, Organic Search, Paid Search, Referral, Social"
  }

### Visit # logic

  dimension: visitnumber {
    group_label: "Visit Number"
    label: "Visit Number"
    type: number
    description: "The session number for this user. If this is the first session, then this is set to 1."
  }

  dimension:  first_time_visitor {
    group_label: "Visit Number"
    type: yesno
    sql: ${visitnumber} = 1 ;;
  }

  dimension:  usertype {
    group_label: "Visit Number"
    label: "User Type"
    type: string
    sql: case when ${visitnumber} = 1 then 'New User' else 'Returning User' end ;;
  }

  dimension: visitnumbertier {
    group_label: "Visit Number"
    label: "Visit Number Tier"
    type: tier
    tiers: [1,2,5,10,15,20,50,100]
    style: integer
    sql: ${visitnumber} ;;
  }

  measure: total_visitors {
    group_label: "Z"
    type: count
    drill_fields: [fullVisitorId, visitnumber, session_count, totals.hits, totals.page_views, totals.timeonsite]
  }

  measure: first_time_visitors {
    group_label: "Visit Number"
    label: "First Time Visitors"
    type: count
    filters: {
      field: visitnumber
      value: "1"
    }
  }

  measure: second_time_visitors {
    group_label: "Visit Number"
    label: "Second Time Visitors"
    type: count
    filters: {
      field: visitnumber
      value: "2"
    }
  }

  measure: returning_visitors {
    group_label: "Visit Number"
    label: "Returning Visitors"
    type: count
    filters: {
      field: visitnumber
      value: "<> 1"
    }
  }

## Sesssions per Visitor

  measure: session_count {
    group_label: "Sessions"
    type: count
    filters: {
      field: hits.isInteraction
      value: "yes"
    }
    drill_fields: [fullVisitorId, visitnumber, session_count, totals.transactions_count, totals.transactionRevenue_total]
  }

  measure: unique_visitors {
    group_label: "Visitors"
    type: count_distinct
    sql: ${fullVisitorId} ;;
    drill_fields: [fullVisitorId, visitnumber, session_count, totals.hits, totals.page_views, totals.timeonsite]
  }

  measure: average_sessions_ver_visitor {
    group_label: "Sessions"
    type: number
    sql: 1.0 * (${session_count}/NULLIF(${unique_visitors},0))  ;;
    value_format_name: decimal_2
    drill_fields: [fullVisitorId, visitnumber, session_count, totals.hits, totals.page_views, totals.timeonsite]
  }

  # subrecords
  dimension: geoNetwork {hidden: yes}
  dimension: totals {hidden:yes}
  dimension: trafficSource {hidden:yes}
  dimension: device {hidden:yes}
  dimension: customDimensions {hidden:yes}
  dimension: hits {hidden:yes}
  dimension: hits_eventInfo {hidden:yes}

## Additional logic
  dimension: hour_of_day {
    type: number
    sql:
       round(
      case
        when substr(cast(round(rand() * 100,0) as string),2,1) in ('2','4','6','8','0')  then 7.5 + (rand())*16.5
        else  16.5 - (rand())*15.5
      end ,0)
        ;;
  }

## use visit or hit start time instead
  dimension: date {
    hidden: yes
  }

  dimension: id {
    group_label: "ID"
    primary_key: yes
    sql: CONCAT(CAST(${fullVisitorId} AS STRING), '|', COALESCE(CAST(${visitId} AS STRING),''), CAST(PARSE_DATE('%Y%m%d', REGEXP_EXTRACT(_TABLE_SUFFIX,r'^\d\d\d\d\d\d\d\d'))   AS STRING)) ;;
  }

## ASW - remove these dimensions
  # dimension: visitStartSeconds {
  #   label: "Visit Start Seconds"
  #   type: date_time
  #   sql: TIMESTAMP_SECONDS(${TABLE}.visitStarttime) ;;
  #   hidden: yes
  # }

  # ## referencing partition_date for demo purposes only. Switch this dimension to reference visistStartSeconds
  # dimension_group: visitStart {
  #   timeframes: [date,day_of_week,fiscal_quarter,week,month,year,month_name,month_num,week_of_year, hour12]
  #   label: "Visit Start"
  #   type: time
  #   sql: (TIMESTAMP(${visitStartSeconds})) ;;
  # }

}

view: geoNetwork_base {
  extension: required
  dimension: continent {
    label: "1 - Continent"
    drill_fields: [subcontinent,country,region,metro,city]
  }
  dimension: subcontinent {
    label: "2 - Subcontinent"
    drill_fields: [country,region,metro,city]
  }
  dimension: country {
    label: "3 - Country"
    map_layer_name: countries
    drill_fields: [region,metro,city]
  }
  dimension: region {
    label: "4 - Region"
    description: "e.g. US State"
    map_layer_name: us_states
    drill_fields: [metro,city]
  }
  dimension: metro {
    label: "5 - Metro"
    description: "e.g. Metro Area"
    drill_fields: [city]
  }
  dimension: city {
    label: "6 - City"
    drill_fields: [metro,approximate_networkLocation,networkLocation]
  }
  dimension: cityid {group_label: "Z" label: "City ID"}
  dimension: networkDomain {description: "e.g. comcast.net, vern.hr" label: "Network Domain"}
  dimension: latitude {
    group_label: "Z"
    type: number
    hidden: yes
    sql: CAST(${TABLE}.latitude as FLOAT64);;
  }
  dimension: longitude {
    group_label: "Z"
    type: number
    hidden: yes
    sql: CAST(${TABLE}.longitude as FLOAT64);;
  }
  dimension: networkLocation {
    group_label: "Z"
    label: "Network Location"
  }
  dimension: location {
    group_label: "Z"
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
  dimension: approximate_networkLocation {
    group_label: "Z"
    type: location
    sql_latitude: ROUND(${latitude},1) ;;
    sql_longitude: ROUND(${longitude},1) ;;
    drill_fields: [networkLocation]
  }
}

view: totals_base {
  extension: required
  dimension: id {
    primary_key: yes
    hidden: yes
    sql: ${ga_sessions.id} ;;
  }
  measure: visits_total {
    group_label: "Visitors"
    type: sum
    sql: ${TABLE}.visits ;;
  }
  measure: hits_total {
    group_label: "Hits"
    type: sum
    sql: ${TABLE}.hits ;;
    drill_fields: [hits.detail*]
  }
  measure: hits_average_per_session {
    group_label: "Hits"
    type: number
    sql: 1.0 * ${hits_total} / NULLIF(${ga_sessions.session_count},0) ;;
    value_format_name: decimal_2
  }
  measure: pageviews_total {
    group_label: "Page Views"
    label: "Page Views"
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
  measure: timeonsite_total {
    group_label: "Time on Site"
    label: "Time On Site"
    type: sum
    sql: ${TABLE}.timeonsite ;;
  }
  dimension: timeonsite_tier {
    group_label: "Time on Screen"
    label: "Time On Site Tier"
    type: tier
    sql: ${TABLE}.timeonsite ;;
    tiers: [0,15,30,60,120,180,240,300,600]
    style: integer
  }
  measure: timeonsite_average_per_session {
    group_label: "Time on Site"
    label: "Time On Site Average Per Session"
    type: number
    sql: 1.0 * ${timeonsite_total} / NULLIF(${ga_sessions.session_count},0) ;;
    value_format_name: decimal_2
  }

  measure: page_views_session {
    group_label: "Page Views"
    label: "PageViews Per Session"
    type: number
    sql: 1.0 * ${pageviews_total} / NULLIF(${ga_sessions.session_count},0) ;;
    value_format_name: decimal_2
  }

  measure: bounces_total {
    group_label: "Bounces"
    type: sum
    sql: ${TABLE}.bounces ;;
  }
  measure: bounce_rate {
    group_label: "Bounces"
    type:  number
    sql: 1.0 * ${bounces_total} / NULLIF(${ga_sessions.session_count},0) ;;
    value_format_name: percent_2
  }
  measure: transactions_count {
    group_label: "Transactions"
    type: sum
    sql: ${TABLE}.transactions ;;
  }
  measure: transactionRevenue_total {
    group_label: "Transactions"
    label: "Transaction Revenue Total"
    type: sum
    sql: (${TABLE}.transactionRevenue/1000000) ;;
    value_format_name: usd_0
    drill_fields: [transactions_count, transactionRevenue_total]
  }
  measure: newVisits_total {
    group_label: "Visit Number"
    label: "New Visits Total"
    type: sum
    sql: ${TABLE}.newVisits ;;
  }
  measure: screenViews_total {
    group_label: "Z"
    label: "Screen Views Total"
    type: sum
    sql: ${TABLE}.screenViews ;;
  }
  measure: timeOnScreen_total{
    group_label: "Z"
    label: "Time On Screen Total"
    type: sum
    sql: ${TABLE}.timeOnScreen ;;
  }
  measure: uniqueScreenViews_total {
    group_label: "Z"
    label: "Unique Screen Views Total"
    type: sum
    sql: ${TABLE}.uniqueScreenViews ;;
  }
  dimension: timeOnScreen_total_unique{
    group_label: "Time on Screen"
    label: "Time On Screen Total"
    type: number
    sql: ${TABLE}.timeOnScreen ;;
  }
}

view: trafficSource_base {
  extension: required

# dimension: adwords {}
  dimension: referralPath {
    description: "Path to referring someone: /a/google.com/forum/, /intl/ar/yt/about/, /analytics/web/, /mail/u/0/"
    label: "Referral Path"
    sql: substr(${TABLE}.referralPath,0,40) ;;
  }
  dimension: campaign {
    description: "Campaign name - e.g.  AW - Accessories, AW - Dynamic Search Ads Whole Site, Data Share Promo"
  }
  dimension: source {
    description: "Website that brought in traffic: quora.com, facebook.com, reddit.com, mail.google.com"
  }
  dimension: medium {
    description: "affiliate, cpc, cpm, organic, referral"
  }
  dimension: keyword {
    description: "Ad keyword that drew someone to the site"
  }
  dimension: adContent {
    description: "Ad name - e.g. Display Ad created 3/11/14, Full auto ad IMAGE ONLY"
    label: "Ad Content"
  }
  measure: source_list {
    type: list
    list_field: source
  }
  measure: source_count {
    type: count_distinct
    sql: ${source} ;;
    drill_fields: [source, totals.hits, totals.pageviews]
  }
  measure: keyword_count {
    type: count_distinct
    sql: ${keyword} ;;
    drill_fields: [keyword, totals.hits, totals.pageviews]
  }
  # Subrecords
#   dimension: adwordsClickInfo {}
}

view: adwordsClickInfo_base {
  extension: required
  dimension: campaignId {label: "Campaign ID"}
  dimension: adGroupId {label: "Ad Group ID"}
  dimension: creativeId {label: "Creative ID"}
  dimension: criteriaId {label: "Criteria ID"}
  dimension: page {type: number}
  dimension: slot {}
  dimension: criteriaParameters {label: "Criteria Parameters"}
  dimension: gclId {}
  dimension: customerId {label: "Customer ID"}
  dimension: adNetworkType {label: "Ad Network Type"}
  dimension: targetingCriteria {label: "Targeting Criteria"}
  dimension: isVideoAd {
    label: "Is Video Ad"
    type: yesno
  }
}

view: device_base {
  extension: required

  dimension: browser {description: "Chrome, Safari, Firefox, Internet Explorer, Edge"}
  dimension: browserVersion {group_label: "Z" label:"Browser Version"}
  dimension: operatingSystem {
    label: "Operating System"
    description: "Android, BlackBerry, Chrome OS, iOS, Linux, Macintosh, Samsung, Windows"
  }
  dimension: operatingSystemVersion {group_label: "Z" label: "Operating System Version"}
  dimension: deviceCategory { label:"Device Category" description:"mobile,tablet,desktop"}
  dimension: isMobile {type: yesno label: "Is Mobile" sql: ${deviceCategory} in ('mobile','tablet') ;; }
  dimension: isDesktop {type: yesno label: "Is Desktop" sql: ${deviceCategory} = 'desktop' ;; }
  dimension: flashVersion {group_label: "Z" label: "Flash Version"}
  dimension: javaEnabled {
    label: "Java Enabled"
    type: yesno
  }
  dimension: language {group_label: "Z" }
  dimension: screenColors {group_label: "Z" label: "Screen Colors"}
  dimension: screenResolution {group_label: "Z" label: "Screen Resolution"}
  dimension: mobileDeviceBranding {group_label: "Z" label: "Mobile Device Branding"}
  dimension: mobileDeviceInfo {group_label: "Z" label: "Mobile Device Info"}
  dimension: mobileDeviceMarketingName {group_label: "Z" label: "Mobile Device Marketing Name"}
  dimension: mobileDeviceModel {group_label: "Z" label: "Mobile Device Model"}
  dimension: mobileInputSelector {group_label: "Z" label: "Mobile Input Selector"}
}

view: hits_base {
  extension: required
  dimension: id {
    group_label: "Z"
    primary_key: yes
    sql: CONCAT(${ga_sessions.id},'|',FORMAT('%05d',${hitNumber})) ;;
  }
  dimension: hitNumber {
    group_label: "Description"
  }
  dimension: time {
    group_label: "Time"
  }
  dimension_group: hit {
    timeframes: [date,day_of_week,fiscal_quarter,week,month,year,month_name,month_num,week_of_year]
    type: time
    sql: TIMESTAMP_MILLIS(1000 * ${ga_sessions.visitStart_raw} + ${TABLE}.time)  ;;
  }
  dimension: hour {group_label: "Time"}
  dimension: minute {group_label: "Time"}
  dimension: isSecure {
    group_label: "Description"
    label: "Is Secure"
    type: yesno
  }
  dimension: isInteraction {
    group_label: "Description"
    label: "Is Interaction"
    type: yesno
    description: "If this hit was an interaction, this is set to true. If this was a non-interaction hit (i.e., an event with interaction set to false), this is false."
  }
  dimension: referer {
    group_label: "Description"
    description: "Who referred user to the site (facebook.com, google.com)"
    sql: substr(${TABLE}.referer,0,40) ;;
  }

  measure: count {
    label: "Count Hits"
    type: count
    drill_fields: [hits.detail*]
  }

  # subrecords
  dimension: page {hidden:yes}
  dimension: transaction {hidden:yes}
  dimension: item {hidden:yes}
  dimension: contentinfo {hidden:yes}
  dimension: social {hidden: yes}
  dimension: publisher {hidden: yes}
  dimension: appInfo {hidden: yes}
  dimension: contentInfo {hidden: yes}
  dimension: customDimensions {hidden: yes}
  dimension: customMetrics {hidden: yes}
  dimension: customVariables {hidden: yes}
  dimension: ecommerceAction {hidden: yes}
  dimension: eventInfo {hidden:yes}
  dimension: exceptionInfo {hidden: yes}
  dimension: experiment {hidden: yes}


  set: detail {
    fields: [ga_sessions.id, ga_sessions.visitnumber, ga_sessions.session_count, hits_page.pagePath, hits.pageTitle]
  }
}

view: hits_page_base {
  extension: required
  dimension: pagePath {
    description: "Path (post-hostname URL) of page"
    label: "Page Path"
    link: {
      label: "Link"
      url: "{{ value }}"
    }
    link: {
      label: "Page Info Dashboard"
      url: "/dashboards/101?Page%20Path={{ value | encode_uri}}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }
  dimension: hostName {
    description: "@{property1}.com, @{property2}.com, @{property3}.com, @{property4}.com, @{property5}.com, @{property6}.com"
    label: "Host Name"
    sql: concat(${ga_sessions.property},'.com') ;;
  }
  # dimension: hostName2 {
  #   label: "Host Name 2"
  #   sql: ${ga_sessions.property} ;;
  # }
  dimension: pageTitle {description: "Title @ top of page" label: "Page Title"}
  dimension: searchKeyword {group_label: "Z" label: "Search Keyword"}
  dimension: searchCategory{group_label: "Z" label: "Search Category"}
}

view: hits_transaction_base {
  extension: required

  dimension: id {
    primary_key: yes
    sql: ${hits.id} ;;
  }
  dimension: transactionShipping {label: "Transaction Shipping"}
  dimension: affiliation {}
  dimension: currencyCode {label: "Currency Code"}
  dimension: localTransactionRevenue {label: "Local Transaction Revenue"}
  dimension: localTransactionTax {label: "Local Transaction Tax"}
  dimension: localTransactionShipping {label: "Local Transaction Shipping"}
}

view: hits_item_base {
  extension: required

  dimension: id {
    group_label: "ID"
    primary_key: yes
    sql: ${hits.id} ;;
  }
  dimension: transactionId {group_label: "ID" label: "Transaction ID"}
  dimension: productName {
    group_label: "Z"
    label: "Product Name"
  }
  dimension: productCategory {group_label: "Z" label: "Product Catetory"}
  dimension: productSku {group_label: "Z" label: "Product Sku"}
  dimension: itemQuantity {
    description: "Should only be used as a dimension"
    label: "Item Quantity"
    hidden: yes
  }
  dimension: itemRevenue {
    description: "Should only be used as a dimension"
    label: "Item Revenue"
    hidden: yes
  }
  dimension: currencyCode {label: "Currency Code"}
  dimension: localItemRevenue {
    group_label: "Z"
    label:"Local Item Revenue"
    description: "Should only be used as a dimension"
  }
  measure: product_count {
    type: count_distinct
    sql: ${productSku} ;;
    drill_fields: [productName, productCategory, productSku, total_item_revenue]
  }
}

view: hits_social_base {
  extension: required   ## THESE FIELDS WILL ONLY BE AVAILABLE IF VIEW "hits_social" IN GA CUSTOMIZE HAS THE "extends" parameter declared

  dimension: socialInteractionNetwork {group_label: "Z" label: "Social Interaction Network"}
  dimension: socialInteractionAction {group_label: "Z" label: "Social Interaction Action"}
  dimension: socialInteractions {group_label: "Z" label: "Social Interactions"}
  dimension: socialInteractionTarget {group_label: "Z" label: "Social Interaction Target"}
  dimension: socialNetwork {
    description: "Facebook, Google Groups, Google+, Pinterest, Quora, reddit, Twitter, VKontakte, YouTube"
    label: "Social Network"
  }
  dimension: uniqueSocialInteractions {
    group_label: "Z"
    label: "Unique Social Interactions"
    type: number
  }
  dimension: hasSocialSourceReferral {description: "Y/N on has a social referral" label: "Has Social Source Referral"}
  dimension: socialInteractionNetworkAction {group_label: "Z" label: "Social Interaction Network Action"}
}

view: hits_publisher_base {
  extension: required    ## THESE FIELDS WILL ONLY BE AVAILABLE IF VIEW "hits_publisher" IN GA CUSTOMIZE HAS THE "extends" parameter declared

  dimension: dfpClicks {}
  dimension: dfpImpressions {}
  dimension: dfpMatchedQueries {}
  dimension: dfpMeasurableImpressions {}
  dimension: dfpQueries {}
  dimension: dfpRevenueCpm {}
  dimension: dfpRevenueCpc {}
  dimension: dfpViewableImpressions {}
  dimension: dfpPagesViewed {}
  dimension: adsenseBackfillDfpClicks {}
  dimension: adsenseBackfillDfpImpressions {}
  dimension: adsenseBackfillDfpMatchedQueries {}
  dimension: adsenseBackfillDfpMeasurableImpressions {}
  dimension: adsenseBackfillDfpQueries {}
  dimension: adsenseBackfillDfpRevenueCpm {}
  dimension: adsenseBackfillDfpRevenueCpc {}
  dimension: adsenseBackfillDfpViewableImpressions {}
  dimension: adsenseBackfillDfpPagesViewed {}
  dimension: adxBackfillDfpClicks {}
  dimension: adxBackfillDfpImpressions {}
  dimension: adxBackfillDfpMatchedQueries {}
  dimension: adxBackfillDfpMeasurableImpressions {}
  dimension: adxBackfillDfpQueries {}
  dimension: adxBackfillDfpRevenueCpm {}
  dimension: adxBackfillDfpRevenueCpc {}
  dimension: adxBackfillDfpViewableImpressions {}
  dimension: adxBackfillDfpPagesViewed {}
  dimension: adxClicks {}
  dimension: adxImpressions {}
  dimension: adxMatchedQueries {}
  dimension: adxMeasurableImpressions {}
  dimension: adxQueries {}
  dimension: adxRevenue {}
  dimension: adxViewableImpressions {}
  dimension: adxPagesViewed {}
  dimension: adsViewed {}
  dimension: adsUnitsViewed {}
  dimension: adsUnitsMatched {}
  dimension: viewableAdsViewed {}
  dimension: measurableAdsViewed {}
  dimension: adsPagesViewed {}
  dimension: adsClicked {}
  dimension: adsRevenue {}
  dimension: dfpAdGroup {}
  dimension: dfpAdUnits {}
  dimension: dfpNetworkId {}
}

view: hits_appInfo_base {
  extension: required

  dimension: name {group_label: "Z"}
  dimension: version {group_label: "Z"}
  dimension: id {group_label: "Z"}
  dimension: installerId {group_label: "Z"}
  dimension: appInstallerId {group_label: "Z"}
  dimension: appName {group_label: "Z"}
  dimension: appVersion {group_label: "Z"}
  dimension: appId {group_label: "Z"}
  dimension: screenName {description: "URL on the screen @ time of hit"}
  dimension: landingScreenName {description:"First URL (upon landing)"}
  dimension: exitScreenName {description:"Last URL (upon exit)"}
  dimension: screenDepth {group_label: "Z"}
}

view: contentInfo_base {
  extension: required

  dimension: contentDescription {}
}

view: hits_customDimensions_base {
  extension: required

  dimension: index {view_label: "Z" group_label: "Z" type:number}
  dimension: value {view_label: "Z" group_label: "Z" }
}

view: hits_customMetrics_base {
  extension: required

  dimension: index {view_label: "Z" group_label: "Z" type:number}
  dimension: value {view_label: "Z" group_label: "Z" }
}

view: hits_customVariables_base {
  extension: required

  dimension: customVarName {view_label: "Z" group_label: "Z"}
  dimension: customVarValue {view_label: "Z" group_label: "Z"}
  dimension: index {view_label: "Z" group_label: "Z" type:number}
}

view: hits_eCommerceAction_base {
  extension: required

  dimension: action_type {}
  dimension: option {}
  dimension: step {}
}

view: hits_eventInfo_base {
  extension: required

  dimension: eventCategory {group_label: "Z" description: "Removing this b/c already included in measures" label: "Event Category"}
  dimension: eventAction {group_label: "Z" description: "Removing this b/c already included in measures" label: "Event Action"}
  dimension: eventLabel {group_label: "Label on site that prompted event / action" label: "Event Label"}
  dimension: eventValue {group_label: "Z" label: "Event Value"}

}

# view: hits_sourcePropertyInfo {
# #   extension: required
#   dimension: sourcePropertyDisplayName {label: "Property Display Name"}
# }
