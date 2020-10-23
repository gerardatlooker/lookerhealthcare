connection: "lookerdata"

include: "/z_genome_mapping/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: genomics_mapping {
  label: "Summary Exercise"
  from: gene_variants5
}

explore: v3_genomes__chr17 {
  label: "Gene Level Data (Chorosome 17)"
  view_label: "Genome"

  join: v3_genomes__chr17__alternate_bases {
    view_label: "Genome: Alternate Bases"
    sql: , UNNEST(${v3_genomes__chr17.alternate_bases}) as v3_genomes__chr17__alternate_bases ;;
    relationship: one_to_one
  }

  join: v3_genomes__chr17__alternate_bases__vep {
    view_label: "Genome: Alternate Bases: Vep"
    sql: , UNNEST(${v3_genomes__chr17__alternate_bases.vep}) as v3_genomes__chr17__alternate_bases__vep ;;
    relationship: one_to_one
  }

  join: v3_genomes__chr17__call {
    fields: []
    view_label: "Genome: Call"
    sql: , UNNEST(${v3_genomes__chr17.call}) as v3_genomes__chr17__call ;;
    relationship: one_to_one
  }

}

explore: x1000_genomes_sample_info {
  label: "Population Information"
}

explore: family {}
