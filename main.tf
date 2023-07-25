data "cloudflare_zone" "zone" {
  name = var.zone
}

resource "cloudflare_record" "txt" {
  for_each = local.txt_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "TXT"
  name     = each.value.name
  value    = each.value.target
  ttl      = 1 # this means use the Cloudflare default, not literally one second
}

resource "cloudflare_record" "mx" {
  for_each = var.mx_records
  zone_id  = data.cloudflare_zone.zone.id
  type     = "MX"
  name     = each.value.name
  value    = each.value.target
  priority = each.value.priority
  ttl      = 3600
}

resource "cloudflare_record" "ns" {
  for_each = local.ns_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "NS"
  name     = each.value.name
  value    = each.value.target
  ttl      = 3600
}

resource "cloudflare_record" "cname" {
  for_each = local.cname_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "CNAME"
  name     = each.value.name
  value    = each.value.target
  ttl      = 1
}
# moved {
#   for_each = local.cname_records_map
#   from     = cloudflare_record.cname[each.value.was]
#   to       = cloudflare_record.cname[each.value.name]
# }

resource "cloudflare_record" "a" {
  for_each = local.a_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "A"
  name     = each.value.name
  value    = each.value.target
  ttl      = 1
}
