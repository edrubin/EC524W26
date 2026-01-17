# Load packages
pacman::p_load(here, data.table, collapse, fst, janitor)
# Load, filter, and save sales data
fst::write_fst(
  x =
    here('projects/project-000/assessor-residential-sales.fst') |>
    fst::read_fst(as.data.table = TRUE) |>
    janitor::clean_names() |>
    fsubset(property_class %in% c(202:212, 234, 278, 295)),
  path = here('projects/project-000/sales-data.fst'),
  compress = 100
)
