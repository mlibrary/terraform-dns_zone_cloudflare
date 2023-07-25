locals {
  a_records_map = { for i in flatten([
    for name, targets in var.a_records : [
      for target in flatten([targets]) : {
        name : name
        target : target
      }
    ]
    ]) :
    "${i.name}::${i.target}" => i
  }

  ns_records_map = { for i in flatten([
    for name, targets in var.ns_records : [
      for target in flatten([targets]) : {
        name : name
        target : target
      }
    ]
    ]) :
    "${i.name}::${i.target}" => i
  }

  txt_records_map = { for i in flatten([
    for name, targets in var.txt_records : [
      for target in flatten([targets]) : {
        name : name
        target : target
      }
    ]
    ]) :
    "${i.name}::${i.target}" => i
  }

  cname_records_map = merge(
    { for i in flatten([
      for target, names in var.cnames_many_to_one : [
        for name in flatten([names]) : {
          name : name
          target : target
          was : "${name}::${target}"
        }
      ]
      ]) :
      "${i.name}" => i
    },

    { for name, target in var.cname_records :
      "${name}" => {
        name : name
        target : target
        was : "${name}::${target}"
      }
    }
  )
}
