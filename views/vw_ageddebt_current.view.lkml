view: vw_ageddebt_current {
  sql_table_name: "CC"."VW_AGEDDEBT_CURRENT"
    ;;

  dimension: controller_name {
    type: string
    sql: case
    when ${TABLE}."CONTROLLER_NAME" = 'CUSTOMER DD ACCOUNTS' or "CONTROLLER _NAME" = 'CUSTOMER DD ACCS' then 'CUSTOMER DD ACCOUNTS'
    else ${TABLE}."CONTROLLER_NAME"
    END  ;;
  }

  dimension: curr {
    type: number
    sql: ${TABLE}."CURR" ;;
  }

  dimension: cust_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
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

  dimension: sales_code_h {
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  dimension: unallocated {
    type: number
    sql: ${TABLE}."UNALLOCATED" ;;
  }

############################################ MEASURES ##########################################

  measure: count {
    type: count
    drill_fields: [controller_name, name]
  }

  measure: sum_of_P1 {
    label: "P1_Current_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${TABLE}."P1" ;;
    value_format_name: gbp
  }

  measure: sum_of_P2 {
    label: "P2_Current_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${TABLE}."P2" ;;
    value_format_name: gbp
    drill_fields: [P2_Current_Sum*]
  }

  measure: sum_of_P3 {
    label: "P3_Current_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${TABLE}."P3" ;;
    value_format_name: gbp
    drill_fields: [P3_Current_Sum*]
  }

  measure: sum_of_P4 {
    label: "P4_Current_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${TABLE}."P4" ;;
    value_format_name: gbp
  }

  measure: sum_of_unallocated {
    label: "Unallocated_Sum"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${TABLE}."UNALLOCATED" ;;
    value_format_name: gbp
  }

  measure: sum_coll_periods1_4 {
    label: "Sum of P1-P4 less Unallocated"
    type: sum_distinct
    sql_distinct_key: ${cust_key} ;;
    sql: ${p1}+${p2}+${p3}+${p4}+${unallocated} ;;
    value_format_name: gbp
  }

############################### DRILL SETS #########################################

set: P2_Current_Sum {
  fields: [
    cust_key,
    name,
    p2
  ]
}

  set: P3_Current_Sum {
    fields: [
      cust_key,
      name,
      p3
    ]
  }



}
