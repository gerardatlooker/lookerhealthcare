view: provider {
  sql_table_name: `lookerdata.cms_synthetic_patient_data_omop.provider`
    ;;
  drill_fields: [provider_id]


  dimension: provider_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.provider_id ;;
  }

  dimension: care_site_id {
    hidden: yes
    type: number
    sql: ${TABLE}.care_site_id ;;
  }

  dimension: dea {
    hidden: yes
    type: string
    sql: ${TABLE}.dea ;;
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
    sql: ${TABLE}.gender_source_value ;;
  }

  dimension: npi {
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: provider_name {
    type: string
    sql: ${TABLE}.provider_name ;;
    drill_fields: [person.person_id]
    link: {
      label: "WebMd"
      url: "https://doctor.webmd.com/results?so=&ln={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain_url=http://www.webmd.com"
    }
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "NPPES Lookup"
      url: "https://npiregistry.cms.hhs.gov/registry/provider-view/1548431174"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.cms.gov"
    }
    action: {
      label: "Nudge Doctor to Focus"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Focus on patient outcomes"
      }
      form_param: {
        name: "To Mailing List"
        required: yes
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi {{ value }} -

        We've noticed your patients have been underperforming. Please focus on their quality measures.

        Best,
        "
      }
    }
  }

  dimension: provider_source_value {
    hidden: yes
    type: string
    sql: ${TABLE}.provider_source_value ;;
  }

  dimension: specialty_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.specialty_concept_id ;;
  }

  dimension: specialty_source_concept_id {
    hidden: yes
    type: number
    sql: ${TABLE}.specialty_source_concept_id ;;
  }

  dimension: specialty_source_value {
    hidden: yes
    label: "Specialty"
    type: string
    sql: NULL ;;
    #   CASE
    #     WHEN ${concept_lookup_demo.concept_parent} = 'AMI'
    #     WHEN ${concept_lookup_demo.concept_parent} = 'HF'
    #     WHEN ${concept_lookup_demo.concept_parent} = 'CABG'
    #   END
    #   ;;
    # sql: ${TABLE}.specialty_source_value ;;
  }

  dimension: year_of_birth {
    hidden: yes
    type: number
    sql: ${TABLE}.year_of_birth ;;
  }

  dimension: age {
    type: duration_year
    sql_start: timestamp(concat(${year_of_birth},'-01-01')) ;;
    sql_end: timestamp(current_date()) ;;
  }

  dimension: age_tiers {
    type: tier
    tiers: [35, 50, 65]
    sql: ${age} ;;
  }

  measure: count {
    label: "Count Providers"
    type: count
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      provider_id,
      provider_name,
      observation.count,
      person.count,
      drug_exposure.count,
      procedure_occurrence.count
    ]
  }
}
