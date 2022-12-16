view: ga_landing_page_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*` ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    type: string
    sql: concat(${date_date},${source},${medium},${device_category},${landing_page_path}) ;;
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

### Customized dimensions
  dimension: ga_univers_catalog_lv1 {
    label: "Universal Catalog Lvl 1"
    description: "Universal catalog on 1st level : Femme / Homme / Enfant / Beauté / Maison / Autre"
    type: string
    sql: CASE WHEN REGEXP_CONTAINS(${landing_page_path},"(.*/c/femme.*|.*/h/femme.*)") THEN "Femme"
              WHEN REGEXP_CONTAINS(${landing_page_path},"/(c|h)/homme") THEN "Homme"
              WHEN REGEXP_CONTAINS(${landing_page_path},"/(c|h)/enfant") THEN "Enfant"
              WHEN REGEXP_CONTAINS(${landing_page_path},"/(c|h)/beaute") THEN "Beauté"
              WHEN REGEXP_CONTAINS(${landing_page_path},"/(c|h)/maison") THEN "Maison"
              ELSE "Autre"
          END;;
  }

  dimension: ga_univers_catalog_lv2 {
    label: "Universal Catalog Lvl 2"
    description: "Universal catalog on 2nd level"
    type: string
    sql: CASE WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/vetements") THEN "Vêtements"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/chaussures") THEN "Chaussures"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/sacs") THEN "Sacs & Bagages"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/accessoires") THEN "Accessoires"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/bain") THEN "Bain & Maillots"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/lingerie") THEN "Lingerie"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/femme/homewear") THEN "Homewear"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/vetements.*") THEN "Vêtements"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/chaussures.*") THEN "Chaussures"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/sacs.*") THEN "Sacs & Bagages"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/accessoires.*") THEN "Accessoires"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/bain.*") THEN "Bain & Maillots"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/sous-vetements.*") THEN "Lingerie"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/homme/homewear.*") THEN "Homewear"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/enfant/garcon") THEN "Garçon"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/enfant/fille") THEN "Fille"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/enfant/bebe") THEN "Bébé"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/enfant/puericulture") THEN "Puériculture"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/enfant/jeux-jouets") THEN "Jeux & jouets"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/parfum") THEN "Parfum"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/soin") THEN "Soin - Générique"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/soin/soin-du-visage") THEN "Soin du visage"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/soin/soins-du-corps") THEN "Soin du corps"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/soin/soins-cheveux") THEN "Soin des cheveux"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/soin/solaires") THEN "Soin solaire"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/bebe") THEN "Maquillage"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/les+coffrets+beaute") THEN "Les Coffrets Beauté"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/beaute/parfum/bougies-parfumees") THEN "Bougies Parfumées"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/accessoires+de+soin") THEN "Accessoires de soin"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/complements+alimentaires") THEN "Compléments alimentaires"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/linge") THEN "Linge"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/meubles") THEN "Meubles"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/luminaires") THEN "Luminaires"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/cuisine") THEN "Cuisine & Arts de la table"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/electromenager") THEN "Électroménager"
              WHEN REGEXP_CONTAINS(landing_page_path,"/c/maison/multimedia") THEN "Multimédia"
              ELSE "Autre"
          END;;
  }

### KPI measures

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_bounces {
    label: "Total Bounces"
    description: "Sum of Total Bounces"
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
