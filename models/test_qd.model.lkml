connection: "dossier_-_bigquery"

datagroup: test_qd_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_qd_default_datagroup
