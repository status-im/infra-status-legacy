output "hosts" {
  value = merge(
    module.node.hosts,
    module.db.hosts,
  )
}
