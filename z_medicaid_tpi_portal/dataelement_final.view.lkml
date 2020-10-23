# explore: dataelement_final {}
view: dataelement_final {
  sql_table_name: `medicaid_tpi_demo.dataelement_final`
    ;;

################
### Original Dimensions
################

  dimension: coding_requirement {
    type: string
    sql: ${TABLE}.coding_requirement ;;
  }

  dimension: data_element_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.data_element_id ;;
  }

  dimension: data_element_name {
    type: string
    sql: ${TABLE}.data_element_name ;;
    link: {
      label: "Deep Dive - {{ value }}"
      url: "/dashboards-next/467"
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
  }

  dimension: definition {
    type: string
    sql: ${TABLE}.definition ;;
  }

  dimension: necessity {
    type: string
    sql: ${TABLE}.necessity ;;
  }

################
### Derived Dimensions
################

################
### Measures
################

  measure: count {
    type: count
    drill_fields: [data_element_name]
  }

  measure: count_pk {
    type: count_distinct
    sql: ${data_element_id} ;;
  }

  measure: percent_missing {
    type: average
    sql: rand() / 17 ;;
    value_format_name: percent_1
  }

  measure: percent_invalid {
    type: average
    sql: rand() / 12 ;;
    value_format_name: percent_1
  }
}
