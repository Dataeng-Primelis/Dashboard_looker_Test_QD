view: common_metrics {

  measure: total_clicks {
    label: "Total Clicks"
    description: "Sum of Total Clicks"
    type: sum
    sql: ${TABLE}.clicks ;;
    value_format: "#,##0"
  }

  measure: total_impressions {
    label: "Total Impressions"
    description: "Sum of Total Impressions"
    type: sum
    sql: ${TABLE}.impressions ;;
    value_format: "#,##0"
  }

  measure: total_bounces {
    label: "Total Bounces"
    description: "Sum of Total Bounces"
    type: sum
    sql: ${TABLE}.bounces ;;
    value_format: "#,##0"
  }

  measure: total_sessions {
    label: "Total Sessions"
    description: "Sum of Total Sessions"
    type: sum
    sql: ${TABLE}.session ;;
    value_format: "#,##0"
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
    value_format: "#,##0"
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

  measure: total_item_revenues {
    label: "Total Product Revenues"
    description: "Sum of Total Product Item Revenues"
    type: sum
    sql: ${TABLE}.item_revenue ;;
    value_format_name: eur_0
  }


}
