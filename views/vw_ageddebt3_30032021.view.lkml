view: vw_ageddebt3_30032021 {
  sql_table_name: "CC"."VW_AGEDDEBT3_30032021"
    ;;

  dimension: amt_to_unallocated {
    type: number
    sql: ${TABLE}."AMT_TO_UNALLOCATED" ;;
    value_format_name: gbp
  }

  dimension: brought_fwd_amt {
    type: number
    sql: ${TABLE}."BROUGHT_FWD_AMT" ;;
    value_format_name: gbp
  }

  dimension: brought_fwd_amt2 {
    type: number
    sql: ${TABLE}."BROUGHT_FWD_AMT_INV_ONLY" ;;
    value_format_name: gbp
  }

  dimension: client_code {
    type: string
    sql: ${TABLE}."CLIENT_CODE" ;;
  }

  dimension: consol_code {
    type: string
    sql: ${TABLE}."CONSOL_CODE" ;;
  }

  dimension: credit_card_flag {
    label: "Credit Card Flag (Y/N)"
    type: string
    sql: case
         when ${TABLE}."CREDIT_CARD_FLAG" = 'F' then 'Y'
         when ${TABLE}."CREDIT_CARD_FLAG" IS NULL then 'N'
         else ${TABLE}."CREDIT_CARD_FLAG"
         END ;;
  }

  dimension: credcurrent {
    type: number
    sql: ${TABLE}."CREDCURRENT" ;;
  }

  dimension: credperiod1 {
    type: number
    sql: ${TABLE}."CREDPERIOD1" ;;
  }

  dimension: credperiod2 {
    type: number
    sql: ${TABLE}."CREDPERIOD2" ;;
  }

  dimension: credperiod3 {
    type: number
    sql: ${TABLE}."CREDPERIOD3" ;;
  }

  dimension: credperiod4 {
    type: number
    sql: ${TABLE}."CREDPERIOD4" ;;
  }

  dimension: curr {
    type: number
    sql: ${TABLE}."CURR" ;;
    value_format_name: gbp
  }

  dimension: current_ {
    type: number
    sql: ${TABLE}."CURRENT_" ;;
    value_format_name: gbp
  }

  dimension: current_flag {
    type: string
    sql: ${TABLE}."CURRENT_FLAG" ;;
  }

  dimension: cust_email {
    type: string
    sql: ${TABLE}."CUST_EMAIL" ;;
  }

  dimension: cust_status {
    type: string
    sql: ${TABLE}."CUST_STATUS" ;;
  }

  dimension: days_since_receipt {
    label: "Days Since Last Receipt"
    type: string
    sql: case
          when ${TABLE}."DAYS_SINCE_RECEIPT" IS NULL then '0'
          else ${TABLE}."DAYS_SINCE_RECEIPT"
          END ;;
  }

  dimension: chase_status {
    type: string
    sql: case
          when ${days_since_receipt} >= '1' AND ${days_since_receipt} <= '34' then 'STANDARD'
          when ${days_since_receipt} >= '35' AND ${days_since_receipt} <= '45' then 'URGENT'
          when ${days_since_receipt} > '45' AND ${days_since_receipt} < '5500' then 'FINAL DEMAND'
          when ${days_since_receipt} = '0' then 'UNKNOWN'
          else NULL
          END ;;
  }


  dimension: id_inkey_in_cukey {
    label: "Customer Key"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID_INKEY_IN_CUKEY" ;;
    link: {
      label: "See Aged Debt Detail"
      url: "/dashboards-next/1187?Customer%20Key={{ value }}"
      icon_url: "https://looker.com/favicon.ico"
    }
  }

  dimension: last_recpt_amt {
    type: number
    sql: ${TABLE}."LAST_RECPT_AMT" ;;
    value_format_name: gbp
  }

  dimension_group: last_recpt {
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
    sql: ${TABLE}."LAST_RECPT_DATE" ;;
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

  dimension: p1 {
    type: number
    sql: ${TABLE}."P1" ;;
    value_format_name: gbp
  }

  dimension: p2 {
    type: number
    sql: ${TABLE}."P2" ;;
    value_format_name: gbp
  }

  dimension: p3 {
    type: number
    sql: ${TABLE}."P3" ;;
    value_format_name: gbp
  }

  dimension: p4 {
    type: number
    sql: ${TABLE}."P4" ;;
    value_format_name: gbp
  }

  dimension: period1 {
    type: number
    sql: ${TABLE}."PERIOD1" ;;
    value_format_name: gbp
  }

  dimension: period2 {
    type: number
    sql: ${TABLE}."PERIOD2" ;;
    value_format_name: gbp
  }

  dimension: period3 {
    type: number
    sql: ${TABLE}."PERIOD3" ;;
    value_format_name: gbp
  }

  dimension: period4 {
    type: number
    sql: ${TABLE}."PERIOD4" ;;
    value_format_name: gbp
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: terms {
    type: number
    sql: ${TABLE}."TERMS" ;;
  }

  dimension: true_aged_days {
    type: number
    sql: ${TABLE}."TRUE_AGED_DAYS" ;;
  }

  dimension: unallocated_amt {
    type: number
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
    value_format_name: gbp
  }


############################# MEASURES ####################################

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: sum_p2 {
    type: sum_distinct
    sql_distinct_key: ${id_inkey_in_cukey} ;;
    sql: ${p2} ;;
    value_format_name: gbp
    drill_fields: [P2_details*]
##    drill_fields: [controller_name, archive_month, customer_key, customer_tier, sum_p2]
  }

  measure: sum_p3 {
    type: sum_distinct
    sql_distinct_key: ${id_inkey_in_cukey} ;;
    sql: ${p3} ;;
    value_format_name: gbp
    drill_fields: [P3_details*]
##    drill_fields: [controller_name, archive_month, customer_key, customer_tier, sum_p2]
  }

  measure: sum_p1_p4 {
    type: sum_distinct
    sql_distinct_key: ${id_inkey_in_cukey} ;;
    sql: ${p1}+${p2}+${p3}+${p4}-${unallocated_amt} ;;
    value_format_name: gbp
    drill_fields: [P1_P4_details*]

  }



############################## DRILL SETS ##################################

  set: P2_details {
    fields: [
      id_inkey_in_cukey,
      name,
      vw_ageddebt_salecode_desc.view.f_desc,
      p2,
      ]
  }

  set: P3_details {
    fields: [
      id_inkey_in_cukey,
      name,
      vw_ageddebt_salecode_desc.view.f_desc,
      p3,
    ]
  }

  set: P1_P4_details {
    fields: [
      id_inkey_in_cukey,
      name,
      vw_ageddebt_salecode_desc.view.f_desc,
      p1,
      p2,
      p3,
      p4,
      unallocated_amt,
    ]
  }

}
