view: gene_variants5 {
  sql_table_name: `lookerdata.genomics.gene_variants5`
    ;;

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [25, 35, 45, 55, 65, 75]
    sql: ${age} ;;
    style: integer
    drill_fields: [age]
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
    drill_fields: [classification, variant, zygosity]
  }

  dimension: diagnosis {
    type: string
    sql: ${TABLE}.diagnosis ;;
    link: {
      label: "Diagnosis Deep Dive - {{ value }}"
      url: "/dashboards/fhWxOPKPY8npk7Kitlcu5c?Diagnosis={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    drill_fields: [gene, variant, zygosity, classification]
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity ;;
    drill_fields: [age_tier, sex]
  }

  dimension: gene {
    type: string
    sql: ${TABLE}.gene ;;
    drill_fields: [variant, zygosity, classification]
    link: {
      label: "Gene Deep Dive - {{ value }}"
      url: "/dashboards/R466zT3ZBPvuFLyxJJnOul?Gene={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
    link: {
      label: "Research {{ value }}"
      url: "https://ghr.nlm.nih.gov/gene/{{ value }}"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.nih.gov"
    }
    action: {
      label: "Report a finding"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.servicenow.com"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        type: select
        name: "Team"
        option: {
          name: "Lab / Research"
        }
        option: {
          name: "Genomics Project"
        }
        option: {
          name: "Other"
        }
        required: yes
        default: "Lab / Research"
      }
      form_param: {
        type: select
        name: "Priority"
        option: {
          name: "P1 - High"
        }
        option: {
          name: "P2 - Medium"
        }
        option: {
          name: "P3 - Low"
        }
        required: yes
        default: "P1 - High"
      }
      form_param: {
        name: "Finding Description"
        type: textarea
        required: yes
        default:
        "Hi team - We were researching the {{ value }} gene sequence and hit an intersting finding."
      }
    }
  }

  dimension: individuals {
    hidden: yes
    type: number
    sql: ${TABLE}.individuals ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
    drill_fields: [age_tier, ethnicity]
  }

  dimension: variant {
    type: string
    sql: ${TABLE}.variant ;;
    drill_fields: [zygosity]
  }

  dimension: zygosity {
    type: string
    sql: ${TABLE}.zygosity ;;
    drill_fields: [gene, variant]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  measure: count_population {
    type: sum
    sql: ${individuals} ;;
    value_format_name: decimal_0
    link: {
      label: "More Information - Genomics Project"
      url: "https://cloud.google.com/life-sciences/docs/resources/public-datasets/1000-genomes"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.google.com"
    }
    drill_fields: [drill*]
  }

  measure: distinct_variants {
    type: count_distinct
    sql: ${variant} ;;
    value_format_name: decimal_0
    drill_fields: [drill*]
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
    value_format_name: decimal_1
    drill_fields: [drill*]
  }

  measure: stddev_age {
    label: "Age - Std Dev"
    type: number
    sql: stddev(${age}) ;;
    value_format_name: decimal_1
    drill_fields: [drill*]
  }

  measure: average_stddev_age {
    label: "Age - Avg +/- Std Dev"
    type: number
    sql: ${average_age} ;;
    html: {{ average_age._rendered_value }} +/-  {{ stddev_age._rendered_value }} ;;
  }

  set: drill {
    fields: [
      age_tier,
      ethnicity,
      gene,
      variant,
      count_population
    ]
  }
}
