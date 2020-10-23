# explore: measure_raw {}
view: measure_raw {
  sql_table_name: `lookerdata.medicaid_tpi_demo.measure_raw`
    ;;

################
### Original Dimensions
################

  dimension: measure_id {
    primary_key: yes
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.measure_ID_name ;;
  }

  dimension: active_ind {
    # group_label: "Z - Not Important"
    type: yesno
    sql: ${TABLE}.Active_Ind ;;
  }

  dimension: addition_removal_reason {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.addition_removal_reason ;;
  }

  dimension: calc_score {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.calc_score ;;
  }

  dimension: claim_category {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.claim_category ;;
  }

  dimension: claim_type {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.claim_type ;;
  }

  dimension: compliance_range_lower {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.compliance_range_lower ;;
  }

  dimension: compliance_range_upper {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.compliance_range_upper ;;
  }

  dimension: content_area___all_utl {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___ALL_UTL ;;
  }

  dimension: content_area___elig {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___ELIG ;;
  }

  dimension: content_area___exp {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___EXP ;;
  }

  dimension: content_area___ffs_utiliz {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___FFS_Utiliz ;;
  }

  dimension: content_area___pro {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___PRO ;;
  }

  dimension: content_area___tpl {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA___TPL ;;
  }

  dimension: content_area__mcr {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA__MCR ;;
  }

  dimension: content_area__mis {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.CONTENT_AREA__MIS ;;
  }

  dimension: decimal_places {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.decimal_places ;;
  }

  dimension: display_type {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.display_type ;;
  }

  dimension: dq_issue_category {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.dq_issue_category ;;
  }

  dimension: dqdb_adjustment_type {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.dqdb_adjustment_type ;;
  }

  dimension: dqdb_crossover_ind {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.DQDB_Crossover_Ind ;;
  }

  dimension: external_source {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.external_source ;;
  }

  dimension: for_ta_comprehensive {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.for_ta_comprehensive ;;
  }

  dimension: for_ta_inferential {
    group_label: "Z - Not Important"
    type: yesno
    sql: ${TABLE}.for_ta_inferential ;;
  }

  dimension: for_ta_longitudinal {
    group_label: "Z - Not Important"
    type: yesno
    sql: ${TABLE}.for_ta_longitudinal ;;
  }

  dimension: includes_tpi {
    group_label: "Z - Not Important"
    type: yesno
    sql: ${TABLE}.includes_tpi ;;
  }

  dimension: inferential_lower {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.inferential_lower ;;
  }

  dimension: inferential_upper {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.inferential_upper ;;
  }

  dimension: last_modified {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.last_modified ;;
  }

  dimension: longitudinal_acceptable_difference {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.longitudinal_acceptable_difference ;;
  }

  dimension: measure_id_name_full {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.measure_ID_name_full ;;
  }

  dimension: measure_name {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.measure_name ;;
    link: {
      label: "Deep Dive - {{ value }}"
      url: "/dashboards-next/466?Measure%20Name={{ value | url_encode }}"
      icon_url: "http://looker.com/favicon.ico"
    }
    action: {
      label: "File ticket - {{ value }}"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Fill ticket on {{value}}"
      }
      form_param: {
        name: "To Team"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default: "Given the anomalies seen in {{value}}, we strongly recommend beginning a new investigation."
      }
    }
    drill_fields: [dataelement_final.data_element_name]
  }

  dimension: measure_type {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.measure_type ;;
  }

  dimension: multi_content_area_ind {
    group_label: "Z - Not Important"
    type: yesno
    sql: ${TABLE}.MULTI_CONTENT_AREA_IND ;;
  }

  dimension: new_existing_uploading_metrics {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.new_existing_uploading_metrics ;;
  }

  dimension: parent_child {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.parent_child ;;
  }

  dimension: priority {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.Priority ;;
  }

  dimension: source {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: threshold_notes {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.threshold_notes ;;
  }

  dimension: tpi_category {
    group_label: "Z - Not Important"
    type: number
    sql: ${TABLE}.TPI_Category ;;
  }

  dimension: validation_type {
    # group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.validation_type ;;
  }

  dimension: version {
    group_label: "Z - Not Important"
    type: string
    sql: ${TABLE}.version ;;
  }

################
### Derived Dimensions
################

  dimension: content_area {
    type: string
    sql:
      CASE
        WHEN ${content_area___all_utl} = 1 then 'All Util'
        WHEN ${content_area___elig} = 1 then 'Elig'
        WHEN ${content_area___exp} = 1 then 'Exp'
        WHEN ${content_area___ffs_utiliz} = 1 then 'FFS Util'
        WHEN ${content_area___pro} = 1 then 'Pro'
        WHEN ${content_area___tpl} = 1 then 'TPL'
        WHEN ${content_area__mcr} = 1 then 'MCR'
        WHEN ${content_area__mis} = 1 then 'MIS'
      END
    ;;
  }

################
### Measures
################

  measure: count {
    type: count
    # drill_fields: [measure_id_name, measure_name]
  }

  measure: count_pk {
    type: count_distinct
    sql: ${measure_id} ;;
  }
}

