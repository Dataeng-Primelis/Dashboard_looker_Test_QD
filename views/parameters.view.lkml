view: parameters {

  filter: choose_date{
    type: date
  }

  parameter: previous_comparison {
    label: "Comparaison Date Range"
    description: "Compare your selected period to the same period in the previous year"
    type: unquoted
    default_value: "previous_year"
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
