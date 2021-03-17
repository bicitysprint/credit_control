view: vw_ageddebt_salecode_desc {
  sql_table_name: "CC"."VW_AGEDDEBT_SALECODE_DESC"
    ;;

  dimension: c_desc {
    type: string
    sql: ${TABLE}."C_DESC" ;;
  }

  dimension: cust_key {
    primary_key: yes
    type: string
    sql: ${TABLE}."CUST_KEY" ;;
  }

  dimension: e_desc {
    type: string
    sql: ${TABLE}."E_DESC" ;;
  }

  dimension: f_desc {
    type: string
    sql: ${TABLE}."F_DESC" ;;
  }

  dimension: g_desc {
    type: string
    sql: ${TABLE}."G_DESC" ;;
  }

  dimension: h_desc {
    type: string
    sql: ${TABLE}."H_DESC" ;;
  }

  dimension: sales_code_c {
    type: string
    sql: ${TABLE}."SALES_CODE_C" ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
