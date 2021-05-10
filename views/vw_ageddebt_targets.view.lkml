view: vw_ageddebt_targets {
  sql_table_name: "CC"."VW_AGEDDEBT_TARGETS"
    ;;

  dimension: ccg {
    type: string
    sql: ${TABLE}."CCG" ;;
  }

  dimension: controller_name {
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

#######################################################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_of_p1 {
    type: sum
    sql: ${p1} ;;
    value_format_name: gbp
  }

  measure: sum_of_p2 {
    type: sum
    sql: ${p2} ;;
    value_format_name: gbp
  }

  measure: sum_of_p3 {
    type: sum
    sql: ${p3} ;;
    value_format_name: gbp
  }

  measure: sum_of_p4 {
    type: sum
    sql: ${p4} ;;
    value_format_name: gbp
  }

  measure: sum_paymentperiods1_4 {
    label: "Sum of P1-P4"
    type: sum_distinct
    sql_distinct_key: ${sales_code_h} ;;
    sql: ${p1}+${p2}+${p3}+${p4} ;;
    value_format_name: gbp
##    drill_fields: [P1_P4_details*]

  }

}