connection: "galerie_lafayette_bq"

include: "/explores/*.explore"
include: "/views/*.lkml"

### Customized Datagroup
datagroup: search_console_standard_check {
  label : "New days added"
  description: "Triggered when new days is added to searchconsole_standard views and kept for 1 day"
  sql_trigger: SELECT MAX(date) FROM search_console_standard;;
  max_cache_age: "24 hours"
}

datagroup: ga_item_revenu_scope_check {
  label : "New days added"
  description: "Triggered when new days is added to ga_item_revenu_scope views and kept for 1 day"
  sql_trigger: SELECT MAX(date) FROM ga_item_revenu_scope;;
  max_cache_age: "24 hours"
}

datagroup: ga_landing_page_scope_check {
  label : "New days added"
  description: "Triggered when new days is added to ga_landing_page_scope views and kept for 1 day"
  sql_trigger: SELECT MAX(date) FROM ga_landing_page_scope;;
  max_cache_age: "24 hours"
}
