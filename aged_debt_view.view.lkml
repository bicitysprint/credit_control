view: aged_debt_view {
  sql_table_name: CC.AGED_DEBT_VIEW ;;

  dimension: account_sc {
    hidden: yes
    type: string
    sql: ${TABLE}."ACCOUNT_SC" ;;
  }

  dimension: bank_account_no {
    label: "GF Code"
    type: string
    sql: ${TABLE}."BANK_ACCOUNT_NO" ;;
    drill_fields: [bank_account_no]
  }

  dimension: bank_name {
    hidden: yes
    type: string
    sql: ${TABLE}."BANK_NAME" ;;
  }

  dimension: c_desc {
    hidden: yes
    type: string
    sql: ${TABLE}."C_DESC" ;;
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

  dimension: cust_key {
    label: "Customer Key"
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
    drill_fields: [cust_key]
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}."CUSTOMER_TIER" ;;
    drill_fields: [customer_tier]
  }

  dimension: e_desc {
    label: "Salesperson"
    type: string
    sql: case
    when ${TABLE}."E_DESC" is null then 'NONE ASSIGNED'
    else ${TABLE}."E_DESC"
    END ;;
  }

  dimension: g_desc {
    label: "Account Manager"
    type: string
    sql: case
    when ${TABLE}."G_DESC" is null then 'NO ACCOUNT MANAGER'
    else ${TABLE}."G_DESC"
    END ;;
  }

  dimension: h_desc {
    label: "Credit Controller Name"
    type: string
    sql: case
    when ${TABLE}."H_DESC" = 'CUSTOMER DD ACCOUNTS' or "H_DESC" = 'CUSTOMER DD ACCS' then 'CUSTOMER DD ACCOUNTS'
   /*when ${TABLE}."H_DESC" = 'GAIL HAMEED' or "H_DESC" = 'GAIL HAMEED.' then 'GAIL HAMEED'*/
    when ${TABLE}."H_DESC" = 'GLYN COBB' or "H_DESC" = 'GLYN COBB.' then 'GLYN COBB'
    when ${TABLE}."H_DESC" = 'PRIMROSE ARTHURS' then 'PRIMROSE ARTHURS-WOOD'
    else ${TABLE}."H_DESC"
    END ;;
    drill_fields: [aged_debt_view.h_desc]
    link: {
      label: "See Aged Debt Records for {{value}}"
      url: "/dashboards/343?Controller%20Name={{value}}"
      icon_url: "https://looker.com/favicon.ico"
    }
    }

  dimension: invoice_contact_email {
    type: string
    sql: ${TABLE}."INVOICE_CONTACT_EMAIL" ;;
  }

  dimension: invoice_method {
    type: string
    sql: ${TABLE}."INVOICE_METHOD" ;;
  }

  dimension_group: latest_receipt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."LATEST_RECEIPT_DATE" ;;
  }

  dimension: date_formatted {
    label: "Latest Date of Receipt"
    sql:  ${latest_receipt_date} ;;
    html: {{rendered_value | date: "%d/%m/%Y" }} ;;
  }

  dimension_group: days_since_last_paid {
    label: "Since Last Paid"
    type: duration
    intervals: [day]
    sql_start: ${latest_receipt_date} ;;
    sql_end: CURRENT_DATE();;
    drill_fields: [cust_key]
  }


  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
    drill_fields: [name, sum]
  }

  dimension: office_code {
    type: string
    sql: ${TABLE}."OFFICE_CODE" ;;
  }

  dimension: period_amt_1 {
    label: "Over 30 Days"
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_1" ;;
  }

  dimension: period_amt_2 {
    label: "Over 60 Days"
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_2" ;;
  }

  dimension: period_amt_3 {
    label: "Over 90 Days"
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_3" ;;
  }

  dimension: period_amt_4 {
    label: "Over 120 Days"
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_4" ;;
  }

  dimension: period_amt_curr {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."PERIOD_AMT_CURR" ;;
  }

  dimension: pickup_contact {
    label: "Consol Code"
    type: string
    sql: ${TABLE}."PICKUP_CONTACT" ;;
    drill_fields: [pickup_contact]
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: sales_code_e {
    type: string
    sql: ${TABLE}."SALES_CODE_E" ;;
  }

  dimension: sales_code_f {
    type: string
    sql: ${TABLE}."SALES_CODE_F" ;;
  }

  dimension: sales_code_g {
    type: string
    sql: ${TABLE}."SALES_CODE_G" ;;
  }

  dimension: sales_code_h {
    type: string
    sql: ${TABLE}."SALES_CODE_H" ;;
  }

  dimension: split {
    type: string
    sql: ${TABLE}."SPLIT" ;;
  }

  dimension_group: start_date {
    label: "Account Start Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."START_DATE" ;;
  }

  dimension: account_date_formatted {
    sql:  ${start_date_date} ;;
    html: {{rendered_value | date: "%d/%m/%Y" }} ;;
  }

  dimension: total_latest_receipt_amount {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."TOTAL_LATEST_RECEIPT_AMOUNT" ;;
  }

  dimension: unallocated_amt {
    type: number
    value_format_name: gbp
    sql: ${TABLE}."UNALLOCATED_AMT" ;;
  }

  measure: count {
    type: count
    drill_fields: [bank_name, name]
  }

    measure: sum_p1 {
    type: sum
    sql: ${period_amt_1} ;;
  }

  measure: sum_p2 {
    type: sum
    sql: ${period_amt_2} ;;
  }

  measure: sum_p3 {
    type: sum
    sql: ${period_amt_3} ;;
    drill_fields: [sum_p3]
  }

  measure: sum_p4 {
    type: sum
    sql: ${period_amt_4} ;;
  }

  measure: sum_un {
    type: sum
    sql: ${unallocated_amt} ;;
  }

  measure: sum_curr {
    type: sum
    sql: ${period_amt_curr} ;;
  }

  measure: sum {
    type: sum
    value_format_name: gbp
    sql: ${period_amt_curr}+${period_amt_1}+${period_amt_2}+${period_amt_3}+${period_amt_4}+${unallocated_amt} ;;
  }
}
