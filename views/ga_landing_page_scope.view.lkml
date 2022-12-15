view: ga_landing_page_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*` ;;

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }

  dimension_group: date {
    label: "Date"
    description: "Date of the sessions (YYYY-MM-DD)"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      time
    ]
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: device_category {
    label: "Device Category"
    description: "Device type: mobile / tablet / desktop"
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: landing_page_path {
    label: "Landing Page Path"
    description: "The first page in users' sessions, or the landing page"
    type: string
    sql: ${TABLE}.landing_page_path ;;
  }

  dimension: medium {
    label: "Medium"
    description: "Referral type : utm_medium campaign tracking parameter for Manual Campaign Tracking / cpc for Google Ads autotagging / organic if uses come from a search engine / referral if the referrer is not a search engine / (none) if referrer is empty"
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: source {
    label: "Source"
    description: "Source of the sessions"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: bounces {
    label: "Bounces"
    description: "The number of single page (or single interaction hit) sessions for the property"
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: session {
    label: "Sessions"
    description: "The number of sessions"
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: transaction_revenue {
    label: "Conversion Revenues"
    description: "The sale revenues (excluding shipping and tax) of conversions"
    type: number
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transaction {
    label: "Conversions"
    description: "The number of conversions"
    type: number
    sql: ${TABLE}.transaction ;;
  }

  dimension: transaction_shipping {
    label: "Shipping Cost"
    description: "The cost of shipping for the conversions"
    type: number
    sql: ${TABLE}.transaction_shipping ;;
  }

  dimension: transaction_tax {
    label: "Conversion Tax"
    description: "Total taxes for the conversions"
    type: number
    sql: ${TABLE}.transaction_tax ;;
  }

### KPI measures
  measure: total_bounces {
    label: "Total Bounces"
    description: "Sum of Total bounces"
    type: sum
    sql: ${TABLE}.bounces ;;
  }

  measure: total_sessions {
    label: "Total Sessions"
    description: "Sum of Total Sessions"
    type: sum
    sql: ${TABLE}.session ;;
  }

  measure: total_transaction_revenues {
    label: "Total Conversion Revenues"
    description: "Sum of Total Conversion Revenues"
    type: sum
    sql: ${TABLE}.transaction_revenue ;;
    value_format_name: eur_0
  }

  measure: total_transactions {
    label: "Total Conversions"
    description: "Sum of Total Conversions"
    type: sum
    sql: ${TABLE}.transaction ;;
  }

  measure: total_transaction_shipping {
    label: "Total Shipping Cost"
    description: "Sum of Total Shipping Cost for the conversions"
    type: sum
    sql: ${TABLE}.transaction_shipping ;;
    value_format_name: eur_0
  }

  measure: total_transaction_tax {
    label: "Total Conversion Tax"
    description: "Sum of Total Taxes for the conversions"
    type: sum
    sql: ${TABLE}.transaction_tax ;;
    value_format_name: eur_0
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    description: "Total Bounces / Total Sessions"
    type: number
    sql: nullif(${total_bounces},0)/nullif(${total_sessions},0) ;;
    value_format: "0.00%"
  }

  measure: conversion_rate {
    label: "Conversion Rate"
    description: "Total Transactions / Total Sessions"
    type: number
    sql: nullif(${total_transactions},0)/nullif(${total_sessions},0) ;;
    value_format: "0.00%"
  }

  measure: aov {
    label: "Average Order Values"
    description: "Total Revenues / Total Conversions"
    type: number
    sql: nullif(${total_transaction_revenues},0)/nullif(${total_transactions},0) ;;
    value_format_name: eur_0
  }

}
