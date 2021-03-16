view: vw_ageddebt_new {
  view_label: "Aged Debt Base"
  sql_table_name: "CC"."VW_AGEDDEBT_NEW"
    ;;

  dimension: client_code {
    type: string
    sql: ${TABLE}."CLIENT_CODE" ;;
  }

  dimension: consol_code {
    type: string
    sql: ${TABLE}."CONSOL_CODE" ;;
  }

  dimension: customer_key {
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
  }

  dimension: journal_amount {
    type: number
    sql: ${TABLE}."JOURNAL_AMOUNT" ;;
    value_format_name: gbp
  }

  dimension: last_receipt_amount {
    type: number
    sql: ${TABLE}."LAST_RECEIPT_AMOUNT" ;;
    value_format_name: gbp
  }

  dimension_group: last_receipt {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LAST_RECEIPT_DATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: outstanding_amount {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMOUNT" ;;
    value_format_name: gbp
  }

  dimension: outstanding_credits {
    type: number
    sql: ${TABLE}."OUTSTANDING_CREDITS" ;;
    value_format_name: gbp
  }

  dimension: period_number {
    type: number
    sql: ${TABLE}."PERIOD_NUMBER" ;;
  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
    value_format_name: gbp
  }

  dimension: year_number {
    type: number
    sql: ${TABLE}."YEAR_NUMBER" ;;
  }


###########################   measures   #############################

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: sum_of_outstanding {
    type: sum
    sql: ${outstanding_amount} ;;
    value_format_name: gbp
    drill_fields: []
  }

  measure: sum_of_unallocated {
    type: sum
    sql: ${unallocated_amt} ;;
    value_format_name: gbp
  }

  measure: sum_of_credits {
    type: sum
    sql: ${outstanding_credits} ;;
    value_format_name: gbp
  }


}