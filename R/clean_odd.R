extract_bets <- function(full_file) {
  match_winner <- full_file[["bookmakers"]][[1]][["bets"]][[1]][["values"]]
  expected <- tibble::tibble(
    "match_id" = full_file[["fixture"]][["id"]],
    "update_odd" = full_file[["update"]] |> stringr::str_sub(1, 10),
    "value_bet" = purrr::map_chr(match_winner, ~ .$value),
    "odd_bet" = .extract_odd_bet(match_winner),
    "name_bet" = full_file[["bookmakers"]][[1]][["bets"]][[1]][["name"]],
    "house_bets" = .extract_house_bets(full_file)
  )
  return(expected)
}

.extract_house_bets <- function(full_file) {
  return(full_file[["bookmakers"]][[1]][["name"]])
}

.extract_odd_bet <- function(match_winner) {
  as.double(purrr::map_chr(match_winner, ~ .$odd))
}
