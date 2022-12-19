include: "/views/common_metrics.view"
view: search_console_standard {
  sql_table_name: `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.SEARCHCONSOLE_STANDARD_*`;;
  extends: [common_metrics]

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: GENERATE_UUID() ;;
  }

  dimension_group: date {
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

  dimension: anchor {
    label: "Anchor"
    description: "The anchor extracted from the landing page URL"
    type: string
    sql: ${TABLE}.anchor ;;
  }

  dimension: branded_vs_nonbranded {
    label: "Branded vs Non-Branded"
    description: "Categorises search queries into branded or non-branded"
    type: string
    sql: ${TABLE}.branded_vs_nonbranded ;;
  }

  dimension: country_code {
    label: "Country Code"
    description: "3-letter country code (ISO 3166-1 alpha-3)"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: country_name {
    label: "Country"
    description: "Country Name"
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: data_source_name {
    label: "Data Source"
    description: "The name of the source for this data"
    type: string
    sql: ${TABLE}.data_source_name ;;
  }

  dimension: device {
    label: "Device"
    description: "Device type"
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: hostname {
    label: "Hostname"
    description: "Hostname extracted from the landing page URL"
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: page {
    label: "Page"
    description: "The landing page on your site"
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: pagepath {
    label: "Page Path"
    description: "Page path extracted from the landing page URL"
    type: string
    sql: ${TABLE}.pagepath ;;
  }

  dimension: pathlevel_1 {
    label: "Page Path Lvl 1"
    description: "Top-level directory extracted from the landing page URL"
    type: string
    sql: ${TABLE}.pathlevel_1 ;;
  }

  dimension: pathlevel_2 {
    label: "Page Path Lvl 2"
    description: "Directory path until the 2nd level extracted from the landing page URL"
    type: string
    sql: ${TABLE}.pathlevel_2 ;;
  }

  dimension: pathlevel_3 {
    label: "Page Path Lvl 3"
    description: "Directory path until the 3rd level extracted from the landing page URL"
    type: string
    sql: ${TABLE}.pathlevel_3 ;;
  }

  dimension: pathlevel_4 {
    label: "Page Path Lvl 4"
    description: "Directory path until the 4th level extracted from the landing page URL."
    type: string
    sql: ${TABLE}.pathlevel_4 ;;
  }

  dimension: account_name {
    label: "Account Name"
    description: "Account Name"
    type: string
    sql: ${TABLE}.account_name ;;
  }

  dimension: protocol {
    label: "Protocol"
    description: "Tansfer protocol extracted from the landing page URL"
    type: string
    sql: ${TABLE}.protocol ;;
  }

  dimension: query {
    label: "Query"
    description: "The search query that resulted in a search impression"
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: query_string {
    label: "Query String"
    description: "Query parameters extracted from the landing page URL"
    type: string
    sql: ${TABLE}.query_string ;;
  }

  dimension: search_type {
    label: "Search Type"
    description: "Separates web, image and mobile search"
    type: string
    sql: ${TABLE}.search_type ;;
  }

  dimension: words_in_query {
    label: "Words In Query"
    description: "Counts the number of words in a search query"
    type: string
    sql: ${TABLE}.words_in_query ;;
  }

  dimension: clicks {
    label: "Clicks"
    description: "The number of clicks"
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: impressions {
    label: "Impressions"
    description: "The number of impressions"
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: average_position {
    label: "Average Position"
    description: "Average organic position in Google search results"
    type: number
    sql: ${TABLE}.average_position ;;
  }


### KPI measures

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }



}
