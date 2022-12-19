include: "/views/common_metrics.view"
view: ga_landing_page_scope {
  sql_table_name:  `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*` ;;
  extends: [common_metrics]


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
  dimension: source_medium_group {
    label: "Source Medium Group"
    description: "Source Medium: SEO / Autre"
    type: string
    sql: CASE WHEN REGEXP_CONTAINS(${source},"google") AND REGEXP_CONTAINS(${medium},"organic") THEN "SEO"
              ELSE "Autre"
          END;;
  }

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
