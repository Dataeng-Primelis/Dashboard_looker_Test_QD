include: "/views/*"

explore: ga_landing_page_scope {
  persist_with: ga_landing_page_scope_check
  label: "GA Landing Page"
  description: "Google Analytics landing Page Data"
  # join: parameters {}

  fields: [ALL_FIELDS*
    ,-ga_landing_page_scope.exclud_metrics*]
}