# dimension: data_element_1 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_1 ;;
# }
#
# dimension: data_element_10 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_10 ;;
# }
#
# dimension: data_element_11 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_11 ;;
# }
#
# dimension: data_element_12 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_12 ;;
# }
#
# dimension: data_element_13 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_13 ;;
# }
#
# dimension: data_element_14 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_14 ;;
# }
#
# dimension: data_element_15 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_15 ;;
# }
#
# dimension: data_element_16 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_16 ;;
# }
#
# dimension: data_element_17 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_17 ;;
# }
#
# dimension: data_element_2 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_2 ;;
# }
#
# dimension: data_element_3 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_3 ;;
# }
#
# dimension: data_element_4 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_4 ;;
# }
#
# dimension: data_element_5 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_5 ;;
# }
#
# dimension: data_element_6 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_6 ;;
# }
#
# dimension: data_element_7 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_7 ;;
# }
#
# dimension: data_element_8 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_8 ;;
# }
#
# dimension: data_element_9 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.Data_Element_9 ;;
# }
#
# dimension: dd_data_element_1 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_1 ;;
# }
#
# dimension: dd_data_element_10 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_10 ;;
# }
#
# dimension: dd_data_element_11 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_11 ;;
# }
#
# dimension: dd_data_element_12 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_12 ;;
# }
#
# dimension: dd_data_element_13 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_13 ;;
# }
#
# dimension: dd_data_element_14 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_14 ;;
# }
#
# dimension: dd_data_element_15 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_15 ;;
# }
#
# dimension: dd_data_element_16 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_16 ;;
# }
#
# dimension: dd_data_element_17 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_17 ;;
# }
#
# dimension: dd_data_element_2 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_2 ;;
# }
#
# dimension: dd_data_element_3 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_3 ;;
# }
#
# dimension: dd_data_element_4 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_4 ;;
# }
#
# dimension: dd_data_element_5 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_5 ;;
# }
#
# dimension: dd_data_element_6 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_6 ;;
# }
#
# dimension: dd_data_element_7 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_7 ;;
# }
#
# dimension: dd_data_element_8 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_8 ;;
# }
#
# dimension: dd_data_element_9 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_9 ;;
# }
#
# dimension: dd_data_element_number_1 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_1 ;;
# }
#
# dimension: dd_data_element_number_10 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_10 ;;
# }
#
# dimension: dd_data_element_number_11 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_11 ;;
# }
#
# dimension: dd_data_element_number_12 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_12 ;;
# }
#
# dimension: dd_data_element_number_13 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_13 ;;
# }
#
# dimension: dd_data_element_number_14 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_14 ;;
# }
#
# dimension: dd_data_element_number_15 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_15 ;;
# }
#
# dimension: dd_data_element_number_16 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_16 ;;
# }
#
# dimension: dd_data_element_number_17 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_17 ;;
# }
#
# dimension: dd_data_element_number_2 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_2 ;;
# }
#
# dimension: dd_data_element_number_3 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_3 ;;
# }
#
# dimension: dd_data_element_number_4 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_4 ;;
# }
#
# dimension: dd_data_element_number_5 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_5 ;;
# }
#
# dimension: dd_data_element_number_6 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_6 ;;
# }
#
# dimension: dd_data_element_number_7 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_7 ;;
# }
#
# dimension: dd_data_element_number_8 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_8 ;;
# }
#
# dimension: dd_data_element_number_9 {
#   group_label: "Z - Not Important"
#   type: string
#   sql: ${TABLE}.DD_Data_Element_Number_9 ;;
# }
