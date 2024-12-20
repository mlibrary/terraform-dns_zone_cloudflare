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

  allow_overwrite = var.allow_overwrite
}

resource "cloudflare_record" "mx" {
  for_each = var.mx_records
  zone_id  = data.cloudflare_zone.zone.id
  type     = "MX"
  name     = each.value.name
  value    = each.value.target
  priority = each.value.priority
  ttl      = 3600

  allow_overwrite = var.allow_overwrite
}

resource "cloudflare_record" "ns" {
  for_each = local.ns_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "NS"
  name     = each.value.name
  value    = each.value.target
  ttl      = 3600

  allow_overwrite = var.allow_overwrite
}

resource "cloudflare_record" "cname" {
  for_each = local.cname_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "CNAME"
  name     = each.value.name
  value    = each.value.target
  proxied  = each.value.proxied
  ttl      = 1

  allow_overwrite = var.allow_overwrite
}

resource "cloudflare_record" "a" {
  for_each = local.a_records_map
  zone_id  = data.cloudflare_zone.zone.id
  type     = "A"
  name     = each.value.name
  value    = each.value.target
  proxied  = each.value.proxied
  ttl      = 1

  allow_overwrite = var.allow_overwrite
}
