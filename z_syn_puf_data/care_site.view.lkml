view: care_site {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.care_site`
    ;;
  drill_fields: [care_site_id]

  dimension: care_site_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.care_site_id ;;
  }

  dimension: care_site_name {
    type: string
    sql: concat('Hospital - #', substr(cast(${care_site_id} as string),1,2)) ;;
    # sql: ${TABLE}.care_site_name ;;
    drill_fields:
    [
      concept_lookup_demo.concept_parent
#        ,  provider.specialty_source_value
      , person.gender_source_value
#        , person.race_source_value
#        , person.ethnicity_source_value
    ]
  }

  # dimension: post_discharge_location {
  #   type: number
  #   sql: case when ${visit_occerences.next_event_raw} is null then null else ${care_site_name} end  ;;
  # }

  dimension: care_site_source_value {
    hidden: yes
    type: string
    sql: ${TABLE}.care_site_source_value ;;
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: place_of_service_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.place_of_service_concept_id ;;
  }

  dimension: place_of_service_source_value {
    hidden: yes
    type: string
    sql: ${TABLE}.place_of_service_source_value ;;
  }

  measure: count {
    label: "Count Hospitals"
    type: count
    drill_fields: [care_site_id, care_site_name]
  }
}
