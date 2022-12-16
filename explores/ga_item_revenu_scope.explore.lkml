include: "/views/*"

explore: ga_item_revenu_scope {
  persist_with: ga_item_revenu_scope_check
  label: "GA Product"
  description: "Google Analytics Product Data"
  always_filter: {
    filters: [ga_item_revenu_scope.pk: "1"]
  }
}
