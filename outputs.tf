output "zone" {
  value = data.cloudflare_zone.zone
}

output "txt" { value = cloudflare_record.txt }
output "mx" { value = cloudflare_record.mx }
output "ns" { value = cloudflare_record.ns }
output "cname" { value = cloudflare_record.cname }
output "a" { value = cloudflare_record.a }

output "debug" {
  value = {
    a_records_map     = local.a_records_map
    ns_records_map    = local.ns_records_map
    txt_records_map   = local.txt_records_map
    cname_records_map = local.cname_records_map
  }
}
