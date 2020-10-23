view: family {
  sql_table_name: `lookerdata.genomics.family`
    ;;

  dimension: brothers {
    type: number
    sql: ${TABLE}.brothers ;;
  }

  dimension: children {
    type: number
    sql: ${TABLE}.children ;;
  }

  dimension: diagnosis {
    type: string
    sql: ${TABLE}.diagnosis ;;
  }

  dimension: fathers {
    type: number
    sql: ${TABLE}.fathers ;;
  }

  dimension: maternal_grandparents {
    type: number
    sql: ${TABLE}.maternal_grandparents ;;
  }

  dimension: mothers {
    type: number
    sql: ${TABLE}.mothers ;;
  }

  dimension: paternal_grandparents {
    type: number
    sql: ${TABLE}.paternal_grandparents ;;
  }

  dimension: sisters {
    type: number
    sql: ${TABLE}.sisters ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
