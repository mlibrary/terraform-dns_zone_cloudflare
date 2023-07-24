variable "zone" {
  description = "name of zone"
  type        = string
}

variable "txt_records" {
  description = "Map of TXT records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "mx_records" {
  description = "Map of MX records. Keys are just titles, values is expected to be a map containing name, target, and priority."
  type        = map(any)
  default     = {}
}

variable "ns_records" {
  description = "Map of NS records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "a_records" {
  description = "Map of A records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "cname_records" {
  description = "Map of CNAME records. Keys are the record names, values are String or String[] containing record data."
  type        = any
  default     = {}
}

variable "cnames_many_to_one" {
  description = "REVERSE map of CNAME records. Keys are the record *data*, values are String or String[] containing record name. This allows for very terse creation of many CNAMEs with the same target."
  type        = any
  default     = {}
}
