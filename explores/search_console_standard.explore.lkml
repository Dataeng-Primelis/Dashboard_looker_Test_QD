include: "/views/*"

explore: search_console_standard {
  persist_with: search_console_standard_check
  label: "Google Search Console"
  description: "Google Search Console Data"

  fields: [ALL_FIELDS*
    ,-search_console_standard.exclud_metrics*]
}
