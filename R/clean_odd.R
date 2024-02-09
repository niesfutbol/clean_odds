match_id <- 881972
update_odd <- "2023-01-28"
house_bets <- "Bet365"
name_bet <- "Match Winner"

extract_bets <- function(full_file) {
  match_winner <- full_file[["bookmakers"]][[1]][["bets"]][[1]][["values"]]
  expected <- tibble::tibble(
    "match_id" = match_id,
    "update_odd" = update_odd,
    "value_bet" = purrr::map_chr(match_winner, ~ .$value),
    "odd_bet" = as.double(purrr::map_chr(match_winner, ~ .$odd)),
    "name_bet" = name_bet,
    "house_bets" = house_bets
  )
  return(expected)
}
