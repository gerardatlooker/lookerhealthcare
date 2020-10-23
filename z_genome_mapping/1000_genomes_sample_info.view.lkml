view: x1000_genomes_sample_info {
  sql_table_name: `lookerdata.genomics.x1000_genomes_sample_info`
    ;;

  dimension: avuncular {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Avuncular ;;
  }

  dimension: dna_source_from_coriell {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.DNA_Source_from_Coriell ;;
  }

  dimension: e_indel_ratio {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.E_Indel_Ratio ;;
  }

  dimension: e_passed_qc {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.E_Passed_QC ;;
  }

  dimension: ebv_coverage {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.EBV_Coverage ;;
  }

  dimension: et_pilot_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.ET_Pilot_Centers ;;
  }

  dimension: et_pilot_platforms {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.ET_Pilot_Platforms ;;
  }

  dimension: family_id {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Family_ID ;;
  }

  dimension: gender {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: grandparents {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Grandparents ;;
  }

  dimension: half_siblings {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Half_Siblings ;;
  }

  dimension: has_affy_6_0_genotypes {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Affy_6_0_Genotypes ;;
  }

  dimension: has_axiom_genotypes {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Axiom_Genotypes ;;
  }

  dimension: has_exome_lof_genotypes {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Exome_LOF_Genotypes ;;
  }

  dimension: has_omni_genotypes {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Omni_Genotypes ;;
  }

  dimension: has_phase1_chr_mt_snps {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_phase1_chrMT_SNPs ;;
  }

  dimension: has_phase1_chr_y_deletions {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_phase1_chrY_Deletions ;;
  }

  dimension: has_phase1_chr_y_snps {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Phase1_chrY_SNPS ;;
  }

  dimension: has_sequence_from_blood_in_index {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Sequence_from_Blood_in_Index ;;
  }

  dimension: has_sequence_in_phase1 {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.Has_Sequence_in_Phase1 ;;
  }

  dimension: hc_pilot_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.HC_Pilot_Centers ;;
  }

  dimension: hc_pilot_platforms {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.HC_Pilot_Platforms ;;
  }

  dimension: in_exon_targetted_pilot {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.In_Exon_Targetted_Pilot ;;
  }

  dimension: in_final_phase_variant_calling {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.In_Final_Phase_Variant_Calling ;;
  }

  dimension: in_high_coverage_pilot {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.In_High_Coverage_Pilot ;;
  }

  dimension: in_low_coverage_pilot {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.In_Low_Coverage_Pilot ;;
  }

  dimension: in_phase1_integrated_variant_set {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.In_Phase1_Integrated_Variant_Set ;;
  }

  dimension: lc_indel_ratio {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.LC_Indel_Ratio ;;
  }

  dimension: lc_non_duplicated_aligned_coverage {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.LC_Non_Duplicated_Aligned_Coverage ;;
  }

  dimension: lc_passed_qc {
    group_label: "Other Information"
    type: yesno
    sql: ${TABLE}.LC_Passed_QC ;;
  }

  dimension: lc_pilot_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.LC_Pilot_Centers ;;
  }

  dimension: lc_pilot_platforms {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.LC_Pilot_Platforms ;;
  }

  dimension: main_project_e_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Main_Project_E_Centers ;;
  }

  dimension: main_project_e_platform {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Main_Project_E_Platform ;;
  }

  dimension: main_project_lc_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Main_project_LC_Centers ;;
  }

  dimension: main_project_lc_platform {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Main_project_LC_platform ;;
  }

  dimension: non_paternity {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Non_Paternity ;;
  }

  dimension: phase1_e_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Phase1_E_Centers ;;
  }

  dimension: phase1_e_platform {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Phase1_E_Platform ;;
  }

  dimension: phase1_lc_centers {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Phase1_LC_Centers ;;
  }

  dimension: phase1_lc_platform {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Phase1_LC_Platform ;;
  }

  dimension: population {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Population ;;
  }

  dimension: population_description {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Population_Description ;;
  }

  dimension: relationship {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Relationship ;;
  }

  dimension: sample {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Sample ;;
  }

  dimension: siblings {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Siblings ;;
  }

  dimension: super_population {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Super_Population ;;
    drill_fields: [population, gender, relationship]
  }

  dimension: super_population_description {
    group_label: " Population"
    type: string
    sql: ${TABLE}.Super_Population_Description ;;
    drill_fields: [population_description, gender, relationship]
  }

  dimension: third_order {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Third_Order ;;
  }

  dimension: total_exome_sequence {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.Total_Exome_Sequence ;;
  }

  dimension: total_lc_sequence {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.Total_LC_Sequence ;;
  }

  dimension: unexpected_parent_child {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Unexpected_Parent_Child ;;
  }

  dimension: unknown_second_order {
    group_label: "Other Information"
    type: string
    sql: ${TABLE}.Unknown_Second_Order ;;
  }

  dimension: verify_bam_e_affy_chip {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_E_Affy_Chip ;;
  }

  dimension: verify_bam_e_affy_free {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_E_Affy_Free ;;
  }

  dimension: verify_bam_e_omni_chip {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_E_Omni_Chip ;;
  }

  dimension: verify_bam_e_omni_free {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_E_Omni_Free ;;
  }

  dimension: verify_bam_lc_affy_chip {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_LC_Affy_Chip ;;
  }

  dimension: verify_bam_lc_affy_free {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_LC_Affy_Free ;;
  }

  dimension: verify_bam_lc_omni_chip {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_LC_Omni_Chip ;;
  }

  dimension: verify_bam_lc_omni_free {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.VerifyBam_LC_Omni_Free ;;
  }

  dimension: x_targets_covered_to_20x_or_greater {
    group_label: "Other Information"
    type: number
    sql: ${TABLE}.X_Targets_Covered_to_20x_or_greater ;;
  }

