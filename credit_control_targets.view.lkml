view: credit_control_targets {
  sql_table_name: CC.CREDIT_CONTROL_TARGETS ;;

  dimension: archive_month {
    type: string
    sql: ${TABLE}."ARCHIVE_MONTH" ;;
  }

  dimension: client_sales_code {
    type: string
    sql: ${TABLE}."Client_Sales_Code" ;;
  }

  dimension: controller_name {
    type: string
    sql: ${TABLE}."Controller Name" ;;
  }

  dimension: current {
    type: number
    sql: ${TABLE}."Current" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."Customer_Key" ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."Customer_Tier" ;;
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

  dimension: staff_sales_code {
    type: string
    sql: ${TABLE}."Staff_Sales_Code" ;;
  }

  measure: count {
    type: count
    drill_fields: [controller_name]
  }

  measure: sum  {
    type: sum
    sql: ${current}+${p1}+${p2}+${p3}+${p4} ;;
  }

  measure: sum_p1 {
    type: sum
    sql: ${p1} ;;
  }

  measure: sum_p2 {
    type: sum
    sql: ${p2} ;;
  }

  measure: sum_p3 {
    type: sum
    sql: ${p3} ;;
  }

  measure: sum_p4 {
    type: sum
    sql: ${p4} ;;
  }

  measure: sum_curr {
    type: sum
    sql: ${current} ;;
  }

}
