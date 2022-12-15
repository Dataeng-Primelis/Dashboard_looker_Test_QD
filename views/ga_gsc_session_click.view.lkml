view: ga_gsc_session_click {
  derived_table: {
    sql: SELECT coalesce(ga.date,gsc.date) date
            , session
            , clicks
            FROM (
              SELECT date ,sum(session) session
              FROM `galeries-lafayette-dashboard.source_supermetrics_dashboard_seo.GA_GA_LANDINGPAGE_SCOPE_LANDING_PAG_*`
              GROUP BY 1) as ga
            , (
              SELECT date, sum(clicks) clicks
              FROM `galeries-lafayette-dashboard.source_supermetrics.SEARCHCONSOLE_STANDARD_*`
              GROUP BY 1) as gsc
            where ga.date=gsc.date
             ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }

  dimension_group: date {
    label: "Date"
    description: "Date (YYYY-MM-DD)"
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

  dimension: session {
    type: number
    sql: ${TABLE}.session ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  # set: detail {
  #   fields: [date, session, clicks]
  # }
}
