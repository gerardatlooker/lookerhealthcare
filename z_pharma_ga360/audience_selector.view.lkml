
# view: audience_selector {
#   derived_table: {
#     datagroup_trigger: once_yearly
#     sql:
#           SELECT 'Aveeno CPC - First Time Users' as audience, 'www.aveeno.ca, fr.aveeno.ca' as hostname, 'CPC,cpc' as medium, NULL as source, 'New User' as usertype, NULL as timeonsite, NULL as dim63, NULL as dim66
# UNION ALL SELECT 'Tylenol - Returning Users' as audience, 'www.tylenol.ca, fr.tylenol.ca' as hostname, NULL as medium, NULL as source, 'Returning User' as usertype, NULL as timeonsite, NULL as dim63, NULL as dim66
# UNION ALL SELECT 'Test' as audience, 'Tylenol' as hostname, NULL as medium, NULL as source, 'Returning User' as usertype, NULL as timeonsite, NULL as dim63, NULL as dim66
# UNION ALL SELECT 'Test2' as audience, 'Tylenol, Zyrtec' as hostname, NULL as medium, NULL as source, 'Returning User' as usertype, NULL as timeonsite, NULL as dim63, NULL as dim66
#     ;;
#   }

#   parameter: audience_selection {
#     suggest_explore: filter_test
#     suggest_dimension: audience
#     suggest_persist_for:"5 hours"
#   }
#   dimension: audience {}
#   dimension: hostname {}
#   dimension: medium {}
#   dimension: source {}
#   dimension: usertype {}
#   dimension: timeonsite {}
#   # dimension: dim63 {}
#   # dimension: dim66 {}
# }
