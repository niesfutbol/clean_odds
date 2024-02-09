match_id <- 881972
update_odd <- "2023-01-28"
house_bets <- "Bet365"
name_bet <- "Match Winner"

extract_bets <- function(full_file) {
  match_winner <- full_file[["bookmakers"]][[1]][["bets"]][[1]][["values"]]
  expected <- tibble::tibble(
    "match_id" = full_file[["fixture"]][["id"]],
    "update_odd" = full_file[["update"]] |> stringr::str_sub(1, 10),
    "value_bet" = purrr::map_chr(match_winner, ~ .$value),
    "odd_bet" = as.double(purrr::map_chr(match_winner, ~ .$odd)),
    "name_bet" = full_file[["bookmakers"]][[1]][["bets"]][[1]][["name"]],
    "house_bets" = full_file[["bookmakers"]][[1]][["name"]]
  )
  return(expected)
}
