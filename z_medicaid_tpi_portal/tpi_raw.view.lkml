# # explore: tpi_raw {}
# view: tpi_raw {
#   sql_table_name: `lookerdata.medicaid_tpi_demo.tpi_raw`
#     ;;
#
# ################
# ### Original Dimensions
# ################
#
#   dimension: tpi_category {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.TPI_Category__ ;;
#   }
#
#   dimension: tpi_category_name {
#     type: string
#     sql: ${TABLE}.TPI_Category_Name ;;
#   }
#
# ################
# ### Derived Dimensions
# ################
#
# ################
# ### Measures
# ################
#
#   measure: count {
#     type: count
#     drill_fields: [tpi_category_name]
#   }
#
#   measure: count_pk {
#     type: count_distinct
#     sql: ${tpi_category} ;;
#   }
# }
