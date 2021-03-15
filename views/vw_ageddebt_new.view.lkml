view: vw_ageddebt_new {
  view_label: "Aged Debt"
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
  }

  dimension: last_receipt_amount {
    type: number
    sql: ${TABLE}."LAST_RECEIPT_AMOUNT" ;;
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
    sql: ${TABLE}."LAST_RECEIPT_DATE" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: outstanding_amount {
    type: number
    sql: ${TABLE}."OUTSTANDING_AMOUNT" ;;
  }

  dimension: outstanding_credits {
    type: number
    sql: ${TABLE}."OUTSTANDING_CREDITS" ;;
  }

  dimension: period_number {
    type: number
    sql: ${TABLE}."PERIOD_NUMBER" ;;
  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  dimension: year_number {
    type: number
    sql: ${TABLE}."YEAR_NUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
