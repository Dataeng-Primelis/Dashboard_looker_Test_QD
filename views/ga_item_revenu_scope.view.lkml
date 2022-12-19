include: "/views/common_metrics.view"
view: ga_item_revenu_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_ITEMREVENU_SCOPE_PRODUCT_*`;;
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

  dimension: device_category {
    label: "Device Category"
    description: "Device type: mobile / tablet / desktop"
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: medium {
    label: "Medium"
    description: "Referral type : utm_medium campaign tracking parameter for Manual Campaign Tracking / cpc for Google Ads autotagging / organic if uses come from a search engine / referral if the referrer is not a search engine / (none) if referrer is empty"
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: product_category_hierarchy {
    label: "Product Category Hierarchy"
    description: "Classified product hierarchical category (Enhanced Ecommerce)"
    type: string
    sql: ${TABLE}.product_category_hierarchy ;;
  }

  dimension: product_name {
    label: "Product"
    description: "Product name"
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: source {
    label: "Source"
    description: "Source of the sessions"
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: item_revenues {
    label: "Product Item Revenues"
    description: "Revenue from purchased product items"
    type: number
    sql: ${TABLE}.item_revenue ;;
  }

### Customized dimensions
  dimension: prd_univers_catalog_lv1 {
    label: "Product Universal Catalog Lvl 1"
    description: "Product universal catalog on 1st level : Femme / Homme / Enfant / Beauté / Maison / Autre"
    type: string
    sql: CASE WHEN REGEXP_EXTRACT(product_category_hierarchy,"([^/]+)/+") IS NOT NULL THEN REGEXP_EXTRACT(product_category_hierarchy,"([^/]+)/+")
              ELSE "Autre"
          END;;
  }

  dimension: prd_univers_catalog_lv2 {
    label: "Product Universal Catalog Lvl 2"
    description: "Product universal catalog on 2nd level"
    type: string
    sql: CASE WHEN REGEXP_EXTRACT(product_category_hierarchy,"[^/]+/([^/]+)/+") IS NOT NULL THEN REGEXP_EXTRACT(product_category_hierarchy,"[^/]+/([^/]+)/+")
              ELSE "Autre"
          END;;
  }


### KPI measures

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }

### Period Analysis:

  # The common parameters and filters are located in the parameters view file.
  # This dimension creates the interval related to the current period and the previous period.
  dimension: current_vs_previous {
    label: "Current vs Previous Period"
    description: "Compare current date period versus previous period"
    hidden: yes
    type: string
    sql: case when {% condition parameters.choose_date %} timestamp(${date_date}) {% endcondition %} then ' Current Period'
                when ${date_date} > (date_sub(date({% date_start parameters.choose_date %}),INTERVAL ${parameters.days_days_in_period} day ))
                and ${date_date} <= (date_sub(date({% date_end parameters.choose_date %}),INTERVAL ${parameters.days_days_in_period} day )) then 'Previous Period'
            end;;
  }

# This dimension creates the interval related to the current period and the previous year period.
  dimension: current_year_vs_previous_year {
    label: "Current Year vs Previous Year"
    description: "Compare current year period versus year"
    hidden: yes
    type: string
    sql:  case when {% condition parameters.choose_date %} timestamp(${date_date}) {% endcondition %} then 'Current Year '
                when ${date_date} > (date_sub(date({% date_start parameters.choose_date %}),INTERVAL 1 year ))
                 and ${date_date} <= (date_sub(date({% date_end parameters.choose_date %}),INTERVAL 1 year )) then 'Previous Year'
           end ;;
  }


  # This dimension is the one that should be selected in the explore/dashboard tile that's depend on the user's choice will show
  # the comparison between Previous Period or Previous Year Same period.
  dimension: selected_period {
    view_label: "Parameters"
    description: "Select date comparison type"
    type: string
    sql: {% if parameters.compare_to._parameter_value == 'previous_period' %} ${current_vs_previous}
          {% elsif parameters.compare_to._parameter_value == 'previous_year' %} ${current_year_vs_previous_year}
          {% else %} ${current_vs_previous}
          {% endif %}
     ;;
  }

  ###---- End of Period Analysis

}
