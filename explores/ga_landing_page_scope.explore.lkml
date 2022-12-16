include: "/views/*"

explore: ga_landing_page_scope {
  persist_with: ga_landing_page_scope_check
  label: "GA Landing Page"
  description: "Google Analytics landing Page Data"
  join: parameters {}
}
