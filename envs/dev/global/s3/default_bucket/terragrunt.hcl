terraform {
  source = "../../../../../modules/s"
}

include {
  path = find_in_parent_folders()
}
