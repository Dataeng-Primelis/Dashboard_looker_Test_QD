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

############### Date Set Up #######################
  dimension_group: session {
    label: " Sessions"
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  filter: choose_date{
    #templated filter
    type: date
    sql:  {% condition choose_date %}  timestamp(${session_date}) {% endcondition %} ;;
  }

  parameter: compare_to {
    #liquid parameter filter
    label: "Date Range Comparison"
    description: "Select the templated previous period you would like to compare to"
    type: unquoted
    default_value: "previous_period"
    allowed_value: {
      value: "previous_period"
      label: "vs Previous Period"
    }
    allowed_value: {
      value: "previous_year"
      label: "vs Previous Year"
    }
  }

  dimension_group: days_in_period {
    hidden: no
    type: duration
    intervals: [day,month,year]
    sql_start:{% date_start choose_date %}  ;;
    sql_end: {% date_end choose_date %} ;;
  }

  dimension: current_vs_previous {
    label: "Current vs Previous Period"
    description: "Compare current date period versus previous period"
    hidden: yes
    type: string
    sql: case when {% condition choose_date %} timestamp(${session_date}) {% endcondition %} then 'Current Period'
                when ${session_date} > (date_sub(date({% date_start choose_date %}),INTERVAL ${days_days_in_period} day ))
                and ${session_date} <= (date_sub(date({% date_end choose_date %}),INTERVAL ${days_days_in_period} day )) then 'Previous Period'
            end;;
  }

# This dimension creates the interval related to the current period and the previous year period.
  dimension: current_year_vs_previous_year {
    label: "Current Year vs Previous Year"
    description: "Compare current year period versus year"
    hidden: yes
    type: string
    sql:  case when {% condition choose_date %} timestamp(${session_date}) {% endcondition %} then 'Current Year'
                when ${session_date} > (date_sub(date({% date_start choose_date %}),INTERVAL 1 year ))
                 and ${session_date} <= (date_sub(date({% date_end choose_date %}),INTERVAL 1 year )) then 'Previous Year'
           end ;;
  }


  # This dimension is the one that should be selected in the explore/dashboard tile that's depend on the user's choice will show
  # the comparison between Previous Period or Previous Year Same period.
  dimension: selected_period {
    # view_label: "Parameters"
    description: "Select date comparison type"
    type: string
    sql: {% if compare_to._parameter_value == 'previous_period' %} ${current_vs_previous}
          {% elsif compare_to._parameter_value == 'previous_year' %} ${current_year_vs_previous_year}
          {% else %} ${current_vs_previous}
          {% endif %}
     ;;
  }

}
