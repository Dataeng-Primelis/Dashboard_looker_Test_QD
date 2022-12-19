view: parameters {

  filter: choose_date{
    type: date
  }

  parameter: compare_to {
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
    hidden: yes
    type: duration
    sql_start:{% date_start choose_date %}  ;;
    sql_end: {% date_end choose_date %} ;;
  }
}