#################
### Derived Dimensions
#################

  dimension: generation {
    group_label: " Population"
    type: string
    sql:
      case
        when ${relationship} = 'child'  then 'Child'
        when ${relationship} = 'mother'  then 'Parent'
        when ${relationship} = 'father'  then 'Parent'
        when ${relationship} = ''  then 'Unknown'
        when ${relationship} = 'mat grandmother' then 'Grandparent'
        when ${relationship} = 'mat grandfather' then 'Grandparent'
        when ${relationship} = 'Child2' then 'Child'
        when ${relationship} = 'pat grandfather' then 'Grandparent'
        when ${relationship} = 'pat grandmother' then 'Grandparent'
        when ${relationship} = 'unrel' then 'Unknown'
        when ${relationship} = 'father; child' then 'Parent'
        when ${relationship} = 'child' then 'Child'
        when ${relationship} = 'child of 19764' then 'Child'
        when ${relationship} = 'paternal brother' then 'Child'
        when ${relationship} = 'maternal grandmother' then 'Grandparent'
        when ${relationship} = 'mat grandfather; father' then 'Grandparent'
        when ${relationship} = 'child of 19752' then 'Child'
        when ${relationship} = 'paternal father' then 'Parent'
        when ${relationship} = 'paternal grandmother' then 'Grandparent'
        when ${relationship} = 'daughter' then 'Child'
        when ${relationship} = 'mat grandmother; mother' then 'Grandparent'
        when ${relationship} = 'child of 19740' then 'Child'
      else 'Unknown'
      end
    ;;
    drill_fields: [relationship, gender]
  }

#################
### Measures
#################

#### Population ####

  measure: count {
    group_label: "Population"
    label: "Count Samples"
    type: count
    drill_fields: [drill*]
  }

  measure: count_families {
    group_label: "Population"
    type: count_distinct
    sql: ${family_id} ;;
    drill_fields: [drill*]
  }

  measure: samples_per_family {
    group_label: "Population"
    type: number
    sql: 1.0 * ${count} / nullif(${count_families},0) ;;
    value_format_name: decimal_1
  }

#### Gender ####

  measure: count_males {
    group_label: "Gender"
    type: count
    filters: [gender: "male"]
  }

  measure: count_females {
    group_label: "Gender"
    type: count
    filters: [gender: "female"]
  }

  measure: percent_male {
    group_label: "Gender"
    type: number
    sql: 1.0 * ${count_males} / nullif(${count},0) ;;
    value_format_name: percent_1
  }

  measure: percent_female {
    group_label: "Gender"
    type: number
    sql: 1.0 * ${count_females} / nullif(${count},0) ;;
    value_format_name: percent_1
  }

#### Generation ####

  measure: count_child {
    group_label: "Generation"
    type: count
    filters: [generation: "Child"]
  }

  measure: count_parents {
    group_label: "Generation"
    type: count
    filters: [generation: "Parent"]
  }

  measure: count_grandparents {
    group_label: "Generation"
    type: count
    filters: [generation: "Grandparent"]
  }

  measure: percent_child {
    group_label: "Generation"
    type: number
    sql: 1.0 * ${count_child} / nullif(${count},0) ;;
    value_format_name: percent_1
  }

  measure: percent_parent {
    group_label: "Generation"
    type: number
    sql: 1.0 * ${count_parents} / nullif(${count},0) ;;
    value_format_name: percent_1
  }

  measure: percent_grandparent {
    group_label: "Generation"
    type: number
    sql: 1.0 * ${count_grandparents} / nullif(${count},0) ;;
    value_format_name: percent_1
  }




  set: drill {
    fields: [
      sample,
      relationship,
      family_id,
      population_description,
      super_population_description
    ]
  }
}
