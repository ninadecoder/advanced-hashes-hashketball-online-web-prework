def game_hash
  game = {
    :home => {
      :team_name => ["Brooklyn Nets"],
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      }
    },

    :away => {
      :team_name => ["Charlotte Hornets"],
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        },
      }
    }
  }

  game

end

def num_points_scored(name)
   points = nil
   game_hash.each do |team, attributes|
     game_hash[team][:players].each do |key, value|
       if name == key
         points = game_hash[team][:players][name][:points]
       end
     end
   end
   points
 end

def shoe_size(name)
   shoe = nil
   game_hash.each do |team, attributes|
     game_hash[team][:players].each do |key, value|
       if name == key
         shoe = game_hash[team][:players][name][:shoe]
       end
     end
   end
   shoe
 end

def team_colors_for(team, game)
  game.each do |team_name, team_info|
    if team_name.to_s == team
      tcolors = team_info[:colors].join(" ")
      puts "The #{team_name}' team colors are #{tcolors}."
    end
  end
end
 
def team_names
	team_names = []
	game_hash.each do |location, loc_data|
		team_names << loc_data[:team_name]
	end
	team_names
end

def player_numbers(team)

    if game_hash[:home][:team_name] == team
     game_hash[:home][:players][:number]
   elsif game_hash[:away][:team_name] == team
     game_hash[:away][:players][:number]
   end

end

def player_stats(player)
   stats_hash = {}
   game_hash.each do |team, attributes|
     game_hash[team].each do |attribute, value|
       if attribute == :players
         game_hash[team][:players].each do |name, stats|
           if name == player
             stats_hash = game_hash[team][:players][name]
           end
         end
       end
     end
   end
   stats_hash
 end

def big_shoe_rebounds
   biggest_shoe = 0
   player_w_biggest_shoe = nil
   player_rebounds = nil
   game_hash.each do |team, attributes|
     game_hash[team].each do |attribute, value|
       if attribute == :players
         game_hash[team][:players].each do |player, stats|
           game_hash[team][:players][player].each do |stat, val|
             if stat == :shoe && val > biggest_shoe
               biggest_shoe = val
               player_w_biggest_shoe = player
             end
           end
           if player == player_w_biggest_shoe
             player_rebounds = game_hash[team][:players][player][:rebounds]
           end
         end
       end
     end
   end
   player_rebounds
 end

def most_points_scored
   most_points = 0
   mvp = ''
   game_hash.each do |home_away, keys|
     keys[:players].each do |player|
       points = player[:points]
       if points > most_points
         most_points = points
         mvp = player[:player_name]
       end
     end
   end
   mvp
 end

def winning_team
   total_points = 0
   win_team = ''
   game_hash.each do |home_away, keys|
     team_points = 0
     team_name = game_hash[home_away][:team_name]
     keys[:players].each do |player|
       points = player[:points]
       team_points += points
     end
     win_team, total_points = team_name, team_points if team_points > total_points
   end
   return win_team
 end

def player_with_longest_name
   longest_name_length = 0
   player_with_longest_name = "player"
   game_hash.each do |location, team|
     team.each do |attribute, data|
       if attribute == :players
         data.each do |player, stats|
           if player.length > longest_name_length
             longest_name_length = player.length
             player_with_longest_name = player
           end
         end
       end
     end
   end
   player_with_longest_name
 end

def long_name_steals_a_ton?
   best_steals = 0
   player_with_best_steals = "player"
   game_hash.each do |location, team|
     team.each do |attribute, data|
       if attribute == :players
         data.each do |player, stats|
           if stats[:steals] > best_steals
             best_steals = stats[:steals]
             player_with_best_steals = player
           end
         end
       end
     end
   end
   if player_with_best_steals == player_with_longest_name
     return true
   end 
end