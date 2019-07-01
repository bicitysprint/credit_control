view: credit_control_targets {
  sql_table_name: CC.CREDIT_CONTROL_TARGETS ;;

  dimension: archive_month {
    type: number
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
    hidden: yes
    type: number
    sql: ${TABLE}."P1" ;;
  }

  dimension: p2 {
    hidden: yes
    type: number
    sql: ${TABLE}."P2" ;;
  }

  dimension: p3 {
    hidden: yes
    type: number
    sql: ${TABLE}."P3" ;;
  }

  dimension: p4 {
    hidden: yes
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
}
