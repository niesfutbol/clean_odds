extract_bets <- function(full_file) {
  match_winner <- .extract_match_winner(full_file)
  expected <- tibble::tibble(
    "match_id" = .extract_match_id_bets(full_file),
    "update_odd" = .extract_update_odd_bets(full_file),
    "value_bet" = .extract_value_bet(match_winner),
    "odd_bet" = .extract_odd_bet(match_winner),
    "name_bet" = .extract_name_bets(full_file),
    "house_bets" = .extract_house_bets(full_file)
  )
  return(expected)
}

.extract_match_winner <- function(full_file) {
  full_file[["bookmakers"]][[1]][["bets"]][[1]][["values"]]
}

.extract_house_bets <- function(full_file) {
  return(full_file[["bookmakers"]][[1]][["name"]])
}

.extract_name_bets <- function(full_file) {
  full_file[["bookmakers"]][[1]][["bets"]][[1]][["name"]]
}

.extract_match_id_bets <- function(full_file) {
  full_file[["fixture"]][["id"]]
}

.extract_update_odd_bets <- function(full_file) {
  full_file[["update"]] |> stringr::str_sub(1, 10)
}

.extract_odd_bet <- function(match_winner) {
  as.double(purrr::map_chr(match_winner, ~ .$odd))
}

.extract_value_bet <- function(match_winner) {
  purrr::map_chr(match_winner, ~ .$value)
}
