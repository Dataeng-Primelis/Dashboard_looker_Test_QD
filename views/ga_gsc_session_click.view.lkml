view: ga_gsc_session_click {
  derived_table: {
    sql: SELECT coalesce(ga.date,gsc.date) date
            , session
            , clicks
            FROM (
              SELECT date ,sum(session) session
              FROM `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*`
              WHERE source = "google" AND medium = "organic"
              GROUP BY 1) as ga
            LEFT JOIN (
              SELECT date, sum(clicks) clicks
              FROM `galeries-lafayette-dashboard.source_supermetrics.SEARCHCONSOLE_STANDARD_*`
              GROUP BY 1) as gsc
            ON ga.date=gsc.date
             ;;
    datagroup_trigger: ga_gsc_sc_check
  }


  dimension_group: date {
    label: "Sessions Date"
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

  dimension: session {
    label: "Sessions"
    description: "The number of sessions"
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: clicks {
    label: "Clicks"
    description: "The number of clicks"
    type: number
    sql: ${TABLE}.clicks ;;
  }

### KPI measures

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_sessions {
    label: "Total Sessions"
    description: "Sum of Total Sessions"
    type: sum
    sql: ${TABLE}.session ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    description: "Sum of Total Clicks"
    type: sum
    sql: ${TABLE}.clicks ;;
  }

}
