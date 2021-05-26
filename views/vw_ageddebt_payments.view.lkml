view: vw_ageddebt_payments {
  sql_table_name: "CC"."VW_AGEDDEBT_PAYMENTS"
    ;;

  dimension: CCG  {
    type: string
    sql: ${TABLE}."CCG" ;;
  }

  dimension: controller_name {
    label: "Controller"
    type: string
    sql: ${TABLE}."CONTROLLER_NAME" ;;
  }

  dimension: customer_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension_group: payment_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PAYMENT_DATE" ;;
  }


  dimension: paymentcurrent {
    type: number
    sql: ${TABLE}."PAYMENTCURRENT" ;;
  }

  dimension: paymentperiod1 {
    type: number
    sql: ${TABLE}."PAYMENTPERIOD1" ;;
  }

  dimension: paymentperiod2 {
    type: number
    sql: ${TABLE}."PAYMENTPERIOD2" ;;
  }

  dimension: paymentperiod3 {
    type: number
    sql: ${TABLE}."PAYMENTPERIOD3" ;;
  }

  dimension: paymentperiod4 {
    type: number
    sql: ${TABLE}."PAYMENTPERIOD4" ;;
  }

  dimension: transaction_key {
    type: string
    sql: ${TABLE}."TRANSACTION_KEY" ;;
  }


################################# MEASURES #############################

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_paymentperiod2 {
    type: sum_distinct
    sql_distinct_key: ${transaction_key} ;;
    sql: ${paymentperiod2} ;;
    value_format_name: gbp
##    drill_fields: [P2_details*]
##    drill_fields: [controller_name, archive_month, customer_key, customer_tier, sum_p2]
  }

  measure: sum_paymentperiod3 {
    type: sum_distinct
    sql_distinct_key: ${transaction_key} ;;
    sql: ${paymentperiod3} ;;
    value_format_name: gbp
##    drill_fields: [P3_details*]
##    drill_fields: [controller_name, archive_month, customer_key, customer_tier, sum_p2]
  }

  measure: sum_paymentperiods1_4 {
    type: sum_distinct
    sql_distinct_key: ${transaction_key} ;;
    sql: ${paymentperiod1}+${paymentperiod2}+${paymentperiod3}+${paymentperiod4} ;;
    value_format_name: gbp
##    drill_fields: [P1_P4_details*]

  }


}
