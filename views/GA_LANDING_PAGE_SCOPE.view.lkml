view: ga_landing_page_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*` ;;

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: landing_page_path {
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: session {
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: transaction_revenue {
    type: number
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transaction {
    type: number
    sql: ${TABLE}.transaction ;;
  }

  dimension: transaction_shipping {
    type: number
    sql: ${TABLE}.transaction_shipping ;;
  }

  dimension: transaction_tax {
    type: number
    sql: ${TABLE}.transaction_tax ;;
  }

  set: detail {
    fields: [
      date,
      device_category,
      landing_page_path,
      medium,
      source,
      bounces,
      session,
      transaction_revenue,
      transaction,
      transaction_shipping,
      transaction_tax
    ]
  }
}
