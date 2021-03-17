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
    primary_key: yes
    type: string
    sql: ${TABLE}."CUSTOMER_KEY" ;;
    link: {
    label: "See Aged Debt Detail"
    url: "/dashboards-next/1006?Customer_Key={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
  }
    }
##    drill_fields: [customer_key]


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
    drill_fields: [outstanding_amount]
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

#  measure: total_outstanding {
#    type: sum
#    value_format_name: gbp
#    sql: ${outstanding_amount}-${outstanding_credits}+${unallocated_amt} ;;
#  }
}
