view: search_console_standard {
  sql_table_name: `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.SEARCHCONSOLE_STANDARD_*`;;

  dimension: anchor {
    type: string
    sql: ${TABLE}.anchor ;;
  }

  dimension: branded_vs_nonbranded {
    type: string
    sql: ${TABLE}.branded_vs_nonbranded ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: data_source_name {
    type: string
    sql: ${TABLE}.data_source_name ;;
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: pagepath {
    type: string
    sql: ${TABLE}.pagepath ;;
  }

  dimension: pathlevel_1 {
    type: string
    sql: ${TABLE}.pathlevel_1 ;;
  }

  dimension: pathlevel_2 {
    type: string
    sql: ${TABLE}.pathlevel_2 ;;
  }

  dimension: pathlevel_3 {
    type: string
    sql: ${TABLE}.pathlevel_3 ;;
  }

  dimension: pathlevel_4 {
    type: string
    sql: ${TABLE}.pathlevel_4 ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: protocol {
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_string {
    type: string
    sql: ${TABLE}.query_string ;;
  }

  dimension: search_type {
    type: string
    sql: ${TABLE}.search_type ;;
  }

  dimension: words_in_query {
    type: string
    sql: ${TABLE}.words_in_query ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.average_position ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }

}
