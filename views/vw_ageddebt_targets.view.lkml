view: vw_ageddebt_targets {
  sql_table_name: "CC"."VW_AGEDDEBT_TARGETS"
    ;;

  dimension: ccg {
    type: string
    sql: ${TABLE}."CCG" ;;
  }

  dimension: h_desc {
    type: string
    sql: ${TABLE}."H_DESC" ;;
  }

  dimension: p1 {
    type: number
    sql: ${TABLE}."P1" ;;
  }

  dimension: p2 {
    type: number
    sql: ${TABLE}."P2" ;;
  }

  dimension: p3 {
    type: number
    sql: ${TABLE}."P3" ;;
  }

  dimension: p4 {
    type: number
    sql: ${TABLE}."P4" ;;
  }

  dimension: period_number {
    type: number
    sql: ${TABLE}."PERIOD_NUMBER" ;;
  }

  dimension: sales_code_h {
    primary_key: yes
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  dimension: year_number {
    type: number
    sql: ${TABLE}."YEAR_NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
