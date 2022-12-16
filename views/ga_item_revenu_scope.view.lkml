view: ga_item_revenu_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_ITEMREVENU_SCOPE_PRODUCT_*`;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${date_date},${device_category},${medium},${source},${product_category_hierarchy},${product_name}) ;;
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
    drill_fields: []
  }

  measure: total_item_revenues {
    label: "Total Product Revenues"
    description: "Sum of Total Product Item Revenues"
    type: sum
    sql: ${TABLE}.item_revenue ;;
    value_format_name: eur_0
  }

}
