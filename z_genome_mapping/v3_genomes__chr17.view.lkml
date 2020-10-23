view: v3_genomes__chr17 {
  sql_table_name: `lookerdata.genomics.v3_genomes__chr17`
    ;;

  dimension: alternate_bases {
    group_label: "Z - Other Inforation"
    hidden: yes
    sql: ${TABLE}.alternate_bases ;;
  }

  dimension: an {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN ;;
  }

  dimension: an_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_afr ;;
  }

  dimension: an_afr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_afr_female ;;
  }

  dimension: an_afr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_afr_male ;;
  }

  dimension: an_ami {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_ami ;;
  }

  dimension: an_ami_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_ami_female ;;
  }

  dimension: an_ami_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_ami_male ;;
  }

  dimension: an_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_amr ;;
  }

  dimension: an_amr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_amr_female ;;
  }

  dimension: an_amr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_amr_male ;;
  }

  dimension: an_asj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_asj ;;
  }

  dimension: an_asj_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_asj_female ;;
  }

  dimension: an_asj_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_asj_male ;;
  }

  dimension: an_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_eas ;;
  }

  dimension: an_eas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_eas_female ;;
  }

  dimension: an_eas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_eas_male ;;
  }

  dimension: an_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_female ;;
  }

  dimension: an_fin {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_fin ;;
  }

  dimension: an_fin_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_fin_female ;;
  }

  dimension: an_fin_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_fin_male ;;
  }

  dimension: an_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_male ;;
  }

  dimension: an_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_nfe ;;
  }

  dimension: an_nfe_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_nfe_female ;;
  }

  dimension: an_nfe_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_nfe_male ;;
  }

  dimension: an_oth {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_oth ;;
  }

  dimension: an_oth_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_oth_female ;;
  }

  dimension: an_oth_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_oth_male ;;
  }

  dimension: an_raw {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_raw ;;
  }

  dimension: an_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_sas ;;
  }

  dimension: an_sas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_sas_female ;;
  }

  dimension: an_sas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AN_sas_male ;;
  }

  dimension: as_vqslod {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AS_VQSLOD ;;
  }

  dimension: call {
    group_label: "Z - Other Inforation"
    hidden: yes
    sql: ${TABLE}.call ;;
  }

  dimension: culprit {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.culprit ;;
  }

  dimension: dp {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.DP ;;
  }

  dimension: end_position {
    # group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.end_position ;;
  }

  dimension: faf95_adj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_adj ;;
  }

  dimension: faf99_adj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_adj ;;
  }

  dimension: filter {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.filter ;;
  }

  dimension: fs {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.FS ;;
  }

  dimension: inbreeding_coeff {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.InbreedingCoeff ;;
  }

  dimension: lcr {
    group_label: "Z - Other Inforation"
    type: yesno
    sql: ${TABLE}.lcr ;;
  }

  dimension: mq {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.MQ ;;
  }

  dimension: mq_dp {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.MQ_DP ;;
  }

  dimension: mqrank_sum {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.MQRankSum ;;
  }

  dimension: names {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.names ;;
  }

  dimension: negative_train_site {
    group_label: "Z - Other Inforation"
    type: yesno
    sql: ${TABLE}.NEGATIVE_TRAIN_SITE ;;
  }

  dimension: non_par {
    group_label: "Z - Other Inforation"
    type: yesno
    sql: ${TABLE}.non_par ;;
  }

  dimension: positive_train_site {
    group_label: "Z - Other Inforation"
    type: yesno
    sql: ${TABLE}.POSITIVE_TRAIN_SITE ;;
  }

  dimension: qd {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.QD ;;
  }

  dimension: quality {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.quality ;;
  }

  dimension: raw_mq {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.RAW_MQ ;;
  }

  dimension: read_pos_rank_sum {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.ReadPosRankSum ;;
  }

  dimension: reference_bases {
    # group_label: "Z - Other Inforation"
    type: string
    sql: substr(${TABLE}.reference_bases,0,20) ;;
  }

  dimension: reference_name {
    # group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.reference_name ;;
  }

  dimension: sb {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.SB ;;
  }

  dimension: sor {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.SOR ;;
  }

  dimension: start_position {
    # group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.start_position ;;
  }

  dimension: var_dp {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.VarDP ;;
  }

  dimension: variant_type {
    # group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.variant_type ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [reference_name]
  }

  measure: count_allele_samples {
    label: " Count Patients"
    type: average
    sql: ${an} ;;
    value_format_name: decimal_0
  }

  measure: percent_allele_mutations {
    label: " Mutation Rate"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations} / nullif(${count_allele_samples},0) ;;
    value_format_name: percent_1
  }

  measure: count_allele_samples_eas {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (East Asian)"
    type: average
    sql: ${an_eas_female} + ${an_eas_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_sas {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (South Asian)"
    type: average
    sql: ${an_sas_female} + ${an_sas_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_nfe {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (European)"
    type: average
    sql: ${an_nfe_female} + ${an_nfe_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_afr {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (African / African American)"
    type: average
    sql: ${an_afr_female} + ${an_afr_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_amr {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (Latino)"
    type: average
    sql: ${an_amr_female} + ${an_amr_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_male {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (Male)"
    type: average
    sql: ${an_eas_male} + ${an_sas_male} + ${an_nfe_male} + ${an_afr_male} + ${an_amr_male}  ;;
    value_format_name: decimal_0
  }

  measure: count_allele_samples_female {
    group_label: "Ethnicity & Gender: Count Patients"
    label: "Count Patients (Female)"
    type: average
    sql: ${an_eas_female} + ${an_sas_female} + ${an_nfe_female} + ${an_afr_female} + ${an_amr_female}  ;;
    value_format_name: decimal_0
  }

  measure: percent_allele_mutations_eas {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (East Asian)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_eas} / nullif(${count_allele_samples_eas},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_sas {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (South Asian)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_sas} / nullif(${count_allele_samples_sas},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_nfe {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (European)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_nfe} / nullif(${count_allele_samples_nfe},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_afr {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (African / African American)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_afr} / nullif(${count_allele_samples_afr},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_amr {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (Latino)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_amr} / nullif(${count_allele_samples_amr},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_male {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (Male)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_male} / nullif(${count_allele_samples_male},0);;
    value_format_name: percent_1
  }

  measure: percent_allele_mutations_female {
    group_label: "Ethnicity & Gender: Mutation Rate"
    label: "Mutation Rate (Female)"
    type: number
    sql: 1.0 * ${v3_genomes__chr17__alternate_bases.count_allele_mutations_female} / nullif(${count_allele_samples_female},0);;
    value_format_name: percent_1
  }

  measure: difference_between_men_and_women {
    type: number
    sql: coalesce(${percent_allele_mutations_male},0) - coalesce(${percent_allele_mutations_female},0) ;;
    value_format_name: percent_1

  }


}

view: v3_genomes__chr17__alternate_bases {
  dimension: ac {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC ;;
  }

  dimension: ac_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_afr ;;
  }

  dimension: ac_afr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_afr_female ;;
  }

  dimension: ac_afr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_afr_male ;;
  }

  dimension: ac_ami {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_ami ;;
  }

  dimension: ac_ami_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_ami_female ;;
  }

  dimension: ac_ami_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_ami_male ;;
  }

  dimension: ac_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_amr ;;
  }

  dimension: ac_amr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_amr_female ;;
  }

  dimension: ac_amr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_amr_male ;;
  }

  dimension: ac_asj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_asj ;;
  }

  dimension: ac_asj_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_asj_female ;;
  }

  dimension: ac_asj_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_asj_male ;;
  }

  dimension: ac_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_eas ;;
  }

  dimension: ac_eas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_eas_female ;;
  }

  dimension: ac_eas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_eas_male ;;
  }

  dimension: ac_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_female ;;
  }

  dimension: ac_fin {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_fin ;;
  }

  dimension: ac_fin_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_fin_female ;;
  }

  dimension: ac_fin_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_fin_male ;;
  }

  dimension: ac_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_male ;;
  }

  dimension: ac_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_nfe ;;
  }

  dimension: ac_nfe_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_nfe_female ;;
  }

  dimension: ac_nfe_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_nfe_male ;;
  }

  dimension: ac_oth {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_oth ;;
  }

  dimension: ac_oth_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_oth_female ;;
  }

  dimension: ac_oth_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_oth_male ;;
  }

  dimension: ac_raw {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_raw ;;
  }

  dimension: ac_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_sas ;;
  }

  dimension: ac_sas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_sas_female ;;
  }

  dimension: ac_sas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AC_sas_male ;;
  }

  dimension: af {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF ;;
  }

  dimension: af_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_afr ;;
  }

  dimension: af_afr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_afr_female ;;
  }

  dimension: af_afr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_afr_male ;;
  }

  dimension: af_ami {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_ami ;;
  }

  dimension: af_ami_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_ami_female ;;
  }

  dimension: af_ami_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_ami_male ;;
  }

  dimension: af_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_amr ;;
  }

  dimension: af_amr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_amr_female ;;
  }

  dimension: af_amr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_amr_male ;;
  }

  dimension: af_asj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_asj ;;
  }

  dimension: af_asj_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_asj_female ;;
  }

  dimension: af_asj_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_asj_male ;;
  }

  dimension: af_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_eas ;;
  }

  dimension: af_eas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_eas_female ;;
  }

  dimension: af_eas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_eas_male ;;
  }

  dimension: af_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_female ;;
  }

  dimension: af_fin {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_fin ;;
  }

  dimension: af_fin_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_fin_female ;;
  }

  dimension: af_fin_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_fin_male ;;
  }

  dimension: af_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_male ;;
  }

  dimension: af_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_nfe ;;
  }

  dimension: af_nfe_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_nfe_female ;;
  }

  dimension: af_nfe_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_nfe_male ;;
  }

  dimension: af_oth {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_oth ;;
  }

  dimension: af_oth_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_oth_female ;;
  }

  dimension: af_oth_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_oth_male ;;
  }

  dimension: af_raw {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_raw ;;
  }

  dimension: af_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_sas ;;
  }

  dimension: af_sas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_sas_female ;;
  }

  dimension: af_sas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.AF_sas_male ;;
  }

  dimension: alt {
   # group_label: "Z - Other Inforation"
  label: "Alternate Base"
    type: string
    sql: substr(${TABLE}.alt,0,20)  ;;
  }

  dimension: faf95_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_afr ;;
  }

  dimension: faf95_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_amr ;;
  }

  dimension: faf95_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_eas ;;
  }

  dimension: faf95_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_nfe ;;
  }

  dimension: faf95_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf95_sas ;;
  }

  dimension: faf99_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_afr ;;
  }

  dimension: faf99_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_amr ;;
  }

  dimension: faf99_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_eas ;;
  }

  dimension: faf99_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_nfe ;;
  }

  dimension: faf99_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.faf99_sas ;;
  }

  dimension: n_alt_alleles {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.n_alt_alleles ;;
  }

  dimension: nhomalt {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt ;;
  }

  dimension: nhomalt_afr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_afr ;;
  }

  dimension: nhomalt_afr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_afr_female ;;
  }

  dimension: nhomalt_afr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_afr_male ;;
  }

  dimension: nhomalt_ami {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_ami ;;
  }

  dimension: nhomalt_ami_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_ami_female ;;
  }

  dimension: nhomalt_ami_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_ami_male ;;
  }

  dimension: nhomalt_amr {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_amr ;;
  }

  dimension: nhomalt_amr_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_amr_female ;;
  }

  dimension: nhomalt_amr_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_amr_male ;;
  }

  dimension: nhomalt_asj {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_asj ;;
  }

  dimension: nhomalt_asj_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_asj_female ;;
  }

  dimension: nhomalt_asj_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_asj_male ;;
  }

  dimension: nhomalt_eas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_eas ;;
  }

  dimension: nhomalt_eas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_eas_female ;;
  }

  dimension: nhomalt_eas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_eas_male ;;
  }

  dimension: nhomalt_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_female ;;
  }

  dimension: nhomalt_fin {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_fin ;;
  }

  dimension: nhomalt_fin_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_fin_female ;;
  }

  dimension: nhomalt_fin_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_fin_male ;;
  }

  dimension: nhomalt_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_male ;;
  }

  dimension: nhomalt_nfe {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_nfe ;;
  }

  dimension: nhomalt_nfe_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_nfe_female ;;
  }

  dimension: nhomalt_nfe_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_nfe_male ;;
  }

  dimension: nhomalt_oth {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_oth ;;
  }

  dimension: nhomalt_oth_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_oth_female ;;
  }

  dimension: nhomalt_oth_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_oth_male ;;
  }

  dimension: nhomalt_raw {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_raw ;;
  }

  dimension: nhomalt_sas {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_sas ;;
  }

  dimension: nhomalt_sas_female {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_sas_female ;;
  }

  dimension: nhomalt_sas_male {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.nhomalt_sas_male ;;
  }

  dimension: vep {
    group_label: "Z - Other Inforation"
    hidden: yes
    sql: ${TABLE}.vep ;;
  }

  measure: count_allele_mutations {
    label: " Patients with Mutations"
    type: average
    sql: ${ac} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_eas {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (East Asian)"
    type: average
    sql: ${ac_eas_female} + ${ac_eas_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_sas {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (South Asian)"
    type: average
    sql: ${ac_sas_female} + ${ac_sas_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_nfe {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (European)"
    type: average
    sql: ${ac_nfe_female} + ${ac_nfe_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_afr {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (African / African American)"
    type: average
    sql: ${ac_afr_female} + ${ac_afr_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_amr {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (Latino)"
    type: average
    sql: ${ac_amr_female} + ${ac_amr_male} ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_male {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (Male)"
    type: average
    sql: ${ac_eas_male} + ${ac_sas_male} + ${ac_nfe_male} + ${ac_afr_male} + ${ac_amr_male}  ;;
    value_format_name: decimal_0
  }

  measure: count_allele_mutations_female {
    group_label: "Ethnicity & Gender: Patients with Mutations"
    label: "Patients with Mutations (Female)"
    type: average
    sql: ${ac_eas_female} + ${ac_sas_female} + ${ac_nfe_female} + ${ac_afr_female} + ${ac_amr_female}  ;;
    value_format_name: decimal_0
  }


}

view: v3_genomes__chr17__alternate_bases__vep {
  dimension: allele {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.allele ;;
  }

  dimension: biotype {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.BIOTYPE ;;
  }

  dimension: consequence {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.Consequence ;;
  }

  dimension: empty {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.empty ;;
  }

  dimension: exon {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.EXON ;;
  }

  dimension: feature {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.Feature ;;
  }

  dimension: feature_type {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.Feature_type ;;
  }

  dimension: gene {
    # group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.Gene ;;
  }

  dimension: impact {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.IMPACT ;;
  }

  dimension: intron {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.INTRON ;;
  }

  dimension: symbol {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.SYMBOL ;;
  }
}

view: v3_genomes__chr17__call {
  dimension: genotype {
    group_label: "Z - Other Inforation"
    type: number
    sql: ${TABLE}.genotype ;;
  }

  dimension: name {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phaseset {
    group_label: "Z - Other Inforation"
    type: string
    sql: ${TABLE}.phaseset ;;
  }
}
