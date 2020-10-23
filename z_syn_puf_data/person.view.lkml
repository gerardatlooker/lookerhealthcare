view: person {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.person`
    ;;
  drill_fields: [person_id]
  dimension: person_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.person_id ;;
    value_format_name: id
#     link: {
#       label: "View list of comorbidities"
#       url: "/explore/himss_demo/comorbidites?fields=comorbidites.comorbidity"
#       icon_url: "https://looker.com/favicon.ico"
#     }
    action: {
      label: "Page Doctor to Investigate Patient"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.zappier.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Phone Number"
        required: yes
        default: "703-555-8240"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi Doctor - patient {{ value }} is at risk - please investigate their condition further."
      }
    }
  }

  dimension_group: birth_datetime {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date
    ]
    sql: CAST(${TABLE}.birth_datetime AS TIMESTAMP) ;;
  }

  dimension: birthday {
    type: date
    sql: cast(
            concat(
                cast(${year_of_birth} as string)
                ,'-0',cast(substr(cast(${person_id} as string),1,1) as string)
                ,'-1',cast(substr(cast(${person_id} as string),1,1) as string)
            )
          as timestamp) ;;
  }

  dimension: age  {
    type: number
    sql: date_diff(current_date(), ${birthday}, year)   ;;
  }

  dimension: care_site_id {
    hidden: yes
    type: number
    sql: ${TABLE}.care_site_id ;;
  }

  dimension: day_of_birth {
    hidden: yes
    type: number
    sql: ${TABLE}.day_of_birth ;;
  }

#  dimension: age {

#    type: duration_year
#    sql_start: cast(${birth_datetime_raw} as timestamp) ;;
#    sql_end: cast(current_date() as timestamp) ;;
#  }

  dimension: age_tiers {
    type: tier
    tiers: [35, 45, 50, 65, 75, 85]
    style: integer
    sql: ${age} ;;
    drill_fields: [gender_source_value, race_source_value, ethnicity_source_value]
  }

  dimension: ethnicity_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ethnicity_concept_id ;;
  }

  dimension: ethnicity_source_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ethnicity_source_concept_id ;;
  }

  dimension: ethnicity_source_value {
    label: "Ethnicity"
    type: string
    sql: ${TABLE}.ethnicity_source_value ;;
    drill_fields: [gender_source_value, race_source_value, age_tiers]
  }

  dimension: gender_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.gender_concept_id ;;
  }

  dimension: gender_source_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.gender_source_concept_id ;;
  }

  dimension: gender_source_value {
    label: "Gender"
    type: string
    sql:
          case
            when ${TABLE}.gender_source_value = '1' then 'F'
            when ${TABLE}.gender_source_value = '2' then 'M'
            else 'U'
          end ;;
    drill_fields: [age_tiers, race_source_value, ethnicity_source_value]
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: month_of_birth {
    hidden: yes
    type: number
    sql: ${TABLE}.month_of_birth ;;
  }

  dimension: person_source_value {
    hidden: yes
    type: string
    sql: ${TABLE}.person_source_value ;;
  }

  dimension: provider_id {
    type: number
    hidden: yes
    sql: ${TABLE}.provider_id ;;
  }

  dimension: race_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.race_concept_id ;;
  }

  dimension: race_source_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.race_source_concept_id ;;
  }

  dimension: race_source_value {
    label: "Race"
    type: string
    sql: ${TABLE}.race_source_value ;;
    drill_fields: [gender_source_value, race_source_value, ethnicity_source_value]
  }

  dimension: year_of_birth {
    # hidden: yes
    type: number
    sql: ${TABLE}.year_of_birth ;;
  }

  measure: count {
    label: "Count Patients"
    type: count
    drill_fields: [detail*]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_1
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      person_id,
      location.location_id,
      provider.provider_id,
      provider.provider_name,
      observation_period.count,
      observation.count,
      drug_era.count,
      drug_exposure.count,
      payer_plan_period.count,
      procedure_occurrence.count
    ]
  }
}
