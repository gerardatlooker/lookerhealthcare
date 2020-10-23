view: cross_join {

  parameter: codeset_custom {
    hidden: yes
    type: unquoted
    suggest_explore: concept_occurrence
    suggest_dimension: concept.concept_id
    default_value: "4094876"
  }

  dimension: is_codeset_custom {
    group_label: "Rules - Cohort"
    type: yesno
    sql:
      ${concept.concept_id} in ({% parameter codeset_custom %})
      OR
      (
        ${concept_ancestor.ancestor_concept_id} in ({% parameter codeset_custom %})
        AND
        ${concept.invalid_reason} is null
      )
      ;;
  }

  dimension: codeset_0 {
    group_label: "Rules - Cohort"
    label: "Lung Cancer Conditions (Primary)"
    type: string
    sql: 4094876,4334322,4092217,4311499 ;;
  }

  dimension: is_codeset_0 {
    group_label: "Rules - Cohort"
    label: "Lung Cancer Conditions (Primary)"
    type: yesno
    sql:
      ${concept.concept_id} in ${codeset_0}
      OR
      (
        ${concept_ancestor.ancestor_concept_id} in ${codeset_0}
        AND
        ${concept.invalid_reason} is null
      )
      ;;
  }

  dimension: codeset_1 {
    group_label: "Rules - Cohort"
    label: "Lung Cancer Conditions (Secondary)"
    type: string
    sql: 193144,78097,378087,140960,201240,192568,200959,439751,196053,40492474,198700,254591,318096,442182,320342,442181,434298,434875,373425,199752,72266,4147162,253717,196925,136354,198371,442173,78987,432851 ;;
  }

  dimension: is_codeset_1 {
    group_label: "Rules - Cohort"
    label: "Lung Cancer Conditions (Secondary)"
    type: yesno
    sql:
      ${concept.concept_id} in ${codeset_1}
      OR
      (
        ${concept_ancestor.ancestor_concept_id} in ${codeset_1}
        AND
        ${concept.invalid_reason} is null
      )
      ;;
  }

  dimension: is_over_18 {
    group_label: "Rules - Cohort"
    label: "Is Over 18 (@ Condition Start)"
    type: yesno
    sql: ${condition_occurrence.condition_start_year} - ${person.year_of_birth} > 18  ;;
  }

  dimension: is_included {
    group_label: "Rules - Cohort"
    type: yesno
    sql: ${all_inclusions.inclusion} is not null ;;
  }
}

view: primary_events {
  derived_table: {
    datagroup_trigger: once_monthly
    explore_source: condition_occurrence {
      column: person_id {}
      column: condition_start_date {}
      column: condition_end_revised_date {}
      column: observation_period_start_date { field: observation_period.observation_period_start_date }
      column: observation_period_end_date { field: observation_period.observation_period_end_date }
      column: visit_occurrence_id {}
      filters: {
        field: cross_join.is_codeset_0
        value: "Yes"
      }
      derived_column: ordinal_rank {
        sql: row_number() OVER (partition by person_id ORDER BY condition_start_date) ;;
      }
    }
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${person_id},${visit_occurrence_id}) ;;
  }
  dimension: person_id {
    hidden: yes
    type: number
  }
  dimension: condition_start_date {
    hidden: yes
    type: date
  }
  dimension: condition_end_revised_date {
    hidden: yes
    type: date
  }
  dimension: observation_period_start_date {
    hidden: yes
    type: date
  }
  dimension: observation_period_end_date {
    hidden: yes
    type: date
  }
  dimension: visit_occurrence_id {
    hidden: yes
    type: number
  }
  dimension: ordinal_rank {
    group_label: "Rules - Cohort"
    label: "Event ID"
    description: "Ordinal Rank"
    type: number
  }
  dimension: is_primary_event {
    group_label: "Rules - Cohort"
    type: yesno
    sql: ${ordinal_rank} = 1 ;;
  }
  measure: count {
    hidden: yes
    type: count
  }
  measure: count_pk {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
  }
}

view: inclusion_0 {
  derived_table: {
    datagroup_trigger: once_monthly
    explore_source: condition_occurrence {
      column: person_id {}
      column: ordinal_rank { field: primary_events.ordinal_rank }
      derived_column: inclusion {
        sql: 'Lung Cancer Cohort' ;;
      }
      filters: {
        field: cross_join.is_over_18
        value: "Yes"
      }
    }
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${inclusion},${person_id}) ;;
  }
  dimension: inclusion {
    label: "Cohort Name"
    type: string
  }
  dimension: person_id {
    hidden: yes
    type: number
  }
  dimension: ordinal_rank {
    hidden: yes
    label: "Event ID"
    description: "Ordinal Rank"
    type: number
  }
  measure: count {
    hidden: yes
    type: count
  }
  measure: count_pk {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
  }
}

view: inclusion_1 {
  derived_table: {
    datagroup_trigger: once_monthly
    explore_source: condition_occurrence {
      column: person_id {}
      column: ordinal_rank { field: primary_events.ordinal_rank }
      derived_column: inclusion {
        sql: 'Lung Cancer Cohort' ;;
      }
      filters: {
        field: cross_join.is_codeset_1
        value: "Yes"
      }
      filters: {
        field: condition_occurrence.count_concept_id
        value: ">1"
      }
    }
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: concat(${inclusion},${person_id}) ;;
  }
  dimension: inclusion {
    label: "Cohort Name"
    type: string
  }
  dimension: person_id {
    hidden: yes
    type: number
  }
  dimension: ordinal_rank {
    hidden: yes
    label: "Event ID"
    description: "Ordinal Rank"
    type: number
  }
  measure: count {
    hidden: yes
    type: count
  }
  measure: count_pk {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
  }

}

# view: all_inclusions {
#   derived_table: {
#     datagroup_trigger: once_monthly
#     sql:
#       SELECT 'Cohort 0' as inclusion, person_id, ordinal_rank FROM ${inclusion_0.SQL_TABLE_NAME} UNION ALL
#       SELECT 'Cohort 1' as inclusion, person_id, ordinal_rank FROM ${inclusion_1.SQL_TABLE_NAME}
#     ;;
#   }
#
# }
