view: vw_ageddebt_payments {
  sql_table_name: "CC"."VW_AGEDDEBT_PAYMENTS"
    ;;

  dimension: customer_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
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

################################# MEASURES #############################

  measure: count {
    type: count
    drill_fields: []
  }
}
