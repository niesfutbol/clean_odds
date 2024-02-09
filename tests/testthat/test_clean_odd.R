odd_file_path <- "/workdir/tests/data/apapuesta_135_881972.json"
full_file <- rjson::fromJSON(file = odd_file_path)
match_id <- 881972
update_odd <- "2023-01-28"
house_bets <- "Bet365"
name_bet <- "Match Winner"
value_bet <- c("Home", "Draw", "Away")
odd_bet <- c(6.50, 4.33, 1.50)
expected <- tibble::tibble(
  "match_id" = match_id,
  "update_odd" = update_odd,
  "value_bet" = value_bet,
  "odd_bet" = odd_bet,
  "name_bet" = name_bet,
  "house_bets" = house_bets
)
describe("Match 881972", {
  obtained <- extract_bets(full_file)
  expect_equal(obtained, expected)
})
