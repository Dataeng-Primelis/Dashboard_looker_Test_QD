view: parameters {

  filter: choose_date{
    type: date
  }

  parameter: previous_comparison {
    label: "Period Comparison Selector"
    description: "Choose to compare your selected period to the same date range that precedes it, or to the same period in the year prior to it."
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
    hidden: yes
    type: duration
    sql_start:{% date_start choose_date %}  ;;
    sql_end: {% date_end choose_date %} ;;
  }
}
