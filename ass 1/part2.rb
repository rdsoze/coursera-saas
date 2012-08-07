class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_tournament_winner(tournaments)
  winner = []
  tournaments.each do |t|
    winner << tournament_winner(t)
  end
  (winner.count == 1) ? (winner[0]) : rps_tournament_winner([winner])
end

def tournament_winner(tournament)
  winner = []
  tournament.each do |game|
    winner << rps_game_winner(game)
  end
  (winner.count == 1) ? (winner[0]) : tournament_winner([winner])
end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |p|
    raise NoSuchStrategyError unless p[1].match(/\A(R|P|S)\Z/i)  
  end
  return game.first if game.first[1] == game.last[1]
  apply_rules(game)
end

def apply_rules(game)
  beats = {'R' => 'S', 'S' => 'P', 'P' => 'R'}
  if (beats[game.first[1]] == game.last[1]) || (game.first[1] == game.last[1])
    return game.first
  else
    return game.last
  end
end