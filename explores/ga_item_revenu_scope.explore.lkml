include: "/views/*"

explore: ga_item_revenu_scope {
  label: "GA Product"
  description: "Google Analytics Product Data"
  always_filter: {
    filters: [ga_item_revenu_scope.pk: "1"]
  }
}
