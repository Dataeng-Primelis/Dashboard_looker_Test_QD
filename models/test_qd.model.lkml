connection: "galerie_lafayette_bq"

include: "/explores/*.explore"
include: "/views/*.lkml"

### Customized Datagroup
datagroup: ga_gsc_sc_check {
  label : "New days added"
  description: "Triggered when new days is added to ga_gsc_session_click views and kept for 1 day"
  sql_trigger: SELECT MAX(date) FROM ga_gsc_session_click;;
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
