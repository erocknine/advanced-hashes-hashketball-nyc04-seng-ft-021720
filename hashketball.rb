def game_hash
  { 
    home: 
      {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1},
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7},
        { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15},
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5},
        { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1}] 
      },
    away:
      {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2},
        { player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10},
        { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5},
        { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0},
        { player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12}]
    }
  }
end


def num_points_scored (search_player)
  game_hash.each do |home_or_away, team|
    team[:players].each do |player, data|
      if player[:player_name] == search_player
        return player[:points]
      end
    end
  end
end

def shoe_size (search_player)
  game_hash.each do |home_or_away, team|
    team[:players].each do |player, data|
      if player[:player_name] == search_player
        return player[:shoe]
      end
    end
  end
end

def team_colors (search_team)
  game_hash.each do |home_or_away, team|
    if team[:team_name] == search_team
      return team[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.map do |home_or_away, team|
    team_names << team[:team_name]
  end
  team_names
end  

def player_numbers (search_team)
  numbers = []
  game_hash.each do |home_or_away, team|
    team.each do |team_attributes, team_value|
      if team_value == search_team
        team[:players].each do |player, data|
          numbers << player[:number]
        end
      end
    end
  end
  numbers
end

def player_stats (search_player)
  hash = {}
  game_hash.each do |home_or_away, team|
    team.each do |team_attributes, team_value|
      team[:players].each do |player, data|
        if player[:player_name] == search_player
          hash = player
          hash.delete(:player_name)
        end
      end
    end
  end
  hash
end

def big_shoe_rebounds
  players = []
  game_hash.each do |home_or_away, team|
    players << team[:players].max_by{|k| k[:shoe]}
  end
  if players[0][:shoe] > players[1][:shoe]
    return players[0][:rebounds]
  else
    return players[1][:rebounds]
  end
end

def most_points_scored
  players = []
  game_hash.each do |home_or_away, team|
    players << team[:players].max_by{|k| k[:points]}
  end
  if players[0][:points] > players[1][:points]
    return players[0][:player_name]
  else
    return players[1][:player_name]
  end
end
  
def winning_team
  both_teams = {}
  game_hash.each do |home_or_away, team|
    if !both_teams[team[:team_name]]
      both_teams[team[:team_name]] = 0
    end
    team[:players].each do |player, data|
      both_teams[team[:team_name]] += player[:points]
    end
  end
  both_teams.max_by{|team, score| score}.first
end

def player_with_longest_name
  player_names = []
  game_hash.each do |home_or_away, team|
    team[:players].each do |player, data|
      player_names << player[:player_name]
    end
  end
  p player_names.max_by{|name| name.length}
end

def long_name_steals_a_ton?
  longest_name = []
  most_steals = []
  game_hash.each do |home_or_away, team|
    most_steals << team[:players].max_by{|k| k[:steals]}[:player_name]
    team[:players].each do |player, data|
      longest_name << player[:player_name]
    end
  end
  most_steals = most_steals.sort_by{|name| name.length}
  p most_steals
  p longest_name = longest_name.max_by{|name| name.length}
end


# if (player[:player_name].length == player[:player_name].max_by{|name| name.length}.first) == (most_steals << player[:steals].max_by{|k| k[:steals]})
